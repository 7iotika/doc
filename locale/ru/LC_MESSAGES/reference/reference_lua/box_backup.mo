��          t               �      �   U   �   `   0  
   �     �  y   �  �   +  5   �  g  
  �   r  �  %     �  �   �  �   p     F  ,   Y  �   �  T  Q	     �
  �  &  �   �   **Example:** **Return:**  a table with the names of snapshot and vinyl files that should be copied Informs the server that activities related to the removal of outdated backups must be suspended. Parameters Submodule box.backup The box.backup submodule contains two functions that are helpful for :ref:`backup <admin-backups>` in certain situations. To guarantee an opportunity to copy these files, Tarantool will not delete them. But there will be no read-only mode and checkpoints will continue by schedule as usual. informs the server that normal operations may resume. optional argument starting with Tarantool 1.10.1 that indicates the checkpoint to use relative to the latest checkpoint. For example ``n = 0`` means “backup will be based on the latest checkpoint”, ``n = 1`` means "backup will be based on the first checkpoint before the latest checkpoint (counting backwards)", and so on. The default value for n is zero. tarantool> box.backup.start()
---
- - ./00000000000000000015.snap
  - ./00000000000000000000.vylog
  - ./513/0/00000000000000000002.index
  - ./513/0/00000000000000000002.run
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
 **Пример:** **Возвращает:** таблицу с именами снапшотов и файлов vinyl, которые нужно скопировать Оповещает сервер о том, что следует приостановить все активности, связанные с удалением устаревших резервных копий. Параметры Вложенный модуль `box.backup` Модуль ``box.backup`` содержит две функции, которые помогают при работе с :ref:`резервированным копированием <admin-backups>`. Чтобы гарантировать возможность скопировать эти файлы, Tarantool не станет их удалять. При этом он не переходит в режим read-only, и создание контрольных точек делается по расписанию, как обычно. оповещает сервер о том, что можно вернуться к работе в обычном режиме. необязательный аргумент, начиная с Tarantool 1.10.1, который указывает нужную контрольную точку относительно самой свежей точки. Например, ``n = 0`` означает “резервная копия будет создана на основе самой свежей контрольной точки”, ``n = 1`` означает "резервная копия будет создана на основе контрольной точки, которая была создана перед самой свежей точкой", и т.д. По умолчанию n = 0. tarantool> box.backup.start()
---
- - ./00000000000000000015.snap
  - ./00000000000000000000.vylog
  - ./513/0/00000000000000000002.index
  - ./513/0/00000000000000000002.run
... 