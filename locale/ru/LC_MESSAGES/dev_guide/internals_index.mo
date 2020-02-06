��    m      �              �  |  �  #   j	     �	  "   �	  !   �	     �	     �	  "   
     /
  %  F
  >   l  �   �  /  U  �  �    U    �  �  �  �   ~  �   8  H     �   J  �   H  y     *  �     �  :   �  4  �  b   /  7  �  �   �   �   M!  �  �!  "   �#  (   �#  �  �#  4  �%  )   '  1  8'  �   j(  6   �(     4)  ~  D)    �.  �   �/  1  e0  �  �1  	   +3  T   53  J  �3     �;     �;    �;  �  >     �@  �   �B    �C  5  �D  !  �G  N   �H  N  *I  �   yJ     K  �  ,K     �L     �L  �  �L  ;   �O  Q   �O  )   $P  �   NP     �P     �P     �P     Q     Q  �  Q  �   �R     �S  B   �S  �  T  �  �U  �   xW  =   AX  S   X  �   �X     �Y  q   �Y  �  HZ  �   �\  �  b]     _    &_  �   2a  �  �a  ^  wc  �  �e  n  dg  "   �i    �i  v   q     �q      �q  �  �q     Js  G   Vs     �s  d   �s  .   "t  �  Qt    �u  #   	y     -y  2   Gy  B   zy  "   �y  4   �y  /   z     Ez    bz  Q   �~  �   �~  K  �  �  �    ��  �  6�    �  �   ��  �  �  �   ��  �  �  �  �  �   n�  �  Q�     �  �   )�  K  �  �   3�  N  ޘ  �   -�     �  �  -�  3   �  J   �     e�  K  ��  5   ҡ  C  �    L�  c   l�  !   Х  �  �  P  ��    ��  -  �  6  <�  )   s�  �   ��  �	  *�     �  ^   $�    ��  �  ��  �  ?�    /�    L�  �  e�  �  ��     ��  �  K�  �   �  ;   �  �  B�     ��  ,   ��  �  �  k   ��  ~   a�  :   ��  j  �     ��     ��     ��     ��     ��  .  ��  U  ��  .   8�  �   g�  �  ��  X  ��  ]  ��  {   Y�  �   ��  �  ��  +   W�  �   ��    K�    i�  >  ��  $   ��    ��  �   ��  �  ��  K  ^�  �  � �  [ 7   � M
  . �   | >   S Q   � .  �     �    *   � �   � �   �      * Insert      OP = '!'
      insert <argument> before <field_no>
    * Assign      OP = '='
      assign <argument> to field <field_no>.
      will extend the tuple if <field_no> == <max_field_no> + 1

0           2
+-----------+==========+===========+
|           |          |           |
|    OP     | FIELD_NO | ARGUMENT  |
| MP_FIXSTR |  MP_INT  | MP_OBJECT |
|           |          |           |
+-----------+==========+===========+
              MP_ARRAY

    Works on string fields:
    * Splice      OP = ':'
      take the string from space[key][field_no] and
      substitute <offset> bytes from <position> with <argument> $ hexdump 00000000000000000000.xlog **MP_ARR** - Array **MP_BIN** - MsgPack binary format **MP_FIXSTR** - Fixed size string **MP_INT** - Integer **MP_MAP** - Map **MP_OBJECT** - Any MsgPack object **MP_STRING** - String -- -- Value for <code> key in request can be:
-- User command codes
<iproto_select>       ::= 0x01
<iproto_insert>       ::= 0x02
<iproto_replace>      ::= 0x03
<iproto_update>       ::= 0x04
<iproto_delete>       ::= 0x05
<iproto_call_16>      ::= 0x06 /* as used in version 1.6 */
<iproto_auth>         ::= 0x07
<iproto_eval>         ::= 0x08
<iproto_upsert>       ::= 0x09
<iproto_call>         ::= 0x0a
-- Admin command codes
-- (including codes for replica-set initialization and master election)
<iproto_ping>         ::= 0x40
<iproto_join>         ::= 0x41 /* i.e. replication join */
<iproto_subscribe>    ::= 0x42
<iproto_request_vote> ::= 0x43

-- -- Value for <code> key in response can be:
<iproto_ok>           ::= 0x00
<iproto_type_error>   ::= 0x8XXX /* where XXX is a value in errcode.h */ -- replication codes
<join>      ::= 0x41
<subscribe> ::= 0x42 -- replication keys
<server_id>     ::= 0x02
<lsn>           ::= 0x03
<timestamp>     ::= 0x04
<server_uuid>   ::= 0x24
<cluster_uuid>  ::= 0x25
<vclock>        ::= 0x26 -- user keys
<iproto_sync>          ::= 0x01
<iproto_schema_id>     ::= 0x05  /* also known as schema_version */
<iproto_space_id>      ::= 0x10
<iproto_index_id>      ::= 0x11
<iproto_limit>         ::= 0x12
<iproto_offset>        ::= 0x13
<iproto_iterator>      ::= 0x14
<iproto_key>           ::= 0x20
<iproto_tuple>         ::= 0x21
<iproto_function_name> ::= 0x22
<iproto_username>      ::= 0x23
<iproto_expr>          ::= 0x27 /* also known as expression */
<iproto_ops>           ::= 0x28
<iproto_data>          ::= 0x30
<iproto_error>         ::= 0x31 0            3 4                                         17
+-------------+========+============+===========+=========+
|             |        |            |           |         |
| 0xd5ba0bab  | LENGTH | CRC32 PREV | CRC32 CUR | PADDING |
|             |        |            |           |         |
+-------------+========+============+===========+=========+
  MP_FIXEXT2    MP_INT     MP_INT       MP_INT      ---

+============+ +===================================+
|            | |                                   |
|   HEADER   | |                BODY               |
|            | |                                   |
+============+ +===================================+
    MP_MAP                     MP_MAP 0           2
+-----------+==========+==========+========+==========+
|           |          |          |        |          |
|    ':'    | FIELD_NO | POSITION | OFFSET | ARGUMENT |
| MP_FIXSTR |  MP_INT  |  MP_INT  | MP_INT |  MP_STR  |
|           |          |          |        |          |
+-----------+==========+==========+========+==========+
                         MP_ARRAY 0    X
+----+
|    | - X + 1 bytes
+----+
 TYPE - type of MsgPack value (if it is a MsgPack object)

+====+
|    | - Variable size MsgPack object
+====+
 TYPE - type of MsgPack value

+~~~~+
|    | - Variable size MsgPack Array/Map
+~~~~+
 TYPE - type of MsgPack value :code:`<key>` holds the user name. :code:`<tuple>` must be an array of 2 fields: authentication mechanism ("chap-sha1" is the only supported mechanism right now) and password, encrypted according to the specified mechanism. Authentication in Tarantool is optional, if no authentication is performed, session user is 'guest'. The instance responds to authentication packet with a standard response with 0 tuples. <type>\n                  SNAP\n or XLOG\n
<version>\n               currently 0.13\n
Server: <server_uuid>\n   where UUID is a 36-byte string
VClock: <vclock_map>\n    e.g. {1: 0}\n
\n A message is sent to the writer process running in the WAL thread, requesting that the change be recorded in the WAL. The instance switches to work on the next request until the write is acknowledged. A tool for reading .xlog files is Tarantool's :ref:`xlog module <xlog>`. After the file header come the data tuples. Tuples begin with a row marker ``0xd5ba0bab`` and the last tuple may be followed by an EOF marker ``0xd510aded``. Thus, between the file header and the EOF marker, there may be data tuples that have this form: An .xlog file always contains changes based on the primary key. Even if the client requested an update or delete using a secondary key, the record in the .xlog file will contain the primary key. An error message is present in the response only if there is an error; :code:`<error>` expects as value a msgpack string. Apart from a log sequence number and the data change request (formatted as in :ref:`Tarantool's binary protocol <box_protocol-iproto_protocol>`), each WAL record contains a header, some metadata, and then the data formatted according to `msgpack <https://en.wikipedia.org/wiki/MessagePack>`_ rules. For example, this is what the WAL file looks like after the first INSERT request ("s:insert({1})") for the sandbox database created in our :ref:`"Getting started" exercises <getting_started>`. On the left are the hexadecimal bytes that you would see with: Authentication Both :code:`<header>` and :code:`<body>` are msgpack maps: CALL BODY:

+=======================+==================+
|                       |                  |
|   0x22: FUNCTION_NAME |   0x21: TUPLE    |
| MP_INT: MP_STRING     | MP_INT: MP_ARRAY |
|                       |                  |
+=======================+==================+
                    MP_MAP CALL: CODE - 0x0a Similar to CALL_16, but -- like EVAL, CALL returns a list of values, unconverted CALL_16 BODY:

+=======================+==================+
|                       |                  |
|   0x22: FUNCTION_NAME |   0x21: TUPLE    |
| MP_INT: MP_STRING     | MP_INT: MP_ARRAY |
|                       |                  |
+=======================+==================+
                    MP_MAP CALL_16: CODE - 0x06 Call a stored function, returning an array of tuples. This is deprecated; CALL (0x0a) is recommended instead. Convenience macros which define hexadecimal constants for return codes can be found in `src/box/errcode.h <https://github.com/tarantool/tarantool/blob/1.10/src/box/errcode.h>`_ DELETE BODY:

+==================+==================+==================+
|                  |                  |                  |
|   0x10: SPACE_ID |   0x11: INDEX_ID |   0x20: KEY      |
| MP_INT: MP_INT   | MP_INT: MP_INT   | MP_INT: MP_ARRAY |
|                  |                  |                  |
+==================+==================+==================+
                          MP_MAP DELETE: CODE - 0x05 Delete a tuple Data persistence and the WAL file format ERROR: LEN + HEADER + BODY

0      5
+------++================+================++===================+
|      ||                |                ||                   |
| BODY ||   0x00: 0x8XXX |   0x01: SYNC   ||   0x31: ERROR     |
|HEADER|| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT: MP_STRING |
| SIZE ||                |                ||                   |
+------++================+================++===================+
 MP_INT                MP_MAP                      MP_MAP

Where 0xXXX is ERRCODE. EVAL BODY:

+=======================+==================+
|                       |                  |
|   0x27: EXPRESSION    |   0x21: TUPLE    |
| MP_INT: MP_STRING     | MP_INT: MP_ARRAY |
|                       |                  |
+=======================+==================+
                    MP_MAP EVAL: CODE - 0x08 Evaulate Lua expression Find the WAL file that was made at the time of, or after, the snapshot file. Read its log entries until the log-entry LSN is greater than the LSN of the snapshot, or greater than the LSN of the vinyl checkpoint. This is the recovery process's "start position"; it matches the current state of the engines. Find the latest snapshot file. Use its data to reconstruct the in-memory databases. Instruct the vinyl engine to recover to the latest checkpoint. For the memtx engine, re-create all secondary indexes. Greeting packet Hex dump of WAL file       Comment
--------------------       -------
58 4c 4f 47 0a             "XLOG\n"
30 2e 31 33 0a             "0.13\n" = version
53 65 72 76 65 72 3a 20    "Server: "
38 62 66 32 32 33 65 30 2d [Server UUID]\n
36 39 31 34 2d 34 62 35 35
2d 39 34 64 32 2d 64 32 62
36 64 30 39 62 30 31 39 36
0a
56 43 6c 6f 63 6b 3a 20    "Vclock: "
7b 7d                      "{}" = vclock value, initially blank
...                        (not shown = tuples for system spaces)
d5 ba 0b ab                Magic row marker always = 0xab0bbad5
19                         Length, not including length of header, = 25 bytes
00                           Record header: previous crc32
ce 8c 3e d6 70               Record header: current crc32
a7 cc 73 7f 00 00 66 39      Record header: padding
84                         msgpack code meaning "Map of 4 elements" follows
00 02                         element#1: tag=request type, value=0x02=IPROTO_INSERT
02 01                         element#2: tag=server id, value=0x01
03 04                         element#3: tag=lsn, value=0x04
04 cb 41 d4 e2 2f 62 fd d5 d4 element#4: tag=timestamp, value=an 8-byte "Float64"
82                         msgpack code meaning "map of 2 elements" follows
10 cd 02 00                   element#1: tag=space id, value=512, big byte first
21 91 01                      element#2: tag=tuple, value=1-element fixed array={1} INSERT/REPLACE BODY:

+==================+==================+
|                  |                  |
|   0x10: SPACE_ID |   0x21: TUPLE    |
| MP_INT: MP_INT   | MP_INT: MP_ARRAY |
|                  |                  |
+==================+==================+
                 MP_MAP INSERT:  CODE - 0x02 Inserts tuple into the space, if no tuple with same unique keys exists. Otherwise throw *duplicate key* error. If the recovery process is default (``force_recovery`` is ``false``), memtx can read data in the snapshot with all indexes disabled. First, all tuples are read into memory. Then, primary keys are built in bulk, taking advantage of the fact that the data is already sorted by primary key within each space. If the recovery process is non-default (``force_recovery`` is ``true``), Tarantool performs additional checking. Indexes are enabled at the start, and tuples are added one by one. This means that any unique-key constraint violations will be caught, and any duplicates will be skipped. Normally there will be no constraint violations or duplicates, so these checks are only made if an error has occurred. Internals It is an error to specify an argument of a type that differs from the expected type. JOIN:

In the beginning you must send initial JOIN
               HEADER                      BODY
+================+================++===================+
|                |                ||   SERVER_UUID     |
|   0x00: 0x41   |   0x01: SYNC   ||   0x24: UUID      |
| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT: MP_STRING |
|                |                ||                   |
+================+================++===================+
               MP_MAP                     MP_MAP

Then instance, which we connect to, will send last SNAP file by, simply,
creating a number of INSERTs (with additional LSN and ServerID)
(don't reply). Then it'll send a vclock's MP_MAP and close a socket.

+================+================++============================+
|                |                ||        +~~~~~~~~~~~~~~~~~+ |
|                |                ||        |                 | |
|   0x00: 0x00   |   0x01: SYNC   ||   0x26:| SRV_ID: SRV_LSN | |
| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT:| MP_INT: MP_INT  | |
|                |                ||        +~~~~~~~~~~~~~~~~~+ |
|                |                ||               MP_MAP       |
+================+================++============================+
               MP_MAP                      MP_MAP

SUBSCRIBE:

Then you must send SUBSCRIBE:

                              HEADER
+===================+===================+
|                   |                   |
|     0x00: 0x42    |    0x01: SYNC     |
|   MP_INT: MP_INT  |  MP_INT: MP_INT   |
|                   |                   |
+===================+===================+
|    SERVER_UUID    |    CLUSTER_UUID   |
|   0x24: UUID      |   0x25: UUID      |
| MP_INT: MP_STRING | MP_INT: MP_STRING |
|                   |                   |
+===================+===================+
                 MP_MAP

      BODY
+================+
|                |
|   0x26: VCLOCK |
| MP_INT: MP_INT |
|                |
+================+
      MP_MAP

Then you must process every query that'll came through other masters.
Every request between masters will have Additional LSN and SERVER_ID. MsgPack data types: Notation in diagrams OK:    LEN + HEADER + BODY

0      5                                          OPTIONAL
+------++================+================++===================+
|      ||                |                ||                   |
| BODY ||   0x00: 0x00   |   0x01: SYNC   ||   0x30: DATA      |
|HEADER|| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT: MP_OBJECT |
| SIZE ||                |                ||                   |
+------++================+================++===================+
 MP_INT                MP_MAP                      MP_MAP OP:
    Works only for integer fields:
    * Addition    OP = '+' . space[key][field_no] += argument
    * Subtraction OP = '-' . space[key][field_no] -= argument
    * Bitwise AND OP = '&' . space[key][field_no] &= argument
    * Bitwise XOR OP = '^' . space[key][field_no] ^= argument
    * Bitwise OR  OP = '|' . space[key][field_no] |= argument
    Works on any fields:
    * Delete      OP = '#'
      delete <argument> fields starting
      from <field_no> in the space[<key>]

0           2
+-----------+==========+==========+
|           |          |          |
|    OP     | FIELD_NO | ARGUMENT |
| MP_FIXSTR |  MP_INT  |  MP_INT  |
|           |          |          |
+-----------+==========+==========+
              MP_ARRAY On success, a confirmation is sent to the client. On failure, a rollback procedure is begun. During the rollback procedure, the transaction processor rolls back all changes to the database which occurred after the first failed change, from latest to oldest, up to the first failed change. All rolled back requests are aborted with :errcode:`ER_WAL_IO <ER_WAL_IO>` error. No new change is applied while rollback is in progress. When the rollback procedure is finished, the server restarts the processing pipeline. Once a greeting is read, the protocol becomes pure request/response and features a complete access to Tarantool functionality, including: One advantage of the described algorithm is that complete request pipelining is achieved, even for requests on the same value of the primary key. As a result, database performance doesn't degrade even if all requests refer to the same key in the same space. PREPARE SCRAMBLE:

    LEN(ENCODED_SALT) = 44;
    LEN(SCRAMBLE)     = 20;

prepare 'chap-sha1' scramble:

    salt = base64_decode(encoded_salt);
    step_1 = sha1(password);
    step_2 = sha1(step_1);
    step_3 = sha1(salt, step_2);
    scramble = xor(step_1, step_3);
    return scramble;

AUTHORIZATION BODY: CODE = 0x07

+==================+====================================+
|                  |        +-------------+-----------+ |
|  (KEY)           | (TUPLE)|  len == 9   | len == 20 | |
|   0x23:USERNAME  |   0x21:| "chap-sha1" |  SCRAMBLE | |
| MP_INT:MP_STRING | MP_INT:|  MP_STRING  |  MP_BIN   | |
|                  |        +-------------+-----------+ |
|                  |                   MP_ARRAY         |
+==================+====================================+
                        MP_MAP Primarily, the .snap file's records are ordered by space id. Therefore the records of system spaces -- such as ``_schema``, ``_space``, ``_index``, ``_func``, ``_priv`` and ``_cluster`` -- will be at the start of the .snap file, before the records of any spaces that were created by users. REPLACE: CODE - 0x03 Insert a tuple into the space or replace an existing one. Read the configuration parameters in the ``box.cfg{}`` request. Parameters which affect recovery may include :ref:`work_dir <cfg_basic-work_dir>`, :ref:`wal_dir <cfg_basic-wal_dir>`, :ref:`memtx_dir <cfg_basic-memtx_dir>`, :ref:`vinyl_dir <cfg_basic-vinyl_dir>` and :ref:`force_recovery <cfg_binary_logging_snapshots-force_recovery>`. Redo the log entries, from the start position to the end of the WAL. The engine skips a redo instruction if it is older than the engine's checkpoint. Replication packet structure Request/Response:

0        5
+--------+ +============+ +===================================+
| BODY + | |            | |                                   |
| HEADER | |   HEADER   | |               BODY                |
|  SIZE  | |            | |                                   |
+--------+ +============+ +===================================+
  MP_INT       MP_MAP                     MP_MAP Requests Response packet structure SELECT BODY:

+==================+==================+==================+
|                  |                  |                  |
|   0x10: SPACE_ID |   0x11: INDEX_ID |   0x12: LIMIT    |
| MP_INT: MP_INT   | MP_INT: MP_INT   | MP_INT: MP_INT   |
|                  |                  |                  |
+==================+==================+==================+
|                  |                  |                  |
|   0x13: OFFSET   |   0x14: ITERATOR |   0x20: KEY      |
| MP_INT: MP_INT   | MP_INT: MP_INT   | MP_INT: MP_ARRAY |
|                  |                  |                  |
+==================+==================+==================+
                          MP_MAP SELECT: CODE - 0x01 Find tuples matching the search pattern Secondarily, the .snap file's records are ordered by primary key within space id. See the example in the following section. Set of tuples in the response :code:`<data>` expects a msgpack array of tuples as value EVAL command returns arbitrary `MP_ARRAY` with arbitrary MsgPack values. Step 1 Step 2 Step 3 Step 4 Step 5 TARANTOOL'S GREETING:

0                                     63
+--------------------------------------+
|                                      |
| Tarantool Greeting (server version)  |
|               64 bytes               |
+---------------------+----------------+
|                     |                |
| BASE64 encoded SALT |      NULL      |
|      44 bytes       |                |
+---------------------+----------------+
64                  107              127 Tarantool processes requests atomically: a change is either accepted and recorded in the WAL, or discarded completely. Let's clarify how this happens, using the REPLACE request as an example: Tarantool's binary protocol Tarantool's binary protocol is a binary request/response protocol. The WAL writer employs a number of durability modes, as defined in configuration variable :ref:`wal_mode <index-wal_mode>`. It is possible to turn the write-ahead log completely off, by setting :ref:`wal_mode <cfg_binary_logging_snapshots-wal_mode>` to *none*. Even without the write-ahead log it's still possible to take a persistent copy of the entire data set with the :ref:`box.snapshot() <box-snapshot>` request. The format of a snapshot .snap file is nearly the same as the format of a WAL .xlog file. However, the snapshot header differs: it contains the instance's global unique identifier and the snapshot file's position in history, relative to earlier snapshot files. Also, the content differs: an .xlog file may contain records for any data-change requests (inserts, updates, upserts, and deletes), a .snap file may only contain records of inserts to memtx spaces. The new tuple is validated. If for example it does not contain an indexed field, or it has an indexed field whose type does not match the type according to the index definition, the change is aborted. The new tuple replaces the old tuple in all existing indexes. The protocol uses `msgpack <http://msgpack.org>`_ for data structures and encoding. The protocol uses maps that contain some integer constants as keys. These constants are defined in `src/box/iproto_constants.h <https://github.com/tarantool/tarantool/blob/1.9/src/box/iproto_constants.h>`_. We list common constants here: The recovery process The recovery process begins when box.cfg{} happens for the first time after the Tarantool server instance starts. The recovery process must recover the databases as of the moment when the instance was last shut down. For this it may use the latest snapshot file and any WAL files that were written after the snapshot. One complicating factor is that Tarantool has two engines -- the memtx data must be reconstructed entirely from the snapshot and the WAL files, while the vinyl data will be on disk but might require updating around the time of a checkpoint. (When a snapshot happens, Tarantool tells the vinyl engine to make a checkpoint, and the snapshot operation is rolled back if anything goes wrong, so vinyl's checkpoint is at least as fresh as the snapshot file.) The server instance attempts to locate the original tuple by primary key. If found, a reference to the tuple is retained for later use. The server instance begins the dialogue by sending a fixed-size (128-byte) text greeting to the client. The greeting always contains two 64-byte lines of ASCII text, each line ending with a newline character (:code:`\n`). The first line contains the instance version and protocol type. The second line contains up to 44 bytes of base64-encoded random string, to use in the authentication packet, and ends with up to 23 spaces. The snapshot file format The transaction processor thread communicates with the WAL writer thread using asynchronous (yet reliable) messaging; the transaction processor thread, not being blocked on WAL tasks, continues to handle requests quickly even at high volumes of disk I/O. A response to a request is sent as soon as it is ready, even if there were earlier incomplete requests on the same connection. In particular, SELECT performance, even for SELECTs running on a connection packed with UPDATEs and DELETEs, remains unaffected by disk load. There are actually two variations of the reconstruction procedure for memtx databases, depending on whether the recovery process is "default". They only differ in the allowed set of keys and values. The key defines the type of value that follows. If a body has no keys, the entire msgpack map for the body may be missing. Such is the case, for example, for a <ping> request. ``schema_id`` may be absent in the request's header, meaning that there will be no version checking, but it must be present in the response. If ``schema_id`` is sent in the header, then it will be checked. To maintain data persistence, Tarantool writes each data change request (insert, update, delete, replace, upsert) into a write-ahead log (WAL) file in the :ref:`wal_dir <cfg_basic-wal_dir>` directory. A new WAL file is created for every :ref:`rows_per_wal <cfg_binary_logging_snapshots-rows_per_wal>` records, or for every :ref:`wal_max_size <cfg_binary_logging_snapshots-wal_max_size>` bytes. Each data change request gets assigned a continuously growing 64-bit log sequence number. The name of the WAL file is based on the log sequence number of the first record in the file, plus an extension ``.xlog``. UNIFIED HEADER:

+================+================+=====================+
|                |                |                     |
|   0x00: CODE   |   0x01: SYNC   |    0x05: SCHEMA_ID  |
| MP_INT: MP_INT | MP_INT: MP_INT |  MP_INT: MP_INT     |
|                |                |                     |
+================+================+=====================+
                          MP_MAP UPDATE BODY:

+==================+=======================+
|                  |                       |
|   0x10: SPACE_ID |   0x11: INDEX_ID      |
| MP_INT: MP_INT   | MP_INT: MP_INT        |
|                  |                       |
+==================+=======================+
|                  |          +~~~~~~~~~~+ |
|                  |          |          | |
|                  | (TUPLE)  |    OP    | |
|   0x20: KEY      |    0x21: |          | |
| MP_INT: MP_ARRAY |  MP_INT: +~~~~~~~~~~+ |
|                  |            MP_ARRAY   |
+==================+=======================+
                 MP_MAP UPDATE: CODE - 0x04 Update a tuple UPSERT BODY:

+==================+==================+==========================+
|                  |                  |             +~~~~~~~~~~+ |
|                  |                  |             |          | |
|   0x10: SPACE_ID |   0x21: TUPLE    |       (OPS) |    OP    | |
| MP_INT: MP_INT   | MP_INT: MP_ARRAY |       0x28: |          | |
|                  |                  |     MP_INT: +~~~~~~~~~~+ |
|                  |                  |               MP_ARRAY   |
+==================+==================+==========================+
                                MP_MAP

Operations structure same as for UPDATE operation.
   0           2
+-----------+==========+==========+
|           |          |          |
|    OP     | FIELD_NO | ARGUMENT |
| MP_FIXSTR |  MP_INT  |  MP_INT  |
|           |          |          |
+-----------+==========+==========+
              MP_ARRAY

Supported operations:

'+' - add a value to a numeric field. If the filed is not numeric, it's
      changed to 0 first. If the field does not exist, the operation is
      skipped. There is no error in case of overflow either, the value
      simply wraps around in C style. The range of the integer is MsgPack:
      from -2^63 to 2^64-1
'-' - same as the previous, but subtract a value
'=' - assign a field to a value. The field must exist, if it does not exist,
      the operation is skipped.
'!' - insert a field. It's only possible to insert a field if this create no
      nil "gaps" between fields. E.g. it's possible to add a field between
      existing fields or as the last field of the tuple.
'#' - delete a field. If the field does not exist, the operation is skipped.
      It's not possible to change with update operations a part of the primary
      key (this is validated before performing upsert). UPSERT: CODE - 0x09 Update tuple if it would be found elsewhere try to insert tuple. Always use primary index for key. Unified packet structure We will show whole packets here: When a client connects to the server instance, the instance responds with a 128-byte text greeting message. Part of the greeting is base-64 encoded session salt - a random string which can be used for authentication. The length of decoded salt (44 bytes) exceeds the amount necessary to sign the authentication message (first 20 bytes). An excess is reserved for future authentication schemas. XLOG / SNAP XLOG and SNAP files have nearly the same format. The header looks like: and on the right are comments. request multiplexing, e.g. ability to asynchronously issue multiple requests via the same connection response format that supports zero-copy writes Project-Id-Version: Tarantool 1.10
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-02-06 13:53+0000
PO-Revision-Date: 2019-11-14 20:46+0300
Last-Translator: 
Language: ru
Language-Team: 
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
     * Вставка      OP = '!'
      вставить <argument> до поля <field_no>
    * Присвоение      OP = '='
      присвоить <argument> полю <field_no>.
      увеличит кортеж, если <field_no> == <max_field_no> + 1

0           2
+-----------+==========+===========+
|           |          |           |
|    OP     | FIELD_NO | ARGUMENT  |
| MP_FIXSTR |  MP_INT  | MP_OBJECT |
|           |          |           |
+-----------+==========+===========+
              MP_ARRAY

    Работает со строковыми полями:
    * Разделение      OP = ':'
      взять строку из space[key][field_no] и
      заменить <offset> байтов из положения <position> на <argument> $ hexdump 00000000000000000000.xlog **MP_ARR** - массив **MP_BIN** - бинарный формат MsgPack **MP_FIXSTR** - строка фиксированной длины **MP_INT** - целое число **MP_MAP** - ассоциативный массив **MP_OBJECT** - любой MsgPack-объект **MP_STRING** - строка -- -- Значение ключа <code> в запросе может быть следующим:
-- Ключи для команд пользователя
<iproto_select>       ::= 0x01
<iproto_insert>       ::= 0x02
<iproto_replace>      ::= 0x03
<iproto_update>       ::= 0x04
<iproto_delete>       ::= 0x05
<iproto_call_16>      ::= 0x06 /* as used in version 1.6 */
<iproto_auth>         ::= 0x07
<iproto_eval>         ::= 0x08
<iproto_upsert>       ::= 0x09
<iproto_call>         ::= 0x0a
-- Коды для команд администратора
-- (включая коды для инициализации набора реплик и выбора мастера)
<iproto_ping>         ::= 0x40
<iproto_join>         ::= 0x41 /* i.e. replication join */
<iproto_subscribe>    ::= 0x42
<iproto_request_vote> ::= 0x43

-- -- Значение для ключа <code> в ответе может быть следующим:
<iproto_ok>           ::= 0x00
<iproto_type_error>   ::= 0x8XXX /* где XXX -- это значение в errcode.h */ -- коды для репликации
<join>      ::= 0x41
<subscribe> ::= 0x42 -- ключи для репликации
 <server_id>     ::= 0x02
 <lsn>           ::= 0x03
 <timestamp>     ::= 0x04
 <server_uuid>   ::= 0x24
 <cluster_uuid>  ::= 0x25
 <vclock>        ::= 0x26 -- пользовательские ключи
<iproto_sync>          ::= 0x01
<iproto_schema_id>     ::= 0x05  /* также schema_version */
<iproto_space_id>      ::= 0x10
<iproto_index_id>      ::= 0x11
<iproto_limit>         ::= 0x12
<iproto_offset>        ::= 0x13
<iproto_iterator>      ::= 0x14
<iproto_key>           ::= 0x20
<iproto_tuple>         ::= 0x21
<iproto_function_name> ::= 0x22
<iproto_username>      ::= 0x23
<iproto_expr>          ::= 0x27 /* также expression */
<iproto_ops>           ::= 0x28
<iproto_data>          ::= 0x30
<iproto_error>         ::= 0x31 0            3 4                                         17
+-------------+========+============+===========+=========+
|             |        |            |           |         |
| 0xd5ba0bab  | LENGTH | CRC32 PREV | CRC32 CUR | PADDING |
|             |        |            |           |         |
+-------------+========+============+===========+=========+
  MP_FIXEXT2    MP_INT     MP_INT       MP_INT      ---

+============+ +===================================+
|            | |                                   |
|   HEADER   | |                BODY               |
|            | |                                   |
+============+ +===================================+
    MP_MAP                     MP_MAP 0           2
+-----------+==========+==========+========+==========+
|           |          |          |        |          |
|    ':'    | FIELD_NO | POSITION | OFFSET | ARGUMENT |
| MP_FIXSTR |  MP_INT  |  MP_INT  | MP_INT |  MP_STR  |
|           |          |          |        |          |
+-----------+==========+==========+========+==========+
                         MP_ARRAY 0    X
+----+
|    | - X + 1 байт
+----+
 TYPE - тип MsgPack-значения (если это MsgPack-объект)

+====+
|    | - MsgPack-объект изменяемого размера
+====+
 TYPE - тип MsgPack-значения

+~~~~+
|    | - Массив или ассоциативный массив в формате MsgPack изменяемого размера
+~~~~+
 TYPE - тип MsgPack-значения :code:`<key>` содержит имя пользователя. :code:`<tuple>` должен представлять собой массив из 2 полей: механизм аутентификации (в данный момент поддерживается только механизм "chap-sha1") и пароль, закодированный в соответствии с указанным механизмом. Аутентификация в Tarantool'е необязательна: если аутентификация не проводится, то пользователем в сессии будет 'guest'. Экземпляр отвечает на пакет аутентификации стандартным ответом с 0 кортежей. <type>\n                  SNAP\n или XLOG\n
<version>\n               в данный момент 0.13\n
Server: <server_uuid>\n   где UUID -- это 36-байтная строка
VClock: <vclock_map>\n    например, {1: 0}\n
\n В процесс записи, запущенный в потоке журнала упреждающей записи, отправляется сообщение о необходимости внесения записи в WAL-файл. Экземпляр переключается на работу со следующим запросом, пока запись не будет подтверждена. Для чтения файлов в формате .xlog в Tarantool'е предусмотрен :ref:`модуль xlog <xlog>`. После файла заголовка идут кортежи с данными. Кортежи начинаются с маркера строки ``0xd5ba0bab``, а после последнего кортежа может стоять маркер конца файла ``0xd510aded``. Таким образом, между заголовком файла и маркером конца файла могут быть кортежи с данными в следующем виде: Файл в формате .xlog всегда содержит изменения на основании первичного ключа. Даже если клиент запрашивает обновление или удаление по вторичному ключу, запись в файле в формате .xlog будет содержать первичный ключ. Сообщение об ошибке будет включено в ответ только в случае ошибки; предполагается, что значение :code:`<error>` будет msgpack-строкой. Помимо номера записи в журнале (LSN) и запроса на изменение данных (в формате :ref:`бинарного протокола Tarantool'а <box_protocol-iproto_protocol>`), каждая запись в WAL-файле содержит заголовок, некоторые метаданные, а также данные, форматированные по правилам `msgpack <https://en.wikipedia.org/wiki/MessagePack>`_. Например, так выглядит WAL-файл после первого запроса вставки INSERT ("s:insert({1})") для базы данных из песочницы, созданной в упражнениях в :ref:`"Руководстве для начинающих" <getting_started>`. Слева представлены шестнадцатеричные байты, которые можно просмотреть с помощью: Аутентификация И заголовок :code:`<header>` и тело сообщения :code:`<body>` представляют собой ассоциативные массивы в формате msgpack: ТЕЛО СООБЩЕНИЯ CALL:

+=======================+==================+
|                       |                  |
|   0x22: FUNCTION_NAME |   0x21: TUPLE    |
| MP_INT: MP_STRING     | MP_INT: MP_ARRAY |
|                       |                  |
+=======================+==================+
                    MP_MAP CALL: CODE - 0x0a Аналог CALL_16, но как и операция EVAL, CALL возвращает список неконвертированных значений ТЕЛО СООБЩЕНИЯ CALL_16:

+=======================+==================+
|                       |                  |
|   0x22: FUNCTION_NAME |   0x21: TUPLE    |
| MP_INT: MP_STRING     | MP_INT: MP_ARRAY |
|                       |                  |
+=======================+==================+
                    MP_MAP CALL_16: CODE - 0x06 Вызов хранимой функции с возвратом массива кортежей. Объявлен устаревшим; рекомендуется использовать CALL (0x0a). Удобные макросы для определения шестнадцатеричных постоянных для возвращаемых кодов можно найти по ссылке `src/box/errcode.h <https://github.com/tarantool/tarantool/blob/1.10/src/box/errcode.h>`_ ТЕЛО СООБЩЕНИЯ УДАЛЕНИЯ DELETE:

+==================+==================+==================+
|                  |                  |                  |
|   0x10: SPACE_ID |   0x11: INDEX_ID |   0x20: KEY      |
| MP_INT: MP_INT   | MP_INT: MP_INT   | MP_INT: MP_ARRAY |
|                  |                  |                  |
+==================+==================+==================+
                          MP_MAP DELETE: CODE - 0x05 Удаление кортежа Персистентность данных и формат WAL-файла ОШИБКА: LEN + HEADER + BODY

0      5
+------++================+================++===================+
|      ||                |                ||                   |
| BODY ||   0x00: 0x8XXX |   0x01: SYNC   ||   0x31: ERROR     |
|HEADER|| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT: MP_STRING |
| SIZE ||                |                ||                   |
+------++================+================++===================+
 MP_INT                MP_MAP                      MP_MAP

Где 0xXXX -- это код ошибки ERRCODE. ТЕЛО СООБЩЕНИЯ EVAL:

+=======================+==================+
|                       |                  |
|   0x27: EXPRESSION    |   0x21: TUPLE    |
| MP_INT: MP_STRING     | MP_INT: MP_ARRAY |
|                       |                  |
+=======================+==================+
                    MP_MAP EVAL: CODE - 0x08 Оценка Lua-выражения Найти WAL-файл, который был создан во время создания файла снимка или позже. Выполнить чтение записей журнала до тех пор, пока LSN записи в журнале не будет больше LSN снимка или больше LSN контрольной точки в vinyl'е. Это и будет начальной точкой для процесса восстановления, которая соответствует текущему состоянию движков. Найти последний файл снимка. Использовать данные для реконструкции in-memory баз данных. Передать команду vinyl'у о восстановлении до последней контрольной точки. Повторно создать все вторичные индексы для движка memtx. Пакет приветствия Шестнадцатеричный дамп WAL-файла       Комментарий
--------------------       -------
58 4c 4f 47 0a             "XLOG\n"
30 2e 31 33 0a             "0.13\n" = version
53 65 72 76 65 72 3a 20    "Server: "
38 62 66 32 32 33 65 30 2d [Server UUID]\n
36 39 31 34 2d 34 62 35 35
2d 39 34 64 32 2d 64 32 62
36 64 30 39 62 30 31 39 36
0a
56 43 6c 6f 63 6b 3a 20    "Vclock: "
7b 7d                      "{}" = vclock value, initially blank
...                        (not shown = tuples for system spaces)
d5 ba 0b ab                Magic row marker always = 0xab0bbad5
19                         Length, not including length of header, = 25 bytes
00                           Record header: previous crc32
ce 8c 3e d6 70               Record header: current crc32
a7 cc 73 7f 00 00 66 39      Record header: padding
84                         msgpack code meaning "Map of 4 elements" follows
00 02                         element#1: tag=request type, value=0x02=IPROTO_INSERT
02 01                         element#2: tag=server id, value=0x01
03 04                         element#3: tag=lsn, value=0x04
04 cb 41 d4 e2 2f 62 fd d5 d4 element#4: tag=timestamp, value=an 8-byte "Float64"
82                         msgpack code meaning "map of 2 elements" follows
10 cd 02 00                   element#1: tag=space id, value=512, big byte first
21 91 01                      element#2: tag=tuple, value=1-element fixed array={1} ТЕЛО СООБЩЕНИЯ ВСТАВКИ/ЗАМЕНЫ INSERT/REPLACE:

+==================+==================+
|                  |                  |
|   0x10: SPACE_ID |   0x21: TUPLE    |
| MP_INT: MP_INT   | MP_INT: MP_ARRAY |
|                  |                  |
+==================+==================+
                 MP_MAP INSERT:  CODE - 0x02 Вставка кортежа в спейс, если нет кортежей с такими же уникальными ключами. Если есть, выдать ошибку *duplicate key* (повторяющееся значение ключа). Если выполняется стандартная процедура (``force_recovery`` = ``false``), memtx может выполнить чтение данных из снимка с отключенными индексами. Сначала все кортежи считываются в память. Затем происходит массовая загрузка первичных ключей с учетом того, что данные уже отсортированы по первичному ключу в каждом спейсе. Если выполняется нестандартная процедура принудительного восстановления (``force_recovery`` = ``true``), Tarantool проводит дополнительную проверку. Сначала индексы активны, и кортежи добавляются по одному. Это означает, что будут выявлены любые нарушения ограничений уникальности ключей, и все повторяющиеся значения пропускаются. Как правило, не будет нарушений ограничений или повторяющихся значений, поэтому такие проверки проводятся только в случае ошибки. Внутреннее устройство Указать аргумент типа, который отличается от ожидаемого типа, будет ошибкой. JOIN:

Сначала необходимо отправить изначальный запрос JOIN
               HEADER                      BODY
+================+================++===================+
|                |                ||   SERVER_UUID     |
|   0x00: 0x41   |   0x01: SYNC   ||   0x24: UUID      |
| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT: MP_STRING |
|                |                ||                   |
+================+================++===================+
               MP_MAP                     MP_MAP

Затем экземпляр, к которому мы подключаемся, отправит последний файл снимка SNAP,
просто создав количество запросов вставки INSERT (с дополнительным LSN и ServerID)
(не отвечайте). Затем он отправит MP_MAP из vclock и закроет сокет.

+================+================++============================+
|                |                ||        +~~~~~~~~~~~~~~~~~+ |
|                |                ||        |                 | |
|   0x00: 0x00   |   0x01: SYNC   ||   0x26:| SRV_ID: SRV_LSN | |
| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT:| MP_INT: MP_INT  | |
|                |                ||        +~~~~~~~~~~~~~~~~~+ |
|                |                ||               MP_MAP       |
+================+================++============================+
               MP_MAP                      MP_MAP

SUBSCRIBE:

Далее необходимо отправить запрос SUBSCRIBE:

                              HEADER
+===================+===================+
|                   |                   |
|     0x00: 0x42    |    0x01: SYNC     |
|   MP_INT: MP_INT  |  MP_INT: MP_INT   |
|                   |                   |
+===================+===================+
|    SERVER_UUID    |    CLUSTER_UUID   |
|   0x24: UUID      |   0x25: UUID      |
| MP_INT: MP_STRING | MP_INT: MP_STRING |
|                   |                   |
+===================+===================+
                 MP_MAP

      BODY
+================+
|                |
|   0x26: VCLOCK |
| MP_INT: MP_INT |
|                |
+================+
      MP_MAP

 Затем следует обработать каждый запрос, который пришел от других мастеров.
 Каждый запрос между мастерами получит дополнительный LSN и SERVER_ID. Типы MsgPack-данных: Система обозначений в схематическом представлении OK:    LEN + HEADER + BODY

0      5                                          OPTIONAL
+------++================+================++===================+
|      ||                |                ||                   |
| BODY ||   0x00: 0x00   |   0x01: SYNC   ||   0x30: DATA      |
|HEADER|| MP_INT: MP_INT | MP_INT: MP_INT || MP_INT: MP_OBJECT |
| SIZE ||                |                ||                   |
+------++================+================++===================+
 MP_INT                MP_MAP                      MP_MAP OP:
    Работает только для целочисленных полей:
    * Сложение    OP = '+' . space[key][field_no] += argument
    * Вычитание OP = '-' . space[key][field_no] -= argument
    * Побитовое И OP = '&' . space[key][field_no] &= argument
    * Исключающее ИЛИ OP = '^' . space[key][field_no] ^= argument
    * Побитовое ИЛИ  OP = '|' . space[key][field_no] |= аргумент
    Работает для любых полей:
    * Удаление      OP = '#'
      удалить поля <argument>, начиная
      с поля <field_no> в спейсе с ключом space[<key>]

0           2
+-----------+==========+==========+
|           |          |          |
|    OP     | FIELD_NO | ARGUMENT |
| MP_FIXSTR |  MP_INT  |  MP_INT  |
|           |          |          |
+-----------+==========+==========+
              MP_ARRAY При успешном выполнении на клиент отправляется подтверждение. В случае ошибки начинается процедура отката. Во время процедуры отката поток обработки транзакций откатывается все изменения в базу данных, которые произошли после первого невыполненного изменения, от последнего с первому, вплоть до первого невыполненного изменения. Все запросы, которые подверглись откату, прерываются с ошибкой :errcode:`ER_WAL_IO <ER_WAL_IO>`. Новые изменения не применяются во время отката. По окончании процедуры отката сервер повторно запускает конвейер обработки операций. После того, как приветствие прочитано, протокол становится простым запросно-ответным протоколом и предоставляет полный доступ к функциям Tarantool'а, включая: Одно из преимуществ описанного алгоритма заключается в том, что достигается полная обработка запроса по конвейеру даже для запросов с одинаковым значением первичного ключа. В результате производительность базы данных не падает, даже если все запросы относятся к одному ключу в одном спейсе. ПОДГОТОВКА КОДИРОВАНИЯ:

    LEN(ENCODED_SALT) = 44;
    LEN(SCRAMBLE)     = 20;

подготовить кодирование 'chap-sha1':

    salt = base64_decode(encoded_salt);
    step_1 = sha1(password);
    step_2 = sha1(step_1);
    step_3 = sha1(salt, step_2);
    scramble = xor(step_1, step_3);
    return scramble;

ТЕЛО СООБЩЕНИЯ АВТОРИЗАЦИИ: CODE = 0x07

+==================+====================================+
|                  |        +-------------+-----------+ |
|  (KEY)           | (TUPLE)|  len == 9   | len == 20 | |
|   0x23:USERNAME  |   0x21:| "chap-sha1" |  SCRAMBLE | |
| MP_INT:MP_STRING | MP_INT:|  MP_STRING  |  MP_BIN   | |
|                  |        +-------------+-----------+ |
|                  |                   MP_ARRAY         |
+==================+====================================+
                        MP_MAP В первую очередь записи в .snap-файле упорядочены по идентификатору спейса. Таким образом, записи в системные спейсы -- такие как ``_schema``, ``_space``, ``_index``, ``_func``, ``_priv`` и ``_cluster`` -- будут находиться в начале .snap-файла до записей в другие спейсы, созданные пользователями. REPLACE: CODE - 0x03 Вставка кортежа в спейс или замена существующего кортежа. Выполнить чтение конфигурационных параметров из запроса ``box.cfg{}``. Параметры, которые могут повлиять на восстановление: :ref:`work_dir <cfg_basic-work_dir>`, :ref:`wal_dir <cfg_basic-wal_dir>`, :ref:`memtx_dir <cfg_basic-memtx_dir>`, :ref:`vinyl_dir <cfg_basic-vinyl_dir>` и :ref:`force_recovery <cfg_binary_logging_snapshots-force_recovery>`. Повторить записи журнала с начальной точки до конца WAL. Движок пропускает команду повторения, если данные старше контрольной точки движка. Структура пакета при репликации Запрос / ответ:
 
0        5
+--------+ +============+ +===================================+
| BODY + | |            | |                                   |
| HEADER | |   HEADER   | |               BODY                |
|  SIZE  | |            | |                                   |
+--------+ +============+ +===================================+
  MP_INT       MP_MAP                     MP_MAP Запросы Структура пакета ответа ТЕЛО СООБЩЕНИЯ ВЫБОРКИ SELECT:

+==================+==================+==================+
|                  |                  |                  |
|   0x10: SPACE_ID |   0x11: INDEX_ID |   0x12: LIMIT    |
| MP_INT: MP_INT   | MP_INT: MP_INT   | MP_INT: MP_INT   |
|                  |                  |                  |
+==================+==================+==================+
|                  |                  |                  |
|   0x13: OFFSET   |   0x14: ITERATOR |   0x20: KEY      |
| MP_INT: MP_INT   | MP_INT: MP_INT   | MP_INT: MP_ARRAY |
|                  |                  |                  |
+==================+==================+==================+
                          MP_MAP SELECT: CODE - 0x01 Поиск кортежей, соответствующих шаблону поиска Во вторую очередь записи в .snap-файле упорядочены по первичному ключу. См. пример в предыдущем разделе. Предполагается, что набор кортежей в ответе :code:`<data>` будет представлять собой msgpack-массив кортежей, поскольку команда EVAL возвращается произвольный MsgPack-массив `MP_ARRAY` с произвольными MsgPack-значениями. Шаг 1 Шаг 2 Шаг 3 Шаг 4 Шаг 5 ПРИВЕТСТВИЕ TARANTOOL'А:
 
 0                                     63
 +--------------------------------------+
 |                                      |
 | Приветствие Tarantool'а (версия сервера)  |
 |               64 байта               |
 +---------------------+----------------+
 |                     |                |
 | СОЛЬ в кодировке BASE64 |      NULL      |
 |      44 байта       |                |
 +---------------------+----------------+
 64                  107              127 Tarantool обрабатывает запросы атомарно: изменение либо принимается и записывается в WAL-файл, или полностью исключается. Проясним, как этом работает, используя в качестве примера REPLACE-запрос: Бинарный протокол Tarantool'а Бинарный протокол Tarantool'а представляет собой бинарный запросно-ответный протокол. При записи в WAL можно применять различные режимы долговечности, что определяет конфигурационная переменная :ref:`wal_mode <index-wal_mode>`. Можно полностью отключить журнал упреждающей записи, присвоив :ref:`wal_mode <cfg_binary_logging_snapshots-wal_mode>` значение *none*. Даже без журнала упреждающей записи возможно сделать персистентную копию всего набора данных с помощью запроса :ref:`box.snapshot() <box-snapshot>`. Формат файла снимка .snap практически такой же, что и формат WAL-файла .xlog. Тем не менее, заголовок снимка отличается: он содержит глобально уникальный идентификатор экземпляра и положения файла снимка в истории относительно более ранних файлов снимка. Кроме того, отличается содержание: .xlog-файл может содержать записи о любых запросах изменения данных (вставка, обновление, обновление и вставка и удаление), а .snap-файл может содержать лишь записи о вставках в спейсы memtx'а. Происходит проверка нового кортежа. Например, если в нем нет проиндексированного поля, или же тип проиндексированного поля не совпадает с типом в определении индекса, изменение прерывается. Новый кортеж заменяет старый кортеж во всех существующих индексах. Для структуризации и кодирования данных протокол использует формат данных `msgpack <http://msgpack.org>`_. Протокол использует ассоциативные массивы, которые содержат несколько целочисленных постоянных, в качестве ключей. Эти постоянные указаны по ссылке `src/box/iproto_constants.h <https://github.com/tarantool/tarantool/blob/1.9/src/box/iproto_constants.h>`_. Ниже приведены часто используемые постоянные: Процесс восстановления Процесс восстановления начинается, когда box.cfg{} впервые используется после запуска экземпляра Tarantool-сервера. Процесс восстановления должен восстановить базы данных на момент последнего отключения экземпляра. Для этого можно использовать последний файл снимка и любые WAL-файлы, которые были записаны после создания снимка. Ситуацию осложняет фактор того, что в Tarantool'е используются два движка -- данные memtx'а должны быть реконструированы полностью из снимка и WAL-файлов, тогда как данные vinyl'а будут находиться на диске, но может потребоваться их обновление на время создания контрольной точки. (При создании снимка Tarantool передает движку vinyl команду создания контрольной точки, а операция создания снимка откатывается в случае какой-либо ошибки, поэтому контрольная точка vinyl'а будет настолько же актуальной, как и файл снимка.) Экземпляр сервера пытается найти оригинальный кортеж по первичному ключу. Если кортеж найден, ссылка на него сохраняется для дальнейшего использования. Экземпляр сервера начинает диалог с отправки клиенту текста приветствия фиксированного размера (128 байтов). Приветствие всегда содержит две 64-байтные строки текста в формате ASCII, каждая строка заканчивается символом разрыва строки (:code:`\n`). Первая строка описывает версию экземпляра и тип протокола. Вторая строка содержит случайную строку в кодировке base64 размером до 44 байтов для использования в пакете аутентификации и заканчивается на пробелы (до 23). Формат файла снимка Поток обработки транзакций взаимодействует с потоком записи в журнал упреждающей записи с помощью асинхронного (однако надежного) обмена сообщениями. Поток обработки транзакций, который не блокируется при задачах записи в журнал, продолжает быстро обрабатывать запрос даже при большом объеме дискового ввода-вывода. Ответ на запрос отправляется по готовности, даже если ранее на том же соединении были незавершенные запросы. В частности, на производительность выборки не влияет загрузка диска, даже если SELECT-запросы передаются вместе с запросами UPDATE и DELETE. На самом деле, есть два варианта реконструкции баз данных memtx'а в зависимости от того, выполняется ли стандартная процедура. Они различаются лишь набором допустимых ключей и значений. Ключ определяет тип следующего за ним значения. Если в теле сообщения нет ключей, может отсутствовать весь ассоциативный массив в формате msgpack для тела сообщения. Так и случится при запросе проверки связи <ping>. ``schema_id`` может отсутствовать в заголовке запроса, что означает отсутствие проверки версии, но этот ключ обязательно должен присутствовать в ответе. Если ``schema_id`` отправляется в заголовке, будет выполнена соответствующая проверка. Чтобы поддерживать персистентность данных, Tarantool записывает каждый запрос изменения данных (insert, update, delete, replace, upsert) в файл журнала упреждающей записи (WAL-файл) в директорию :ref:`wal_dir <cfg_basic-wal_dir>`. Новый WAL-файл создается для количества записей, определенного в параметре :ref:`rows_per_wal <cfg_binary_logging_snapshots-rows_per_wal>`, или для количества байтов, указанного в :ref:`wal_max_size <cfg_binary_logging_snapshots-wal_max_size>` . Каждому запросу на изменение данных присваивается постоянно возрастающее 64-битное число, представляющее собой регистрационный номер в журнале (LSN). Название WAL-файла состоит из LSN первой записи в файле плюс расширение ``.xlog``. УНИФИЦИРОВАННЫЙ ЗАГОЛОВОК:

+================+================+=====================+
|                |                |                     |
|   0x00: CODE   |   0x01: SYNC   |    0x05: SCHEMA_ID  |
| MP_INT: MP_INT | MP_INT: MP_INT |  MP_INT: MP_INT     |
|                |                |                     |
+================+================+=====================+
                          MP_MAP ТЕЛО СООБЩЕНИЯ ОБНОВЛЕНИЯ UPDATE:

+==================+=======================+
|                  |                       |
|   0x10: SPACE_ID |   0x11: INDEX_ID      |
| MP_INT: MP_INT   | MP_INT: MP_INT        |
|                  |                       |
+==================+=======================+
|                  |          +~~~~~~~~~~+ |
|                  |          |          | |
|                  | (TUPLE)  |    OP    | |
|   0x20: KEY      |    0x21: |          | |
| MP_INT: MP_ARRAY |  MP_INT: +~~~~~~~~~~+ |
|                  |            MP_ARRAY   |
+==================+=======================+
                 MP_MAP UPDATE: CODE - 0x04 Обновление кортежа ТЕЛО СООБЩЕНИЯ ОБНОВЛЕНИЯ И ВСТАВКИ UPSERT:

+==================+==================+==========================+
|                  |                  |             +~~~~~~~~~~+ |
|                  |                  |             |          | |
|   0x10: SPACE_ID |   0x21: TUPLE    |       (OPS) |    OP    | |
| MP_INT: MP_INT   | MP_INT: MP_ARRAY |       0x28: |          | |
|                  |                  |     MP_INT: +~~~~~~~~~~+ |
|                  |                  |               MP_ARRAY   |
+==================+==================+==========================+
                                MP_MAP

Структура операции аналогична структуре операции обновления UPDATE.
   0           2
+-----------+==========+==========+
|           |          |          |
|    OP     | FIELD_NO | ARGUMENT |
| MP_FIXSTR |  MP_INT  |  MP_INT  |
|           |          |          |
+-----------+==========+==========+
              MP_ARRAY

Поддерживаются следующие операции:

'+' - прибавление значения к числовому полю. Если поле не является числовым, оно
      сначала изменяется на 0. Если поле отсутствует, операция
      пропускается. В случае переполнения ошибки также не будет, значение
      просто переносится в стиле языка C. Диапазон целых чисел в формате MsgPack:
      от -2^63 до 2^64-1
'-' - как в предыдущей операции, но значение вычитается
'=' - присвоение значения полю. Если поле отсутствует,
      операция пропускается.
'!' - вставка поля. Можно вставить поле, если при этом не будут созданы
      промежутки с нулевым значением nil между полями. Например, можно добавить поле между
      существующими полями или последнее поле в кортеже.
'#' - удаление поля. Если поле отсутствует, операция пропускается.
      Нельзя с помощью операции обновления update изменить компонент первичного
      ключа (это проверяется перед выполнением операции upsert). UPSERT: CODE - 0x09 Обновление кортежа, если он уже существует, попытка вставить кортеж. Всегда используйте первичный индекс. Унифицированная структура пакета Здесь мы продемонстрируем пакеты полностью: Когда клиент подключается к экземпляру сервера, экземпляр отвечает 128-байтным текстовым сообщением приветствия. Часть приветствия представляет собой закодированное в формате base-64 значение соль для сессии (случайная строка), которое можно использовать для аутентификации. Длина расшифрованного значения соль (44 байта) выходит за пределы сообщения для аутентификации (первые 20 байтов). Остаток предназначается для будущих схем аутентификации. XLOG / SNAP Файлы форматов XLOG и SNAP выглядят практически одинаково. Заголовок выглядит следующим образом: а справа -- комментарии. мультиплексирование запросов, т.е. возможность асинхронной отправки множества запросов по одному соединению; формат ответа, который поддерживает запись в режиме без копирования (zero-copy). 