��          t               �   C  �        �     �   �  d  �     R  D  j  E  �  ^  �	  �   T  �    T  �       U    �  l  �  +     �  Z    �  b  e  2  �   �    **Change notice:** Prior to Tarantool version 1.6.6, the snapshot process caused a fork, which could cause occasional latency spikes. Starting with Tarantool version 1.6.6, the snapshot process creates a consistent read view and this view is written to the snapshot file by a separate thread (the "Write Ahead Log" thread). **Example:** Although ``box.snapshot()`` does not cause a fork, there is a separate fiber which may produce snapshots at regular intervals -- see the discussion of the :ref:`checkpoint daemon <book_cfg_checkpoint_daemon>`. An alternative way to save a snapshot is to send a SIGUSR1 signal to the instance. While this approach could be handy, it is not recommended for use in automation: a signal provides no way to find out whether the snapshot was taken successfully or not. As long as there are any changes to the parent index memory through concurrent updates, there are going to be page splits, and therefore you need to have some extra free memory to run this command. 10% of :ref:`memtx_memory <cfg_storage-memtx_memory>` is, on average, sufficient. This statement waits until a snapshot is taken and returns operation result. Function `box.snapshot` Since a snapshot is written sequentially, one can expect a very high write performance (averaging to 80MB/second on modern disks), which means an average database instance gets saved in a matter of minutes. Users may restrict the speed by changing :ref:`snap_io_rate_limit <cfg_binary_logging_snapshots-snap_io_rate_limit>`. Take a snapshot of all data and store it in :ref:`memtx_dir <cfg_basic-memtx_dir>`:samp:`/{<latest-lsn>}.snap`. To take a snapshot, Tarantool first enters the delayed garbage collection mode for all data. In this mode, the :ref:`Tarantool garbage collector <cfg_checkpoint_daemon-garbage-collector>` will not remove files which were created before the snapshot started, it will not remove them until the snapshot has finished. To preserve consistency of the primary key, used to iterate over tuples, a copy-on-write technique is employed. If the master process changes part of a primary key, the corresponding process page is split, and the snapshot process obtains an old copy of the page. In effect, the snapshot process uses multi-version concurrency control in order to avoid copying changes which are superseded while it is running. Taking a snapshot does not cause the server to start a new write-ahead log. Once a snapshot is taken, old WALs can be deleted as long as all replicated data is up to date. But the WAL which was current at the time ``box.snapshot()`` started must be kept for recovery, since it still contains log records written after the start of ``box.snapshot()``. tarantool> box.info.version
---
- 1.7.0-1216-g73f7154
...
tarantool> box.snapshot()
---
- ok
...
tarantool> box.snapshot()
---
- error: can't save snapshot, errno 17 (File exists)
... Project-Id-Version: Tarantool 1.10
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2020-02-06 15:02+0000
PO-Revision-Date: 2019-12-06 16:16+0300
Last-Translator: 
Language: ru
Language-Team: 
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.7.0
 **Обновление:** До версии 1.6.6 Tarantool'а процесс создания снимка вызывал создание ответвления, что могло привести к скачкам задержки отклика. Начиная с версии 1.6.6 Tarantool'а, процесс создания снимка создает вид постоянного просмотра, который и записывается в файл снимка с помощью отдельного потока (поток упреждающей записи в журнал). **Пример:** Хотя ``box.snapshot()`` не создает ответвление, есть отдельный файбер, который может создавать снимки на регулярной основе -- см. обсуждение :ref:`демона создания контрольных точек <book_cfg_checkpoint_daemon>`. Другим способом сохранения снимка будет отправка сигнала SIGUSR1 на экземпляр. Хотя это может быть удобно, не рекомендуется использовать такой метод в автоматическом процессе: сигнал не дает возможность проверить, был ли корректно сделан снимок. При условии, что происходят изменения в родительском индексе в ходе многопоточного обновления данных, будет происходить и расщепление страниц, поэтому возникнет необходимость в наличии дополнительной свободной памяти для выполнения этой команды. В среднем, будет достаточно 10% от :ref:`memtx_memory <cfg_storage-memtx_memory>`. Оператор подождет окончания создания снимка и вернет результат операции. Функция `box.snapshot` Поскольку снимок создается последовательно, можно ожидать высокую скорость записи (в среднем до 80 МБ/секунду на современных дисках), что означает сохранение данных усредненного экземпляра базы данных за несколько минут. Пользователи могут ограничить скорость записи, изменив значение :ref:`snap_io_rate_limit <cfg_binary_logging_snapshots-snap_io_rate_limit>`. Создает снимок всех данных и сохраняет его в :ref:`memtx_dir <cfg_basic-memtx_dir>`:samp:`/{<latest-lsn>}.snap`. Чтобы сделать снимок, сначала Tarantool входит в режим сборки мусора по всем данным. В этом режиме :ref:`сборщик мусора Tarantool'а <cfg_checkpoint_daemon-garbage-collector>` не будет удалять файлы, созданные до начала создания снимка, до тех пор, пока не будет завершено создание снимка. Чтобы сохранить консистентность первичного ключа, используемого для итерации по кортежам, применяется технология копирования при записи. Если главный процесс изменяет часть первичного ключа, страница соответствующего процесса разделяется, и процесс создания снимка получает старую копию страницы. В результате, процесс создания снимка использует многоверсионную параллельную обработку данных, чтобы не скопировать изменения, замененные одновременно с ходом процесса. Создание снимка не приводит к записи нового журнала упреждающей записи на сервере. После создания снимка старые WAL-файлы можно удалить, если все реплицируемые данные актуальны. Но WAL-файл на момент начала работы ``box.snapshot()`` следует сохранить на случай восстановления, поскольку он содержит записи журнала после начала работы ``box.snapshot()``. tarantool> box.info.version
---
- 1.7.0-1216-g73f7154
...
tarantool> box.snapshot()
---
- ok
...
tarantool> box.snapshot()
---
- error: can't save snapshot, errno 17 (File exists)
... 