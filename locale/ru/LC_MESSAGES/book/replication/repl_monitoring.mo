��          �               �   �   �     o  �   �  <   v     �  �   �  1   �     �    i  �   q  �   �  �  �  �  
  �   �  �  �  �  q  �   `  .   �  �    ^     �   r  �  I  J      i  �  v   :ref:`idle <box_info_replication_upstream_idle>`, the time (in seconds) since the instance received the last event from a master. :ref:`lag <box_info_replication_upstream_lag>`, the time difference between the local time at the instance, recorded when the event was received, and the local time at another master recorded when the event was written to the :ref:`write ahead log <internals-wal>` on that master. A replica sends heartbeat messages to the master every second, and the master is programmed to reconnect automatically if it does not see heartbeat messages within :ref:`replication_timeout <cfg_replication-replication_timeout>` seconds. For multi-master configurations, ``lag`` is the maximal lag. Monitoring a replica set Since the ``lag`` calculation uses the operating system clocks from two different machines, do not be surprised if it’s negative: a time drift may lead to the remote master clock being consistently behind the local instance's clock. The primary indicators of replication health are: The request was issued at master #1, and the reply includes statistics for the other two masters, given in regard to master #1. Therefore, in a healthy replication setup, ``idle`` should never exceed ``replication_timeout``: if it does, either the replication is lagging seriously behind, because the master is running ahead of the replica, or the network link between the instances is down. This report is for a master-master replica set of three instances, each having its own instance id, UUID and log sequence number. To learn what instances belong in the replica set, and obtain statistics for all these instances, issue a :ref:`box.info.replication <box_info_replication>` request: tarantool> box.info.replication
---
  replication:
    1:
      id: 1
      uuid: b8a7db60-745f-41b3-bf68-5fcce7a1e019
      lsn: 88
    2:
      id: 2
      uuid: cd3c7da2-a638-4c5d-ae63-e7767c3a6896
      lsn: 31
      upstream:
        status: follow
        idle: 43.187747001648
        peer: replicator@192.168.0.102:3301
        lag: 0
      downstream:
        vclock: {1: 31}
    3:
      id: 3
      uuid: e38ef895-5804-43b9-81ac-9f2cd872b9c4
      lsn: 54
      upstream:
        status: follow
        idle: 43.187621831894
        peer: replicator@192.168.0.103:3301
        lag: 2
      downstream:
        vclock: {1: 54}
... Project-Id-Version: Tarantool 1.10
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
 :ref:`бездействие <box_info_replication_upstream_idle>`, время (в секундах) с момента получения последнего события от мастера. :ref:`отставание <box_info_replication_upstream_lag>`, разница во времени между локальным временем на экземпляре, зарегистрированным при получении события, и локальное время на другом мастере, зарегистрированное при записи события в :ref:`журнал упреждающей записи <internals-wal>` на этом мастере. Реплика отправляет сообщения контрольного сигнала на мастер каждую секунду, и мастер запрограммирован на автоматическое переподключение, если он не получает сообщения контрольного сигнала в течение количества секунд, указанного в :ref:`replication_timeout <cfg_replication-replication_timeout>`. Для многомастерной конфигурации это максимально возможное отставание. Мониторинг набора реплик Поскольку при расчете ``отставания`` используются часы операционной системы с двух разных машин, не удивляйтесь, получив отрицательное число: смещение во времени может привести к постоянному запаздыванию времени на удаленном мастере относительно часов на локальном экземпляре. Основные индикаторы работоспособности репликации: Запрос был выполнен с мастера №1, и ответ включает в себя статистику по двум другим мастерам относительно мастера №1. Таким образом, в работоспособном состоянии значение ``idle`` никогда не должно превышать значение ``replication_timeout``: в противном случае, либо репликация сильно отстает, поскольку мастер опережает реплику, либо отсутствует сетевое подключение между экземплярами. Данный отчет сгенерирован для набора реплик из трех экземпляров с конфигурацией мастер-мастер, у каждого из которых есть свой собственный ID экземпляра, UUID и номер записи в журнале. Чтобы узнать, какие экземпляры входят в набор реплик и получить статистику по всем этим экземплярам, передайте запрос :ref:`box.info.replication <box_info_replication>`: tarantool> box.info.replication
---
  replication:
    1:
      id: 1
      uuid: b8a7db60-745f-41b3-bf68-5fcce7a1e019
      lsn: 88
    2:
      id: 2
      uuid: cd3c7da2-a638-4c5d-ae63-e7767c3a6896
      lsn: 31
      upstream:
        status: follow
        idle: 43.187747001648
        peer: replicator@192.168.0.102:3301
        lag: 0
      downstream:
        vclock: {1: 31}
    3:
      id: 3
      uuid: e38ef895-5804-43b9-81ac-9f2cd872b9c4
      lsn: 54
      upstream:
        status: follow
        idle: 43.187621831894
        peer: replicator@192.168.0.103:3301
        lag: 2
      downstream:
        vclock: {1: 54}
... 