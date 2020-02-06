��    $      <              \     ]  $   j  *   �  (   �  &   �  /   
     :  g   U      �  �   �  \  �       #   !     E     K     P  
   Y  �  d       D  0     u	     �	  y   �	  U   
  (   X
     �
     �
  ,   �
  2   �
             3    J  4  R  (   �  �  �     S  $   e  *   �  (   �  &   �  ^     /   d  �   �  1   #  k  U  �  �     �  C   �               %     A  .  T  +   �  �  �     �     �  �   �  �   �  Y   D     �  E   �  i   �  S   d   B   �     �     "    2$  	  :%  4   D'   **Example:** :ref:`box.error() <box_error-error>` :ref:`box.error.clear() <box_error-clear>` :ref:`box.error.last() <box_error-last>` :ref:`box.error.new() <box_error-new>` Below is a list of all ``box.error`` functions. Clear the record of errors Clears the record of errors, so functions like `box.error()` or `box.error.last()` will have no effect. Create an error but do not throw Create an error object, but do not throw. This is useful when error information should be saved for later retrieval. The parameters are the same as for :ref:`box.error() <box_error-error>`, see the description there. Emulate a request error, with text based on one of the pre-defined Tarantool errors defined in the file `errcode.h <https://github.com/tarantool/tarantool/blob/2.1/src/box/errcode.h>`_ in the source tree. Lua constants which correspond to those Tarantool errors are defined as members of ``box.error``, for example ``box.error.NO_SUCH_USER == 45``. For example: Get a description of the last error Index Name Overview Parameters Returns a description of the last error, as a Lua table with five members: "line" (number) Tarantool source file line number, "code" (number) error's number, "type", (string) error's C++ class, "message" (string) error's message, "file" (string) Tarantool source file. Additionally, if the error is a system error (for example due to a failure in socket or file io), there may be a sixth member: "errno" (number) C standard error number. Submodule `box.error` The ``box.error`` function is for raising an error. The difference between this function and Lua's built-in `error <https://www.lua.org/pil/8.3.html>`_ function is that when the error reaches the client, its error code is preserved. In contrast, a Lua error would always be presented to the client as :errcode:`ER_PROC_LUA`. Throw an error Use When called with a Lua-table argument, the code and reason have any user-desired values. The result will be those values. When called without arguments, ``box.error()`` re-throws whatever the last error was. description of an error, defined by user except number of a pre-defined error numeric code for this error, defined by user part of the message which will accompany the error rtype: table tarantool> box.error{code = 555, reason = 'Arbitrary message'}
---
- error: Arbitrary message
...
tarantool> box.error()
---
- error: Arbitrary message
...
tarantool> box.error(box.error.FUNCTION_ACCESS_DENIED, 'A', 'B', 'C')
---
- error: A access denied for user 'B' to function 'C'
... tarantool> box.error{code = 555, reason = 'Arbitrary message'}
---
- error: Arbitrary message
...
tarantool> box.schema.space.create('#')
---
- error: Invalid identifier '#' (expected letters, digits or an underscore)
...
tarantool> box.error.last()
---
- line: 278
  code: 70
  type: ClientError
  message: Invalid identifier '#' (expected letters, digits or an underscore)
  file: /tmp/buildd/tarantool-1.7.0.252.g1654e31~precise/src/box/key_def.cc
...
tarantool> box.error.clear()
---
...
tarantool> box.error.last()
---
- null
... tarantool> e = box.error.new{code = 555, reason = 'Arbitrary message'}
---
...
tarantool> e:unpack()
---
- type: ClientError
  code: 555
  message: Arbitrary message
  trace:
  - file: '[string "e = box.error.new{code = 555, reason = ''Arbit..."]'
    line: 1
... the ``NO_SUCH_USER`` message is "``User '%s' is not found``" -- it includes one "``%s``" component which will be replaced with errtext. Thus a call to ``box.error(box.error.NO_SUCH_USER, 'joe')`` or ``box.error(45, 'joe')`` will result in an error with the accompanying message "``User 'joe' is not found``". whatever is specified in errcode-number. Project-Id-Version: Tarantool 1.10
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
 **Пример:** :ref:`box.error() <box_error-error>` :ref:`box.error.clear() <box_error-clear>` :ref:`box.error.last() <box_error-last>` :ref:`box.error.new() <box_error-new>` Ниже приведен перечень всех функций модуля ``box.error``. Очистка записи об ошибках Очистка записи об ошибках, то есть функции `box.error()` или `box.error.last()` не сработают. Создание ошибки без выдачи Создание ошибки без выдачи. Используется, когда необходимо сохранить информацию об ошибке для последующей выборки. Используются такие же параметры, как в :ref:`box.error() <box_error-error>`, см. описание по ссылке. Моделирование ошибки запроса с текстом на основе одной из ошибок Tarantool'а, заданных в файле `errcode.h <https://github.com/tarantool/tarantool/blob/2.1/src/box/errcode.h>`_ в исходном дереве. Lua-постоянные, которые соответствуют этим ошибкам в Tarantool'е, определяются как элементы ``box.error``, например ``box.error.NO_SUCH_USER == 45``. Пример: Получение описания последней ошибки Указатель Имя Общие сведения Параметры Возвращает описание последней ошибки в виде Lua-таблицы с 5 элементами: "line" (число) -- номер строки в исходном файле Tarantool'а, "code" (число) -- номер ошибки, "type" (строка) -- C++ класс ошибки, "message" (строка) -- сообщение об ошибке, "file" (строка) -- исходный файл Tarantool'а. Кроме того, если ошибка является системной (например, по причине ошибки в сокете или файловом вводы-выводе), может быть дополнительный шестой элемент: "errno" (число) стандартный номер ошибки на языке C. Вложенный модуль `box.error` Функция ``box.error`` предназначена для вызова ошибки. Разница между этой функцией и встроенной Lua-функцией `error <https://www.lua.org/pil/8.3.html>`_ в том, что когда клиент получает ошибку, код ошибки сохраняется. В отличие от этого, ошибки в Lua всегда передаются на клиент в виде :errcode:`ER_PROC_LUA`. Вызов ошибки Назначение При вызове с аргументом из Lua-таблицы значения параметров code и reason будут любыми по желанию пользователя. Результатом будут эти значения. При вызове без аргументов ``box.error()`` повторно вызывает последнюю ошибку. (строка) описание ошибки, задается пользователем Исключение: номер предварительно заданной ошибки (целое число) числовой код ошибки, задается пользователем часть сообщения, которое сопровождает ошибку Тип возвращаемого значения: таблица tarantool> box.error{code = 555, reason = 'Arbitrary message'}
---
- error: Arbitrary message
...
tarantool> box.error()
---
- error: Arbitrary message
...
tarantool> box.error(box.error.FUNCTION_ACCESS_DENIED, 'A', 'B', 'C')
---
- error: A access denied for user 'B' to function 'C'
... tarantool> box.error{code = 555, reason = 'Arbitrary message'}
---
- error: Arbitrary message
...
tarantool> box.schema.space.create('#')
---
- error: Invalid identifier '#' (expected letters, digits or an underscore)
...
tarantool> box.error.last()
---
- line: 278
  code: 70
  type: ClientError
  message: Invalid identifier '#' (expected letters, digits or an underscore)
  file: /tmp/buildd/tarantool-1.7.0.252.g1654e31~precise/src/box/key_def.cc
...
tarantool> box.error.clear()
---
...
tarantool> box.error.last()
---
- null
... tarantool> e = box.error.new{code = 555, reason = 'Arbitrary message'}
---
...
tarantool> e:unpack()
---
- type: ClientError
  code: 555
  message: Arbitrary message
  trace:
  - file: '[string "e = box.error.new{code = 555, reason = ''Arbit..."]'
    line: 1
... сообщение ``NO_SUCH_USER`` = "``User '%s' is not found``" (пользователь не найден) -- оно включает в себя компонент "``%s``", который будет заменен значением параметра errtext. Таким образом, вызов ``box.error(box.error.NO_SUCH_USER, 'joe')`` или ``box.error(45, 'joe')`` приведет к ошибке с сообщением "``User 'joe' is not found``" (пользователь 'joe' не найден). то, что указано в номере errcode. 