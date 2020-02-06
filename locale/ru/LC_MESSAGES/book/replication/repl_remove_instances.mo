��          t               �   e   �   C   3     w  �   �  F   8  *     #   �    �  �   �  k   ~  �  �  �   �  u   <  '   �  �  �  �   [	  *   �	  #   
    B
  �   _  �      If the instance is decommissioned forever, delete the instance's record from the following locations: On the instance, run ``box.cfg{}`` with a blank replication source: Removing instances The other instances in the replica set will carry on. If later the removed instance rejoins, it will receive all the updates that the other instances made while it was away. To remove an instance from a replica set politely, follow these steps: tarantool> box.cfg{replication=''}
---
... tarantool> box.cfg{replication=...} tarantool> box.space._cluster:select{}
---
- - [1, '913f99c8-aee3-47f2-b414-53ed0ec5bf27']
  - [2, 'eac1aee7-cfeb-46cc-8503-3f8eb4c7de1e']
  - [3, '97f2d65f-2e03-4dc8-8df3-2469bd9ce61e']
...
tarantool> box.space._cluster:delete(3)
---
- [3, '97f2d65f-2e03-4dc8-8df3-2469bd9ce61e']
... the :ref:`box.space._cluster <box_space-cluster>` tuple on any master instance in the replica set. For example, for a record with instance id = 3: the :ref:`replication <cfg_replication-replication>` parameter at all running instances in the replica set: Project-Id-Version: Tarantool 1.10
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-02-06 15:02+0000
PO-Revision-Date: 2019-12-20 21:24+0300
Last-Translator: 
Language: ru
Language-Team: 
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 Если экземпляр больше не будет использоваться, удалите записи об экземпляре из следующих мест: Выполните ``box.cfg{}`` с пустым источником репликации на экземпляре: Удаление экземпляров Остальные экземпляры продолжают работать. Если выбывший экземпляр снова возвращается в кластер, то он получит информацию о всех изменениях, которые произошли на остальных экземплярах за время его отсутствия. Чтобы правильно удалить экземпляр из набора реплик, выполните следующие действия: tarantool> box.cfg{replication=''}
---
... tarantool> box.cfg{replication=...} tarantool> box.space._cluster:select{}
---
- - [1, '913f99c8-aee3-47f2-b414-53ed0ec5bf27']
  - [2, 'eac1aee7-cfeb-46cc-8503-3f8eb4c7de1e']
  - [3, '97f2d65f-2e03-4dc8-8df3-2469bd9ce61e']
...
tarantool> box.space._cluster:delete(3)
---
- [3, '97f2d65f-2e03-4dc8-8df3-2469bd9ce61e']
... кортеж :ref:`box.space._cluster <box_space-cluster>` на любом мастере в наборе реплик. Например, для записи с ID экземпляра = 3: параметр :ref:`replication <cfg_replication-replication>` на всех работающих экземплярах в наборе реплик: 