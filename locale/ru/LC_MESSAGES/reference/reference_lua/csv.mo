��    :      �              �     �     �  "   �    
       v   -  `   �  l     n   r  )   �  A        M  �   l  �     U  �     /
     5
  '   N
  I   v
     �
  Z   �
     +     A     N     S  
   \  2   g  �   �  �   >  M   �  3     -   G  ]   u  !   �  >   �  +   4     `  �   d  W     :   _  )   �     �     �     �  (   �                &  5   E     {  C  �  f   �  n   ,  M   �  <   �  c   &  =  �  �  �     k     }  "   �  �  �     M  �   j  �   X  �      �   �  X   r  �   �  8   m  X  �  �  �  �  �     9"  :   L"  O   �"  �   �"     |#  �   �#  *   Y$     �$     �$     �$     �$  e   �$    3%  �   I&  �   '  t   �'  k   F(  �   �(  q   �)  f   �)  a   Y*     �*    �*     �+  z   S,  5   �,  %   -  &   *-  '   Q-  ?   y-     �-  2   �-  #   .  i   %.     �.  e  �.  f   0  n   k0  M   �0  <   (1  c   e1  =  �1   **Example:** :ref:`csv.dump() <csv-dump>` :ref:`csv.iterate() <csv-iterate>` :ref:`csv.iterate() <csv-iterate>` is the low level of :ref:`csv.load() <csv-load>` and :ref:`csv.dump() <csv-dump>`. To illustrate that, here is a function which is the same as the :ref:`csv.load() <csv-load>` function, as seen in `the Tarantool source code`_. :ref:`csv.load() <csv-load>` :samp:`chunk_size = {number}` (default: 4096) -- number of characters to read at once (usually for file-IO efficiency) :samp:`delimiter = {string}` (default: comma) -- single-byte character to designate end-of-field :samp:`quote_char = {string}` (default: quote mark) -- single-byte character to designate encloser of string :samp:`skip_head_lines = {number}` (default: 0) -- number of lines to skip at the start (usually for a header) Below is a list of all ``csv`` functions. CSV-table has 3 fields, field#2 has "," so result has quote marks Commas designate end-of-field, Form a Lua iterator function for going through CSV records one field at a time. Use of an iterator is strongly recommended if the amount of data is large (ten or more megabytes). Get CSV-formatted input from ``readable`` and return a table as output. Usually ``readable`` is either a string or a file opened for reading. Usually :samp:`{options}` is not specified. Get table input from ``csv-table`` and return a CSV-formatted string as output. Or, get table input from ``csv-table`` and put the output in ``writable``. Usually :samp:`{options}` is not specified. Usually ``writable``, if specified, is a file opened for writing. :ref:`csv.dump() <csv-dump>` is the reverse of :ref:`csv.load() <csv-load>`. Index Iterate over CSV records Leading or trailing spaces are ignored, Line feeds, or line feeds plus carriage returns, designate end-of-record, Load a CSV file Lua `escape sequences`_ such as \\n or \\10 are legal within strings but not within files, Lua iterator function Module `csv` Name Overview Parameters Quote marks may enclose fields or parts of fields, Readable file :file:`./file.csv` contains two CSV records. Explanation of ``fio`` is in section :ref:`fio <fio-section>`. Source CSV file and example respectively: Readable string contains 2-byte character = Cyrillic Letter Palochka: (This displays a palochka if and only if character set = UTF-8.) Readable string has 3 fields, field#2 has comma and space so use quote marks: Round Trip: from string to table and back to string Semicolon instead of comma for the delimiter: The ``csv`` module handles records formatted according to Comma-Separated-Values (CSV) rules. The default formatting rules are: The possible options which can be passed to csv functions are: Transform input into a CSV-formatted string Use When enclosed by quote marks, commas and line feeds and spaces are treated as ordinary characters, and a pair of quote marks "" is treated as a single quote mark. a string, or any object which has a read() method, formatted according to the CSV rules a table which can be formatted according to the CSV rules. any object which has a ``write()`` method dumped_value iterator function loaded_value optional. see :ref:`above <csv-options>` return rtype see :ref:`above <csv-options>` string, which is written to ``writable`` if specified table tarantool> -- input in file.csv is:
tarantool> -- a,"b,c ",d
tarantool> -- a\\211\\128b
tarantool> fio = require('fio')
---
...
tarantool> f = fio.open('./file.csv', {'O_RDONLY'})
---
...
tarantool> csv.load(f, {chunk_size = 4096})
---
- - - a
    - 'b,c '
    - d
  - - a\\211\\128b
...
tarantool> f:close()
---
- true
... tarantool> csv = require('csv')
---
...
tarantool> csv.dump({'a','b,c ','d'})
---
- 'a,"b,c ",d

'
... tarantool> csv = require('csv')
---
...
tarantool> csv.load('a,"b,c ",d')
---
- - - a
    - 'b,c '
    - d
... tarantool> csv.load('a,b;c,d', {delimiter = ';'})
---
- - - a,b
    - c,d
... tarantool> csv.load('a\\211\\128b')
---
- - - a\211\128b
... tarantool> csv_table = csv.load('a,b,c')
---
...
tarantool> csv.dump(csv_table)
---
- 'a,b,c

'
... tarantool> load = function(readable, opts)
         >   opts = opts or {}
         >   local result = {}
         >   for i, tup in csv.iterate(readable, opts) do
         >     result[i] = tup
         >   end
         >   return result
         > end
---
...
tarantool> load('a,b,c')
---
- - - a
    - b
    - c
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
 **Пример:** :ref:`csv.dump() <csv-dump>` :ref:`csv.iterate() <csv-iterate>` :ref:`csv.iterate() <csv-iterate>` -- это :ref:`csv.load() <csv-load>` и :ref:`csv.dump() <csv-dump>` низкого уровня. Чтобы это доказать, используем функцию, которая совпадает с функцией  :ref:`csv.load() <csv-load>`, как можно увидеть в исходном коде Tarantool'а (`the Tarantool source code`_). :ref:`csv.load() <csv-load>` :samp:`chunk_size = {число}` (по умолчанию: 4096) -- число символов для одновременного чтения (обычно для эффективности файлового ввода-вывода) :samp:`delimiter = {строка}` (по умолчанию: запятая) -- однобайтовый символ для обозначения конца поля :samp:`quote_char = {строка}` (по умолчанию: кавычка) -- однобайтовый символ для обозначения закрытия строки :samp:`skip_head_lines = {число}` (по умолчанию: 0) -- число строк, которые пропускаются в начале (обычно для заголовка) Ниже приведен перечень всех функций модуля ``csv``. В таблице формата CSV 3 поля, поле №2 содержит "," поэтому результат включает в себя кавычки Запятые обозначают конец поля, Создание Lua-функции с итератором для прохода по записям в формате CSV по одному полю за раз. Настоятельно рекомендуется использовать итератор для большого объема данных (10 мегабайт и более). Получение входного значения в формате CSV из ``readable`` и возврат таблицы в качестве выходного значения. Обычно ``readable`` представляет собой либо строку, либо открытый для чтения файл. Как правило, параметры :samp:`{options}` не указываются. Получение входного значения из таблицы ``csv-table`` и возврат строки в формате CSV в качестве выходного значения. Или получение входного значения из таблицы ``csv-table`` и размещение выходного значения в ``writable``. Обычно параметры :samp:`{options}` не указываются. Как правило, если указан ``writable``, то это открытый для чтения файл. :ref:`csv.dump() <csv-dump>` -- это операция, обратная :ref:`csv.load() <csv-load>`. Указатель Итерация по записям в формате CSV Начальные и конечные пробелы игнорируются, Символы перевода строки или перевода строки плюс возврата каретки означают конец записи, Загрузка CSV-файла Escape-последовательности `escape sequences`_ в Lua, такие как \\n или \\10, можно использовать в строках, но не в файлах, Lua-функция с итератором Модуль `csv` Имя Общие сведения Параметры Кавычками могут обрамляться поля или компоненты полей, Читаемый файл :file:`./file.csv` содержит две записи в формате CSV. Объяснение блока ``fio`` дается в разделе :ref:`fio <fio-section>`. Исходный CSV-файл и пример соответственно: В читаемой строке 2-байтный символ = Палочка в кириллице: (Отобразит палочку только в том случае, если кодировка = UTF-8.) В читаемой строке 3 поля, поле №2 содержит запятую и пробел, поэтому следует использовать кавычки: Круговое преобразование: из строки в таблицу и обратно в строку Точка с запятой вместо запятой в виде символа разделителя: Модуль ``csv`` обрабатывает записи, форматированные в соответствии с правилами CSV (значения, разделенные запятыми). По умолчанию, используются следующие правила форматирования: Параметры, которые можно передать в функции модуля ``csv``: Преобразование входного значения в строку формата CSV Назначение При обрамлении кавычками запятые, символы перевода строки и пробелы считаются обычными символами, а двойные кавычки "" считаются одинарными. строка или любой объект с методом read(), форматированный по правилам CSV  таблица, которую можно форматировать в соответствии с правилами CSV любой объект с методом ``write()`` записанное значение функция с итератором загруженное значение необязательно. См. :ref:`выше <csv-options>` возвращает тип возвращаемого значения см. :ref:`выше <csv-options>` строка, которая записывается в объект ``writable``, если указан таблица tarantool> -- входное значение в файле file.csv:
tarantool> -- a,"b,c ",d
tarantool> -- a\\211\\128b
tarantool> fio = require('fio')
---
...
tarantool> f = fio.open('./file.csv', {'O_RDONLY'})
---
...
tarantool> csv.load(f, {chunk_size = 4096})
---
- - - a
    - 'b,c '
    - d
  - - a\\211\\128b
...
tarantool> f:close()
---
- true
... tarantool> csv = require('csv')
---
...
tarantool> csv.dump({'a','b,c ','d'})
---
- 'a,"b,c ",d

'
... tarantool> csv = require('csv')
---
...
tarantool> csv.load('a,"b,c ",d')
---
- - - a
    - 'b,c '
    - d
... tarantool> csv.load('a,b;c,d', {delimiter = ';'})
---
- - - a,b
    - c,d
... tarantool> csv.load('a\\211\\128b')
---
- - - a\211\128b
... tarantool> csv_table = csv.load('a,b,c')
---
...
tarantool> csv.dump(csv_table)
---
- 'a,b,c

'
... tarantool> load = function(readable, opts)
         >   opts = opts or {}
         >   local result = {}
         >   for i, tup in csv.iterate(readable, opts) do
         >     result[i] = tup
         >   end
         >   return result
         > end
---
...
tarantool> load('a,b,c')
---
- - - a
    - b
    - c
... 