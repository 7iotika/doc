��          L               |      }   �   �      X  6  h  2  �  �  �     u  T  �     �  p  �  {  c	   **Example:** By default strict mode is off, unless tarantool was built with the ``-DCMAKE_BUILD_TYPE=Debug`` option -- see the description of build options in section :ref:`building-from-source <building_from_source>`. Module `strict` The :code:`strict` module has functions for turning "strict mode" on or off. When strict mode is on, an attempt to use an undeclared global variable will cause an error. A global variable is considered "undeclared" if it has never had a value assigned to it. Often this is an indication of a programming error. tarantool> strict = require('strict')
---
...
tarantool> strict.on()
---
...
tarantool> a = b -- strict mode is on so this will cause an error
---
- error: ... variable ''b'' is not declared'
...
tarantool> strict.off()
---
...
tarantool> a = b -- strict mode is off so this will not cause an error
---
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
 **Пример:** По умолчанию, строгий режим отключен, не считая случаев, когда сборка Tarantool'а производилась с помощью ``-DCMAKE_BUILD_TYPE=Debug`` -- см. варианты сборки в разделе :ref:`сборка из исходников <building_from_source>`. Модуль `strict` Модуль :code:`strict` включает в себя функции для включения или отключения строгого режима "strict mode". Когда включен строгий режим, попытка использовать необъявленную глобальную переменную приведет к ошибке. Глобальная переменная считается необъявленной, если ей никогда не было присвоено значение. Часто это указывает на ошибку программирования. tarantool> strict = require('strict')
---
...
tarantool> strict.on()
---
...
tarantool> a = b -- строгий режим включен, поэтому появляется ошибка
---
- error: ... variable ''b'' is not declared'
...
tarantool> strict.off()
---
...
tarantool> a = b -- строгий режим отключен, поэтому ошибки нет
---
... 