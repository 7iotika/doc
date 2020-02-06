��    N      �              �  �  �  �  �            =     D   Z  \   �     �  '   	  
   5	     @	     W	     c	     x	  �   �	  &   G
     n
  K   z
     �
     �
  
   �
     �
  "   �
        (   #  @   L  <   �  (   �  P   �     D  9   Z     �  )   �  )   �  (   �  )   &  �   P     9    A  �   H     �     �     �     �  
      �       �  G     C   L    �     �     �  	   �  .   �  2   �          5  +   T     �  +   �  9   �    �  
                        '     -     9     @    Q  &   k  /   �  3   �     �  B   �     >  �  A  �  �  (  h     �     �  �   �  �   7  l   �     ;   '   L   
   t            �      �      �     �   A   �!     "  K   1"     }"     �"  
   �"     �"  "   �"      �"  (   �"  @   #  <   D#  (   �#  �   �#  %   �$  r   �$  +   ,%  B   X%  A   �%  ?   �%  @   &  P  ^&     �'  �  �'  �   N)     )*     <*     S*     Z*     v*  �  �*  �  W,  �   .  d   �.  �  ?/     �0     1  	   1  [   1  ?   v1  '   �1  O   �1  T   .2     �2  +   �2  9   �2    �2     5     5     &5     *5  2   ?5     r5     �5     �5    �5  ?   �6  S   7  b   c7     �7  �   �7     h8    tarantool> msgpack = require('msgpack'); msgpack.cfg{encode_invalid_numbers = true}
 ---
 ...
 tarantool> msgpack.decode(msgpack.encode{1, 0 / 0, 1 / 0, false})
 ---
 - [1, -nan, inf, false]
 - 22
 ...
 tarantool> msgpack.cfg{encode_invalid_numbers = false}
---
...
 tarantool> msgpack.decode(msgpack.encode{1, 0 / 0, 1 / 0, false})
 ---
 - error: ... number must not be NaN or Inf'
... "next_start_position". If ``decode`` stops after parsing as far as byte N in ``msgpack_string``, then "next_start_position" will equal N + 1, and ``decode(msgpack_string, next_start_position)`` will continue parsing from where the previous ``decode`` stopped, plus 1. Normally ``decode`` parses all of ``msgpack_string``, so "next_start_position" will equal ``string.len(msgpack_string)`` + 1. 'a' 'false' = c2 'fixmap' if metatable is 'map' = 80 otherwise 'fixarray' = 90 'fixmap(0)' = 80 -- nil is not stored when it is a missing map value 'fixmap(1)' + 'positive fixint' (for the key) + 'positive fixint' (for the value) = 81 00 05 'fixstr' = a1 61 'float 64' = cb 3f f8 00 00 00 00 00 00 'nil' = c0 'positive fixint' = 7f 'true' = c3 'uint 16' = cd ff ff 'uint 32' = ce ff ff ff ff (if ``msgpack_string`` is in valid MsgPack format) the original contents of ``msgpack_string``, formatted as a Lua table, (otherwise) a scalar value, such as a string or a number; **Common Types and MsgPack Encodings** **Result:** **array** encoding: 92 a1 41 a1 42
**map** encoding:   82 01 a1 41 02 a1 42 1.5 127 4294967295 65535 :ref:`msgpack.NULL <msgpack-null>` :ref:`msgpack.cfg <msgpack-cfg>` :ref:`msgpack.decode() <msgpack-decode>` :ref:`msgpack.decode_array_header <msgpack-decode_array_header>` :ref:`msgpack.decode_unchecked() <msgpack-decode_unchecked>` :ref:`msgpack.encode() <msgpack-encode>` A value comparable to Lua "nil" which may be useful as a placeholder in a tuple. Analog of Lua's "nil" Below is a list of all ``msgpack`` functions and members. Change configuration Convert a Lua object to a MsgPack string. Convert a Lua object to an MsgPack string Convert a MsgPack string to a Lua object Convert a MsgPack string to a Lua object. Convert a MsgPack string to a Lua object. Because checking is skipped, ``decode_unchecked()`` can operate with string pointers to buffers which ``decode()`` cannot handle. For an example see the :ref:`buffer <buffer-module>` module. Example For example, if ``msgpack.cfg.encode_invalid_numbers = true`` (the default), then nan and inf are legal values. If that is not desirable, then ensure that ``msgpack.encode()`` will not accept them, by saying ``msgpack.cfg{encode_invalid_numbers = false}``, thus: Here are examples for all the common types, with the Lua-table representation on the left, with the MsgPack format name and encoding on the right. Index Module `msgpack` Name Overview Parameters Serializing 'A' and 'B' with different ``__serialize`` values causes different results. To show this, here is a routine which encodes `{'A','B'}` both as an array and as a map, then displays each result in hexadecimal. Some MsgPack configuration settings can be changed, in the same way that they can be changed for json. See :ref:`Module JSON <json-module_cfg>` for a list of some configuration settings. (The same configuration settings exist for json, for MsgPack, and for  :ref:`YAML <yaml-module>`.) The MsgPack Specification_ page explains that the first encoding means: The MsgPack output structure can be specified with ``__serialize``: The ``msgpack`` module takes strings in MsgPack_ format and decodes them, or takes a series of non-MsgPack values and encodes them. Tarantool makes heavy internal use of MsgPack because tuples in Tarantool are :ref:`stored <index-box_lua-vs-msgpack>` as MsgPack arrays. Use [0] = 5 [0] = nil ``__serialize = "map" or "mapping"`` for a map ``__serialize = "seq" or "sequence"`` for an array a string formatted as MsgPack. and the second encoding means: either a scalar value or a Lua table value. false fixarray(2), fixstr(1), "A", fixstr(1), "B" fixmap(2), key(1), fixstr(1), "A", key(2), fixstr(2), "B" function hexdump(bytes)
    local result = ''
    for i = 1, #bytes do
        result = result .. string.format("%x", string.byte(bytes, i)) .. ' '
    end
    return result
end

msgpack = require('msgpack')
m1 = msgpack.encode(setmetatable({'A', 'B'}, {
                             __serialize = "seq"
                          }))
m2 = msgpack.encode(setmetatable({'A', 'B'}, {
                             __serialize = "map"
                          }))
print('array encoding: ', hexdump(m1))
print('map encoding: ', hexdump(m2)) lua object msgpack.NULL nil return rtype same as nil string table and number tarantool> msgpack = require('msgpack')
---
...
tarantool> y = msgpack.encode({'a',1,'b',2})
---
...
tarantool> z = msgpack.decode(y)
---
...
tarantool> z[1], z[2], z[3], z[4]
---
- a
- 1
- b
- 2
...
tarantool> box.space.tester:insert{20, msgpack.NULL, 20}
---
- [20, null, 20]
... the number of bytes that were decoded. the original contents formatted as a Lua table; the original value reformatted as a MsgPack string. true where to start, minimum = 1, maximum = string length, default = 1. {} Project-Id-Version: Tarantool 1.10
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
  tarantool> msgpack = require('msgpack'); msgpack.cfg{encode_invalid_numbers = true}
 ---
 ...
 tarantool> msgpack.decode(msgpack.encode{1, 0 / 0, 1 / 0, false})
 ---
 - [1, -nan, inf, false]
 - 22
 ...
 tarantool> msgpack.cfg{encode_invalid_numbers = false}
---
...
 tarantool> msgpack.decode(msgpack.encode{1, 0 / 0, 1 / 0, false})
 ---
 - error: ... number must not be NaN or Inf'
... "next_start_position". Если расшифровка ``decode`` останавливается после разбора байта N в ``msgpack_string``, то "next_start_position" = N + 1, а ``decode(msgpack_string, next_start_position)`` продолжит разбор с места остановки предыдущего ``decode`` плюс 1. Как правило, ``decode`` разбирает всю строку ``msgpack_string``, поэтому "next_start_position" будет равняться ``string.len(msgpack_string)`` + 1. 'a' 'false' = c2 'fixmap' = 80, если метатаблица -- ассоциативный массив 'map', в противном случае, 'fixarray' = 90 'fixmap(0)' = 80 -- nil не хранится, если это отсутствующее значение ассоциативного массива 'fixmap(1)' + 'positive fixint' (для ключа) + 'positive fixint' (для значения) = 81 00 05 'fixstr' = a1 61 'float 64' = cb 3f f8 00 00 00 00 00 00 'nil' = c0 'positive fixint' = 7f 'true' = c3 'uint 16' = cd ff ff 'uint 32' = ce ff ff ff ff (если ``msgpack_string`` в правильном MsgPack-формате) содержимое ``msgpack_string`` в формате Lua-таблицы, (в противном случае) скалярное значение, строка или число; **Стандартные типы в MsgPack-кодировке** **Результат:** **array** encoding: 92 a1 41 a1 42
**map** encoding:   82 01 a1 41 02 a1 42 1,5 127 4294967295 65535 :ref:`msgpack.NULL <msgpack-null>` :ref:`msgpack.cfg <msgpack-cfg>` :ref:`msgpack.decode() <msgpack-decode>` :ref:`msgpack.decode_array_header <msgpack-decode_array_header>` :ref:`msgpack.decode_unchecked() <msgpack-decode_unchecked>` :ref:`msgpack.encode() <msgpack-encode>` Значение, сопоставимое с нулевым значением "nil" в языке Lua, которое можно использовать в качестве объекта-заполнителя в кортеже. Аналог "nil" в языке Lua  Ниже приведен перечень всех функций и элементов модуля ``msgpack``. Изменение конфигурации Конвертация Lua-объекта в MsgPack-строку. Конвертация Lua-объекта в MsgPack-строку Конвертация MsgPack-строки в Lua-объект Конвертация MsgPack-строки в Lua-объект. Конвертация MsgPack-строки в Lua-объект. Поскольку проверка не проводится, ``decode_unchecked()`` может работать с указателями строки в буфере в отличие от ``decode()``. Пример см. в модуле :ref:`buffer <buffer-module>`. Пример Например, если ``msgpack.cfg.encode_invalid_numbers = true`` (по умолчанию), то допускаются значения nan и inf. Если это нежелательно, следует убедиться, что ``msgpack.encode()`` не примет такие значения, выполнив ``msgpack.cfg{encode_invalid_numbers = false}``. Таким образом: Ниже приведены примеры всех стандартных типов: слева отображение в Lua-таблице, а справа -- имя и кодировка в формате MsgPack. Указатель Модуль `msgpack` Имя Общие сведения Параметры Сериализация 'A' и' B' различными значениями ``__serialize`` приводит к различным результатам. Чтобы показать различия, ниже приведена процедура кодирования `{'A','B'}` в массив и в ассоциативный массив с выводом каждого результата в виде шестнадцатеричного числа. Некоторые параметры конфигурации MsgPack для кодировки можно изменить так же, как и для JSON. Список некоторых настроек см. в :ref:`Модуле JSON <json-module_cfg>`. (Такие параметры конфигурации применяются для формата JSON, для :ref:`MsgPack <msgpack-module>` и для :ref:`YAML <yaml-module>`.) На странице спецификации MsgPack по ссылке Specification_ объясняется, что значение первого результата кодирования: Структуру MsgPack-вывода можно указать с помощью ``__serialize``: Модуль ``msgpack`` берет строки в формате MsgPack_ и декодирует их или берет ряд значений в ином формате и кодирует их в формат MsgPack. MsgPack интенсивно используется в Tarantool'е, поскольку кортежи :ref:`хранятся <index-box_lua-vs-msgpack>` в виде массивов в формате MsgPack. Назначение [0] = 5 [0] = nil ``__serialize = "map" или "mapping"`` для ассоциативного массива ``__serialize = "seq" или "sequence"`` для массива строка в формате MsgPack. а значение второго результата кодирования: скалярное значение или значение из Lua-таблицы. false fixarray(2), fixstr(1), "A", fixstr(1), "B" fixmap(2), key(1), fixstr(1), "A", key(2), fixstr(2), "B" function hexdump(bytes)
    local result = ''
    for i = 1, #bytes do
        result = result .. string.format("%x", string.byte(bytes, i)) .. ' '
    end
    return result
end

msgpack = require('msgpack')
m1 = msgpack.encode(setmetatable({'A', 'B'}, {
                             __serialize = "seq"
                          }))
m2 = msgpack.encode(setmetatable({'A', 'B'}, {
                             __serialize = "map"
                          }))
print('array encoding: ', hexdump(m1))
print('map encoding: ', hexdump(m2)) Lua-объект. msgpack.NULL nil возвращает тип возвращаемого значения то же, что и nil строка таблица и число tarantool> msgpack = require('msgpack')
---
...
tarantool> y = msgpack.encode({'a',1,'b',2})
---
...
tarantool> z = msgpack.decode(y)
---
...
tarantool> z[1], z[2], z[3], z[4]
---
- a
- 1
- b
- 2
...
tarantool> box.space.tester:insert{20, msgpack.NULL, 20}
---
- [20, null, 20]
... количество декодированных байтов. оригинальное содержание в формате Lua-таблицы; оригинальное значение, преобразованное в MsgPack-строку. true откуда начинать, минимальное значение = 1, максимальное = длина строки, по умолчанию = 1. {} 