��          �                 )     <   G     �  �   �  #     )   B  J   l     �     �  #   �  .   �     -  D   5  Q   z  Y   �  �  &  W   �  i   !     �  �   �  ;   �  C   �  d   )     �  )   �  H   �  \   	     q	  i   �	  f   �	  �   W
   -1 on error. Perhaps a disk write failure -1 on error. Perhaps a transaction has already been started. 0 on success A transaction is attached to caller fiber, therefore one fiber can have only one active transaction. See also :ref:`box.begin()<box-begin>`. Allocate memory on txn memory pool. Begin a transaction in the current fiber. Commit the current transaction. See also :ref:`box.commit() <box-commit>`. Module `txn` NULL on out of memory Return a descriptor of a savepoint. Return true if there is an active transaction. Returns Roll back the current transaction as far as the specified savepoint. Roll back the current transaction. See also :ref:`box.rollback() <box-rollback>`. The memory is automatically deallocated when the transaction is committed or rolled back. Project-Id-Version: Tarantool 1.10
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
 -1 в случае ошибки. Возможен отказ записи на диск -1 в случае ошибки. Возможно, транзакция уже была запущена. 0, если выполнено Транзакция привязана к вызывающему файберу, поэтому в одном файбере может быть только одна активная транзакция. См. также :ref:`box.begin()<box-begin>`. Выделение памяти в пул памяти txn. Начало транзакции в текущем файбере. Коммит текущей транзакции. См. также :ref:`box.commit() <box-commit>`. Модуль `txn` NULL при нехватке памяти Возврат дескриптора контрольной точки. Возврат true (правда), если есть активная транзакция. Возвращает Откат текущей транзакции до указанной контрольной точки. Откат текущей транзакции. См. также :ref:`box.rollback() <box-rollback>`. Память автоматически освобождается при коммите или откате транзакции. 