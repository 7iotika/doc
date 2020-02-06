��    Q      �              ,  #  -     Q     ^  &   {  $   �  $   �      �  .     E  <  $   �  $   �      �  $   �  $   	  $   7	  (   \	  &   �	  .   �	  '   �	  (   
  $   ,
  #   Q
  o   u
  %   �
  �     &   �     �     �  .        4     <  "   B  *   e  
   �     �     �     �     �  
   �  j   �  0   8  %   i  �   �  n   G  C  �  C   �  �   >  �   �    �  �     9   �  =   �  �   .     �  h   �  X   b  c   �       /   -  $   ]     �  6   �  D   �               '  �   +     �     �     �  4   �     0  �   8  E     1   \     �     �     �     �     �  �  �  #  �     �     �  &   �  $   
  $   /      T  .   u  E  �  $   �  $         4  $   U  $   z  $   �  (   �  ^   �  F   L   K   �   =   �   A   !  I   _!  �   �!  J   �"    �"  F   �#  @   1$  A   r$  L   �$     %     %  G   !%  H   i%     �%     �%     �%     �%     &     &  �   2&  X   '  (   Z'  �   �'  �   ;(  �  ,)  v   �+  	  B,  �  L-    �.  ?  1  4   P2  8   �2  �  �2     �4  �   �4  n   F5  y   �5  )   /6  G   Y6  Z   �6     �6  E   7  q   a7  %   �7     �7     8  #  8     39     @9  2   U9  4   �9     �9  �   �9  E   �:  1   �:  ,   ;  5   H;  ,   ~;  -   �;     �;   #!/usr/bin/tarantool
local tap = require('tap')
test = tap.test("my test name")
test:plan(2)
test:ok(2 * 2 == 4, "2 * 2 is 4")
test:test("some subtests for test2", function(test)
    test:plan(2)
    test:is(2 + 2, 4, "2 + 2 is 4")
    test:isnt(2 + 3, 4, "2 + 3 is not 4")
end)
test:check() **Example:** :ref:`tap.test() <tap-test>` :ref:`taptest:check() <taptest-check>` :ref:`taptest:diag() <taptest-diag>` :ref:`taptest:fail() <taptest-fail>` :ref:`taptest:is() <taptest-is>` :ref:`taptest:is_deeply() <taptest-is_deeply>` :ref:`taptest:isnil() <taptest-istype>` |br| :ref:`taptest:isstring() <taptest-istype>` |br| :ref:`taptest:isnumber() <taptest-istype>` |br| :ref:`taptest:istable() <taptest-istype>` |br| :ref:`taptest:isboolean() <taptest-istype>` |br| :ref:`taptest:isudata() <taptest-istype>` |br| :ref:`taptest:iscdata() <taptest-istype>` :ref:`taptest:isnt() <taptest-isnt>` :ref:`taptest:like() <taptest-like>` :ref:`taptest:ok() <taptest-ok>` :ref:`taptest:plan() <taptest-plan>` :ref:`taptest:skip() <taptest-skip>` :ref:`taptest:test() <taptest-test>` :ref:`taptest:unlike() <taptest-unlike>` Check if a value has a particular type Check if the argument does not match a pattern Check if the argument matches a pattern Check if the two arguments are different Check if the two arguments are equal Check the number of tests performed Check whether the first argument equals the second argument. Displays extensive message if the result is false. Checks the number of tests performed. Create a subtest (if no ``func`` argument specified), or (if all arguments are specified) create a subtest, run the test function and print the result. Create a subtest and print the results Display a diagnostic message Display a diagnostic message. Evaluate the condition and display the message Example Index Indicate how many tests to perform Indicate how many tests will be performed. Initialize Initialize. Module `tap` Name Overview Parameters Recursive version of ``taptest:is(...)``, which can be be used to compare tables as well as scalar values. Recursively check if the two arguments are equal See the :ref:`example <tap-example>`. TAP version 13
1..2
ok - 2 * 2 is 4
    # Some subtests for test2
    1..2
    ok - 2 + 2 is 4,
    ok - 2 + 3 is not 4
    # Some subtests for test2: end
ok - some subtests for test2 Test whether a value has a particular type. Displays a long message if the value is not of the specified type. The ``tap`` module streamlines the testing of other modules. It allows writing of tests in the `TAP protocol`_. The results from the tests can be parsed by standard TAP-analyzers so they can be passed to utilities such as `prove`_. Thus one can run tests and then use the results for statistics, decision-making, and so on. The output from the above script will look approximately like this: The result of ``tap.test`` is an object, which will be called taptest in the rest of this discussion, which is necessary for ``taptest:plan()`` and all the other methods. The result will be a display saying ``# bad plan: ...`` if the number of completed tests is not equal to the number of tests specified by ``taptest:plan(...)``. (This is a purely Tarantool feature: "bad plan" messages are out of the TAP13 standard.) This check should only be done after all planned tests are complete, so ordinarily ``taptest:check()`` will only appear at the end of a script. However, as a Tarantool extension, ``taptest:check()`` may appear at the end of any subtest. Therefore there are three ways to cause the check: This is a basic function which is used by other functions. Depending on the value of ``condition``, print 'ok' or 'not ok' along with debugging information. Displays the message. This is the negation of :ref:`taptest:is() <taptest-is>`. This is the negation of :ref:`taptest:like() <taptest-like>`. To run this example: put the script in a file named ./tap.lua, then make tap.lua executable by saying ``chmod a+x ./tap.lua``, then execute using Tarantool as a script processor by saying ./tap.lua. Use Verify a string against a `pattern <http://lua-users.org/wiki/PatternsTutorial>`_. Ok if match is found. ``taptest:fail('x')`` is equivalent to ``taptest:ok(false, 'x')``. Displays the message. ``taptest:skip('x')`` is equivalent to ``taptest:ok(true, 'x' .. '# skip')``. Displays the message. actual result an arbitrary name to give for the test outputs. an expression which is true or false boolean by calling ``taptest:check()`` at the end of a script, by calling a function which ends with a call to ``taptest:check()``, expected result name of the test nil or by calling taptest:test('...', subtest-function-name) where subtest-function-name does not need to end with ``taptest:check()`` because it can be called after the subtest is complete. pattern return rtype tap = require('tap')
taptest = tap.test('test-name') taptest tarantool> taptest:ok(true, 'x')
ok - x
---
- true
...
tarantool> tap = require('tap')
---
...
tarantool> taptest = tap.test('test-name')
TAP version 13
---
...
tarantool> taptest:ok(1 + 1 == 2, 'X')
ok - X
---
- true
... tarantool> taptest:skip('message')
ok - message # skip
---
- true
... test:like(tarantool.version, '^[1-9]', "version") the message to be displayed. the test logic to run. true or false. userdata userdata or string Project-Id-Version: Tarantool 1.10
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
 #!/usr/bin/tarantool
local tap = require('tap')
test = tap.test("my test name")
test:plan(2)
test:ok(2 * 2 == 4, "2 * 2 is 4")
test:test("some subtests for test2", function(test)
    test:plan(2)
    test:is(2 + 2, 4, "2 + 2 is 4")
    test:isnt(2 + 3, 4, "2 + 3 is not 4")
end)
test:check() **Пример:** :ref:`tap.test() <tap-test>` :ref:`taptest:check() <taptest-check>` :ref:`taptest:diag() <taptest-diag>` :ref:`taptest:fail() <taptest-fail>` :ref:`taptest:is() <taptest-is>` :ref:`taptest:is_deeply() <taptest-is_deeply>` :ref:`taptest:isnil() <taptest-istype>` |br| :ref:`taptest:isstring() <taptest-istype>` |br| :ref:`taptest:isnumber() <taptest-istype>` |br| :ref:`taptest:istable() <taptest-istype>` |br| :ref:`taptest:isboolean() <taptest-istype>` |br| :ref:`taptest:isudata() <taptest-istype>` |br| :ref:`taptest:iscdata() <taptest-istype>` :ref:`taptest:isnt() <taptest-isnt>` :ref:`taptest:like() <taptest-like>` :ref:`taptest:ok() <taptest-ok>` :ref:`taptest:plan() <taptest-plan>` :ref:`taptest:skip() <taptest-skip>` :ref:`taptest:test() <taptest-test>` :ref:`taptest:unlike() <taptest-unlike>` Проверка соответствия значения определенному типу Проверка отличия аргумента от шаблона Проверка соответствия аргумента шаблону Проверка отличий двух аргументов Проверка равенства двух аргументов Проверка количества выполненных тестов Проверка равенства первого аргумента второму аргументу. Отображается подробное сообщение, если результатом будет false (ложь). Проверка количества выполненных тестов. Создание подтеста (если не указан аргумент ``func``) или (если указаны все аргументы) создание подтеста, выполнение тестовой функции и вывод результата. Создание подтеста и вывод результатов Отображение сообщения диагностики Отображение сообщения диагностики. Оценка состояния и отображение сообщения Пример Указатель Указание количества проводимых тестов Указание количества проводимых тестов. Инициализация Инициализация. Модуль `tap` Имя Общие сведения Параметры Рекурсивная версия ``taptest:is(...)``, которую можно использовать для сопоставления таблиц, а также скалярных значений. Рекурсивная проверка равенства двух аргументов См. :ref:`пример <tap-example>`. TAP version 13
1..2
ok - 2 * 2 is 4
    # Some subtests for test2
    1..2
    ok - 2 + 2 is 4,
    ok - 2 + 3 is not 4
    # Some subtests for test2: end
ok - some subtests for test2 Проверка соответствия значения определенному типу. Отображается длинное сообщение, если значение не принадлежит указанному типу. Модуль ``tap`` оптимизирует тестирование других модулей. Он позволяет записывать тесты в TAP-протокол (`TAP protocol`_). Результаты тестов могут подвергаться анализу стандартными TAP-анализаторами, поэтому их можно передавать утилитам, например `prove`_. Таким образом, можно выполнять тестирование, а затем использовать результаты для выведения статистики, принятия решений и т.д. Результатом вышеприведенного скрипта будет примерно следующее: Результатом ``tap.test`` является объект, который будет называться taptest в ходе данного разбора, что необходимо для ``taptest:plan()`` и всех остальных методов. Выведенный результат будет включать в себя сообщение: ``# bad plan: ...``, если количество выполненных тестов не равно количеству тестов, указанному в ``taptest:plan(...)``. (Это собственная функция Tarantool'а: сообщения типа "bad plan" не входят в стандарт TAP13.) Такую проверку следует проводить только по завершении всех запланированных тестов, поэтому как правило, ``taptest:check()`` появится лишь в конце скрипта. Тем не менее, в качестве расширения Tarantool'а, ``taptest:check()`` может появиться в начале любого подтеста. Таким образом, проверка появится в трех случаях: Это базовая функция, которая используется другими функциями. В зависимости от условия ``condition``, выводится 'ok' или 'not ok' вместе с отладочной информацией. Отображается сообщение. Отрицание :ref:`taptest:is() <taptest-is>`. Отрицание :ref:`taptest:like() <taptest-like>`. Для выполнения данного примера поместите скрипт в файл под названием ./tap.lua, затем сделайте tap.lua выполняемым файлом с помощью команды ``chmod a+x ./tap.lua``, а затем выполните его, используя Tarantool в качестве обработчика скриптов после выполнения команды ./tap.lua. Назначение Проверка совпадения строки с `шаблоном <http://lua-users.org/wiki/PatternsTutorial>`_. Ok, если найдено совпадение. ``taptest:fail('x')`` -- аналог ``taptest:ok(false, 'x')``. Отображается сообщение. ``taptest:skip('x')`` -- аналог ``taptest:ok(true, 'x' .. '# skip')``. Отображается сообщение. фактический результат произвольное имя для результата теста. выражение, которое либо true (правда), либо false (ложь) boolean (логический) при вызове ``taptest:check()`` в конце скрипта, при вызове функции, которая заканчивается вызовом ``taptest:check()``, ожидаемый результат имя теста nil или при вызове taptest:test('...', имя-функции-подтеста), где функция подтеста не обязана заканчиваться на ``taptest:check()``, поскольку ее можно вызвать по окончании подтеста. шаблон возвращает тип возвращаемого значения tap = require('tap')
taptest = tap.test('test-name') taptest tarantool> taptest:ok(true, 'x')
ok - x
---
- true
...
tarantool> tap = require('tap')
---
...
tarantool> taptest = tap.test('test-name')
TAP version 13
---
...
tarantool> taptest:ok(1 + 1 == 2, 'X')
ok - X
---
- true
... tarantool> taptest:skip('message')
ok - message # skip
---
- true
... test:like(tarantool.version, '^[1-9]', "version") отображаемое сообщение. выполняемая тестовая логика. true (правда) или false (ложь). пользовательские данные userdata или строка 