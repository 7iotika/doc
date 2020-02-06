��          �               �     �     �  (   �  +   �  7     4   T     �     �     �     �  
   �  �   �  �   �  �   =  �     q   �     @     D  #   L     p     v  P  }    �  �  �	     �     �  (   �  Z   �  y   :  q   �     &     9     N     U     q  �  �  $  h  4  �  `  �  �   #          1  B   G  2   �     �  P  �       **Example:** :ref:`errno() <errno-errno>` :ref:`errno.strerror() <errno-strerror>` Below is a list of all ``errno`` functions. Get an error message for the corresponding error number Get an error number for the last OS-related function Index Module `errno` Name Overview Parameters Return a string, given an error number. The string will contain the text of the conventional error message for the current operating system. If ``code`` is not supplied, the error message will be for the last operating-system-related function, or 0. Return an error number for the last operating-system-related function, or 0. To invoke it, simply say ``errno()``, without the module name. The ``errno`` module is typically used within a function or within a Lua program, in association with a module whose functions can return operating-system errors, such as :ref:`fio <fio-module>`. This function displays the result of a call to :ref:`fio.open() <fio-open>` which causes error 2 (``errno.ENOENT``). The display includes the error number, the associated error string, and the error name. To see all possible error names stored in the ``errno`` metatable, say ``getmetatable(errno)`` (output abridged): Use integer number of an operating-system error rtype string tarantool> function f()
         >   local fio = require('fio')
         >   local errno = require('errno')
         >   fio.open('no_such_file')
         >   print('errno() = ' .. errno())
         >   print('errno.strerror() = ' .. errno.strerror())
         >   local t = getmetatable(errno).__index
         >   for k, v in pairs(t) do
         >     if v == errno() then
         >       print('errno() constant = ' .. k)
         >     end
         >   end
         > end
---
...

tarantool> f()
errno() = 2
errno.strerror() = No such file or directory
errno() constant = ENOENT
---
... tarantool> getmetatable(errno)
---
- __newindex: 'function: 0x41666a38'
  __call: 'function: 0x41666890'
  __index:
  ENOLINK: 67
  EMSGSIZE: 90
  EOVERFLOW: 75
  ENOTCONN: 107
  EFAULT: 14
  EOPNOTSUPP: 95
  EEXIST: 17
  ENOSR: 63
  ENOTSOCK: 88
  EDESTADDRREQ: 89
  <...>
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
 **Пример:** :ref:`errno() <errno-errno>` :ref:`errno.strerror() <errno-strerror>` Ниже приведен перечень всех функций модуля ``errno``. Получение сообщения об ошибке для соответствующего номера ошибки Получение номера ошибки для последней функции, связанной с ОС Указатель Модуль `errno` Имя Общие сведения Параметры Возврат строки в ответ на номер ошибки. Строка будет содержать текст традиционного сообщения об ошибке для текущей операционной системы. Если не указан код ``code``, то будет выведено сообщение об ошибке для последней функции, связанной с операционной системой, или 0. Возврат номера ошибки для последней функции, связанной с операционной системой, или 0. Чтобы вызвать функцию, просто введите команду ``errno()`` без названия модуля. Модуль ``errno``, как правило, используется внутри функции или в рамках Lua-программы совместно с модулем, функции которого могут возвращать ошибки ОС, например :ref:`fio <fio-module>`. Данная функция отображает результат вызова :ref:`fio.open() <fio-open>`, который вызывает ошибку 2 (``errno.ENOENT``). В результат включен номер ошибки, связанная с ним строка сообщения об ошибке и название ошибки. Чтобы увидеть все возможные названия ошибок, которые хранятся в метатаблице ``errno``, введите команду ``getmetatable(errno)`` (выводятся сокращенно): Назначение целое число номер ошибки в операционной системе тип возвращаемого значения строка tarantool> function f()
         >   local fio = require('fio')
         >   local errno = require('errno')
         >   fio.open('no_such_file')
         >   print('errno() = ' .. errno())
         >   print('errno.strerror() = ' .. errno.strerror())
         >   local t = getmetatable(errno).__index
         >   for k, v in pairs(t) do
         >     if v == errno() then
         >       print('errno() constant = ' .. k)
         >     end
         >   end
         > end
---
...

tarantool> f()
errno() = 2
errno.strerror() = No such file or directory
errno() constant = ENOENT
---
... tarantool> getmetatable(errno)
---
- __newindex: 'function: 0x41666a38'
  __call: 'function: 0x41666890'
  __index:
  ENOLINK: 67
  EMSGSIZE: 90
  EOVERFLOW: 75
  ENOTCONN: 107
  EFAULT: 14
  EOPNOTSUPP: 95
  EEXIST: 17
  ENOSR: 63
  ENOTSOCK: 88
  EDESTADDRREQ: 89
  <...>
... 