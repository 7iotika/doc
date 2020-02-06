��    1      �              ,     -  _   :    �  {   �  i   /  c   �  j   �  "   h  *   �  ,   �      �  "     $   '  &   L  J   s  N   �  +     %   9  !   _  %   �  !   �  "   �     �  &   	  "   2	     U	  4   [	     �	     �	     �	  
   �	  �   �	  �   H
  ,  5  �   b  �   .  �     �   �     |     �     �     �     �  C   �  -     H   1  F   z  -   �  �  �     �  �   �  �  j  �   A  �   �  �   n  �   �  "   �  *   �  ,   �        "   >  $   a  &   �  J   �  N   �  Z   G  T   �  L   �  R   D  J   �  [   �  S   >  T   �  L   �     4  i   G     �     �     �     �  �   �  �  �  D  V  b  �!  w  �"  �  v$  h  
&     s'  6   �'  2   �'     �'  2   (  �   :(  n   �(  x   ;)  �   �)  L   E*   **Example:** **table**. first element - seconds of CPU time, second element - whatever the function returns. -- Benchmark a function which sleeps 10 seconds.
-- NB: bench() will not calculate sleep time.
-- So the returned value will be {a number less than 10, 88}.
clock = require('clock')
fiber = require('fiber')
function f(param)
  fiber.sleep(param)
  return 88
end
clock.bench(f, 10) -- This will print an approximate number of years since 1970.
clock = require('clock')
print(clock.time() / (365*24*60*60)) -- This will print nanoseconds in the CPU since the start.
clock = require('clock')
print(clock.proc64()) -- This will print nanoseconds since the start.
clock = require('clock')
print(clock.monotonic64()) -- This will print seconds in the thread since the start.
clock = require('clock')
print(clock.thread64()) :ref:`clock.bench() <clock-bench>` :ref:`clock.monotonic() <clock-monotonic>` :ref:`clock.monotonic64() <clock-monotonic>` :ref:`clock.proc() <clock-proc>` :ref:`clock.proc64() <clock-proc>` :ref:`clock.thread() <clock-thread>` :ref:`clock.thread64() <clock-thread>` :ref:`clock.time() <clock-time>` |br| :ref:`clock.realtime() <clock-time>` :ref:`clock.time64() <clock-time>` |br| :ref:`clock.realtime64() <clock-time>` Below is a list of all ``clock`` functions. Get the monotonic time in nanoseconds Get the monotonic time in seconds Get the processor time in nanoseconds Get the processor time in seconds Get the thread time in nanoseconds Get the thread time in seconds Get the wall clock time in nanoseconds Get the wall clock time in seconds Index Measure the time a function takes within a processor Module `clock` Name Overview Parameters See also :ref:`fiber.time64 <fiber-time64>` and the standard Lua function `os.clock <http://www.lua.org/manual/5.1/manual.html#pdf-os.clock>`_. The ``clock`` module returns time values derived from the Posix / C CLOCK_GETTIME_ function or equivalent. Most functions in the module return a number of seconds; functions whose names end in "64" return a 64-bit number of nanoseconds. The monotonic time. Derived from C function clock_gettime(CLOCK_MONOTONIC). Monotonic time is similar to wall clock time but is not affected by changes to or from daylight saving time, or by changes done by a user. This is the best function to use with benchmarks that need to calculate elapsed time. The processor time. Derived from C function ``clock_gettime(CLOCK_PROCESS_CPUTIME_ID)``. This is the best function to use with benchmarks that need to calculate how much time has been spent within a CPU. The thread time. Derived from C function ``clock_gettime(CLOCK_THREAD_CPUTIME_ID)``. This is the best function to use with benchmarks that need to calculate how much time has been spent within a thread within a CPU. The time that a function takes within a processor. This function uses ``clock.proc()``, therefore it calculates elapsed CPU time. Therefore it is not useful for showing actual elapsed time. The wall clock time. Derived from C function clock_gettime(CLOCK_REALTIME). This is the best function for knowing what the official time is, as determined by the system administrator. Use function or function reference number or number64 return rtype seconds or nanoseconds since epoch (1970-01-01 00:00:00), adjusted. seconds or nanoseconds since processor start. seconds or nanoseconds since the last time that the computer was booted. seconds or nanoseconds since the transaction processor thread started. whatever values are required by the function. Project-Id-Version: Tarantool 1.10
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
 **Пример:** **таблица**. Первый элемент -- время работы процессора в секундах, второй элемент -- то, что возвращает функция. -- Эталонное тестирование функции, которая находится в спящем режиме в течение 10 секунд.
-- NB: bench() не будет рассчитывать время сна.
-- Поэтому вернется значение, которое будет {число менее 10, 88}.
clock = require('clock')
fiber = require('fiber')
function f(param)
  fiber.sleep(param)
  return 88
end
clock.bench(f, 10) -- Результатом будет примерное число лет с 1970.
clock = require('clock')
print(clock.time() / (365*24*60*60)) -- Результатом будет число наносекунд с запуска процессора.
clock = require('clock')
print(clock.proc64()) -- Результатом будет число наносекунд с запуска.
clock = require('clock')
print(clock.monotonic64()) -- Результатом будет число секунд с момента начала работы потока.
clock = require('clock')
print(clock.thread64()) :ref:`clock.bench() <clock-bench>` :ref:`clock.monotonic() <clock-monotonic>` :ref:`clock.monotonic64() <clock-monotonic>` :ref:`clock.proc() <clock-proc>` :ref:`clock.proc64() <clock-proc>` :ref:`clock.thread() <clock-thread>` :ref:`clock.thread64() <clock-thread>` :ref:`clock.time() <clock-time>` |br| :ref:`clock.realtime() <clock-time>` :ref:`clock.time64() <clock-time>` |br| :ref:`clock.realtime64() <clock-time>` Ниже приведен перечень всех функций модуля ``clock``. Получение монотонного времени в наносекундах Получение монотонного времени в секундах Получение времени процессора в наносекундах Получение времени процессора в секундах Получение рабочего времени потока в наносекундах Получение рабочего времени потока в секундах Получение физического времени в наносекундах Получение физического времени в секундах Указатель Измерение времени, которое функция проводит в процессоре Модуль `clock` Имя Общие сведения Параметры См. также :ref:`fiber.time64 <fiber-time64>` и стандартную Lua-функцию `os.clock <http://www.lua.org/manual/5.1/manual.html#pdf-os.clock>`_. Модуль ``clock`` возвращает значения времени, полученных из функции Posix / C CLOCK_GETTIME_ или аналогичной. Большинство функций модуля возвращают число секунд; функции, названия которых заканчиваются на "64", возвращают 64-разрадяное число наносекунд. Монотонное время. Получено из C-функции clock_gettime(CLOCK_MONOTONIC). Монотонное время похоже на физическое время, но на него не влияют изменения для перехода на летнее время или изменения, сделанные пользователем. Такую функцию лучше всего использовать для эталонного тестирования, где необходимо рассчитать затраченное время. Время процессора. Получено из C-функции ``clock_gettime(CLOCK_PROCESS_CPUTIME_ID)``. Такую функцию лучше всего использовать для эталонного тестирования, где необходимо рассчитать время, затраченное на процессоре. Рабочее время потока. Получено из C-функции ``clock_gettime(CLOCK_THREAD_CPUTIME_ID)``. Такую функцию лучше всего использовать для эталонного тестирования, где необходимо рассчитать время, затраченное потоком на процессоре. Время, которое функция проводит в процессоре. Данная функция использует ``clock.proc()``, то есть рассчитывает затраченное процессором время. Таким образом, она не используется для отображения фактически затраченного времени. Физическое время в секундах. Получено из C-функции clock_gettime(CLOCK_REALTIME). Использование этой функции лучше всего подходит для выяснения официального времени, как установлено системным администратором. Назначение функция или ссылка на функцию число или 64-разрядное число возвращает тип возвращаемого значения секунды или наносекунды с начала отсчета (1970-01-01 00:00:00), значение корректируется. секунды или наносекунды с момента начала работы процессора. секунды или наносекунды с момента последней загрузки компьютера. секунды или наносекунды с момента начала работы потока процессора транзакций. значения, которые необходимы для функции. 