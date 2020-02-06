��          L               |   �   }   6       R  |   _  b   �  �  ?  -  �  h       y    �  �   �	   As well as executing Lua chunks or defining your own functions, you can exploit Tarantool's storage functionality with the ``box`` module and its submodules. Every submodule contains one or more Lua functions. A few submodules contain members as well as functions. The functions allow data definition (create alter drop), data manipulation (insert delete update upsert select replace), and introspection (inspecting contents of spaces, accessing server configuration). Module `box` The contents of the ``box`` module can be inspected at runtime with ``box``, with no arguments. The ``box`` module contains: To catch errors that functions in ``box`` submodules may throw, use :ref:`pcall <error_handling>`. Project-Id-Version: Tarantool 1.10
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
 Помимо выполнения фрагментов кода на Lua или определения собственных функций, с помощью модуля ``box`` и вложенных модулей можно использовать функции хранилища Tarantool'а. Каждый вложенный модуль включает в себя одну или более Lua-функций. Несколько вложенных модулей включают в себя элементы класса, а также функции. Функции обеспечивают определение данных (create alter drop), управление данными (insert delete update upsert select replace) и просмотр состояния (просмотр содержимого спейсов, получение доступа к конфигурации сервера). Модуль `box` Содержимое модуля ``box`` можно просмотреть во время исполнения кода с помощью команды ``box`` без аргументов. Модуль ``box`` включает в себя следующее: Чтобы найти ошибки, которые могут выдать вложенные модули ``box``, используйте :ref:`pcall <error_handling>`. 