.. _internals-replication:

--------------------------------------------------------------------------------
Server startup with replication
--------------------------------------------------------------------------------

In addition to the recovery process described above, the server must take
additional steps and precautions if :ref:`replication <replication>` is enabled.

Once again the startup procedure is initiated by the ``box.cfg{}`` request.
One of the ``box.cfg`` parameters may be
:ref:`replication <cfg_replication-replication>` that specifies replication
source(-s). We will refer to this replica, which is starting up due to ``box.cfg``,
as the "local" replica to distinguish it from the other replicas in a replica set,
which we will refer to as "distant" replicas.

*#1. If there is no snapshot .snap file and the 'replication' parameter is empty and cfg.read_only=false*: |br|
then the local replica assumes it is an unreplicated "standalone" instance, or is
the first replica of a new replica set. It will generate new UUIDs for
itself and for the replica set. The replica UUID is stored in the ``_cluster`` space
(unless the replica is :ref:`anonymous <cfg_replication-replication_anon>`); the
replica set UUID is stored in the ``_schema`` space. Since a snapshot contains all the
data in all the spaces, that means the local replica's snapshot will contain the
replica UUID and the replica set UUID. Therefore, when the local replica restarts on
later occasions, it will be able to recover these UUIDs when it reads the .snap
file.

*#1a. If there is no snapshot .snap file and the 'replication' parameter is empty and cfg.read_only=true*: |br|
When an instance is starting with ``box.cfg({... read_only = true})``, it cannot be the
first replica of a new replica set because the first replica must be a master.
Therefore an error message will occur: ER_BOOTSTRAP_READONLY.
To avoid this, change the setting for this (local) instance to ``read_only = false``,
or ensure that another (distant) instance starts first and has the local instance's
UUID in its _cluster space. In the latter case, if ER_BOOTSTRAP_READONLY still
occurs, set the local instance's
:ref:`box.replication_connect_timeout <cfg_replication-replication_connect_timeout>`
to a larger value.

*#2. If there is no snapshot .snap file and the 'replication' parameter is not empty
and the ``_cluster`` space contains no other replica UUIDs*: |br|
then the local replica assumes it is not a standalone instance, but is not yet part
of a replica set. It must now join the replica set. It will send its replica UUID to the
first distant replica which is listed in ``replication`` and which will act as a
master. This is called the "join request". When a distant replica receives a join
request, it will send back:

(1) the distant replica's replica set UUID,
(2) the contents of the distant replica's .snap file. |br|
    When the local replica receives this information, it puts the replica set UUID in
    its ``_schema`` space, puts the distant replica's UUID and connection information
    in its ``_cluster`` space, and makes a snapshot containing all the data sent by
    the distant replica. Then, if the local replica has data in its WAL .xlog
    files, it sends that data to the distant replica. The distant replica will
    receive this and update its own copy of the data, and add the local replica's
    UUID to its ``_cluster`` space.

*#3. If there is no snapshot .snap file and the 'replication' parameter is not empty
and the ``_cluster`` space contains other replica UUIDs*: |br|
then the local replica assumes it is not a standalone instance, and is already part
of a replica set. It will send its replica UUID and replica set UUID to all the distant
replicas which are listed in ``replication``. This is called the "on-connect
handshake". When a distant replica receives an on-connect handshake: |br|

(1) the distant replica compares its own copy of the replica set UUID to the one in
    the on-connect handshake. If there is no match, then the handshake fails and
    the local replica will display an error.
(2) the distant replica looks for a record of the connecting instance in its
    ``_cluster`` space. If there is none, then the handshake fails. |br|
    Otherwise the handshake is successful. The distant replica will read any new
    information from its own .snap and .xlog files, and send the new requests to
    the local replica.

In the end ... the local replica knows what replica set it belongs to, the distant
replica knows that the local replica is a member of the replica set, and both replicas
have the same database contents.

.. _internals-vector:

*#4. If there is a snapshot file and replication source is not empty*: |br|
first the local replica goes through the recovery process described in the
previous section, using its own .snap and .xlog files. Then it sends a
"subscribe" request to all the other replicas of the replica set. The subscribe
request contains the server vector clock. The vector clock has a collection of
pairs 'server id, lsn' for every replica in the ``_cluster`` system space. Each
distant replica, upon receiving a subscribe request, will read its .xlog files'
requests and send them to the local replica if (lsn of .xlog file request) is
greater than (lsn of the vector clock in the subscribe request). After all the
other replicas of the replica set have responded to the local replica's subscribe
request, the replica startup is complete.

The following temporary limitations apply for versions 1.7 and 2.1:

* The URIs in the ``replication`` parameter should all be in the same order on all replicas.
  This is not mandatory but is an aid to consistency.
* The maximum number of entries in the ``_cluster`` space is 32. Tuples for
  out-of-date replicas are not automatically re-used, so if this 32-replica
  limit is reached, users may have to reorganize the ``_cluster`` space manually.
