��    n      �              �  g  �  �   e  �  +  &   �  *     e   H  i  �  7     1   P  O   �  ,   �  z   �  �   z        '   :  9  b     �     �     �     �  ~   �  �   p  �   �  l   �  �   �  F   �  D   �  �    �   �  C   k  �   �     M  A   k     �     �  T   �     7  �   E  �        �   �   �!  �   `"  �   #  ~   �#  
   S$     ^$  R   }$  C   �$     %  $   )%  &   N%  '   u%  �   �%     P&     g&  �   �&     /'  g   D'    �'  �  �(  �   p*  )   ?+  �   i+  ]   ,  _  _,  1   �-  F  �-  �   8/  �   0  �  �0  8   �5  "   �5  /   �5     6     *6  u   B6  )  �6  @  �7  �   #;    �;  �   �<     �=  �   �=    s>  y   {?  w   �?  @   m@  e   �@     A  (   3A    \A  w   hQ  �  �Q     �S  
   �S     �S     �S  #   �S  �   T  x   �T     nU     �U  #   �U  s  �U  Z  ;X  �   �Z  B   O[  R   �[  M   �[  �  3\  g  �]  �   >d    >e  &   Ng  *   ug  e   �g  i  h  7   pj  1   �j  f   �j  ,   Ak  z   nk  �   �k     �l  '   �l  =  �l     o     -o     >o     Xo  �   io  �   p  �   �p  �   �q  K  er  v   �s  �   (t  [  �t  9  w  i   Tx  c  �x  D   "z  �   gz  ]   {  b   c{  �   �{  8   �|  �  �|  R  [~  �  �  �   ��  N  ��  �  �  �   ��     e�  4   ��  �   ��  k   y�  _   �  _   E�  @   ��  G   �  A  .�  1   p�  A   ��  H  �  2   -�  �   `�  �  $�  �  ��  �  ��  J   d�  '  ��  �   ו    p�  W   ~�  a  ֘  k  8�  �  ��  �  D�  �   �  |   �  �   i�  `   ��  l   ^�  �   ˥  �  ��  @  P�  N  ��  �  �  �  ��  J   s�  @  ��  �  ��    ��  �   ۵  �   ��  �   U�  s   �  d   ��    ��  w   ��  �  q�     M�  
   Z�     e�     k�  #   p�  �   ��  �   ��     �     1�  #   K�  �  o�  Z  �  �   n�  n   '�  �   ��  n   #�   # Samples: 14K of event 'cycles'
# Event count (approx.): 9927346847
#
# Children Self Samples Command Shared Object Symbol
# ........ ........ ............ ......... .................. .......................................
#
    35.50% 0.55% 79 tarantool tarantool [.] lj_gc_step
            |
             --34.95%--lj_gc_step
                       |
                       |--29.26%--gc_onestep
                       | |
                       | |--13.85%--gc_sweep
                       | | |
                       | | |--5.59%--lj_alloc_free
                       | | |
                       | | |--1.33%--lj_tab_free
                       | | | |
                       | | | --1.01%--lj_alloc_free
                       | | |
                       | | --1.17%--lj_cdata_free
                       | |
                       | |--5.41%--gc_finalize
                       | | |
                       | | |--1.06%--lj_obj_equal
                       | | |
                       | | --0.95%--lj_tab_set
                       | |
                       | |--4.97%--rehashtab
                       | | |
                       | | --3.65%--lj_tab_resize
                       | | |
                       | | |--0.74%--lj_tab_set
                       | | |
                       | | --0.72%--lj_tab_newkey
                       | |
                       | |--0.91%--propagatemark
                       | |
                       | --0.67%--lj_cdata_free
                       |
                        --5.43%--propagatemark
                                  |
                                   --0.73%--gc_mark $ # executing commands directly from the command line
$ <command> | tarantoolctl eval my_app
<...>

$ # - OR -

$ # executing commands from a script file
$ tarantoolctl eval my_app script.lua
<...> $ # for local instances:
$ tarantoolctl enter my_app
/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
/bin/tarantoolctl: Connecting to /var/run/tarantool/my_app.control
/bin/tarantoolctl: connected to unix/:/var/run/tarantool/my_app.control
unix/:/var/run/tarantool/my_app.control> 1 + 1
---
- 2
...
unix/:/var/run/tarantool/my_app.control>

$ # for local and remote instances:
$ tarantoolctl connect username:password@127.0.0.1:3306 $ apt-get install libgoogle-perftools4 $ echo $(pidof tarantool INSTANCENAME.lua) $ gdb -ex "set pagination 0" -ex "thread apply all bt" --batch -p $(pidof tarantool INSTANCENAME.lua) $ journalctl -u tarantool@my_app -n 5
-- Logs begin at Fri 2016-01-08 12:21:53 MSK, end at Thu 2016-01-21 21:17:47 MSK. --
Jan 21 21:17:47 localhost.localdomain systemd[1]: Stopped Tarantool Database Server.
Jan 21 21:17:47 localhost.localdomain systemd[1]: Starting Tarantool Database Server...
Jan 21 21:17:47 localhost.localdomain tarantoolctl[5969]: /usr/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
Jan 21 21:17:47 localhost.localdomain tarantoolctl[5969]: /usr/bin/tarantoolctl: Starting instance...
Jan 21 21:17:47 localhost.localdomain systemd[1]: Started Tarantool Database Server $ perf record -g -p $(pidof tarantool INSTANCENAME.lua) $ perf report -n -g --stdio | tee perf-report.txt $ pprof --text /usr/bin/tarantool /home/<username>/tarantool-on-production.prof $ pstack $(pidof tarantool INSTANCENAME.lua) $ rm -f fiber.info.txt
$ watch -n 0.5 "echo 'require(\"fiber\").info()' | tarantoolctl enter NAME | tee -a fiber-info.txt" $ rm -f stack-trace.txt
$ watch -n 0.5 "gdb -ex 'set pagination 0' -ex 'thread apply all bt' --batch -p $(pidof tarantool INSTANCENAME.lua) | tee -a stack-trace.txt" $ tarantoolctl enter NAME $ tarantoolctl rocks install gperftools $ tarantoolctl status my_app
my_app is running (pid: /var/run/tarantool/my_app.pid)

$ # - OR -

$ systemctl status tarantool@my_app
tarantool@my_app.service - Tarantool Database Server
Loaded: loaded (/etc/systemd/system/tarantool@.service; disabled; vendor preset: disabled)
Active: active (running)
Docs: man:tarantool(1)
Process: 5346 ExecStart=/usr/bin/tarantoolctl start %I (code=exited, status=0/SUCCESS)
Main PID: 5350 (tarantool)
Tasks: 11 (limit: 512)
CGroup: /system.slice/system-tarantool.slice/tarantool@my_app.service
+ 5350 tarantool my_app.lua <running> $ yum install gperftools-libs **Example** **gdb -ex "bt" -p <pid>** **pstack <pid>** :ref:`box.cfg <box_introspection-box_cfg>` submodule (check and specify all configuration parameters for the Tarantool server) :ref:`box.info <box_introspection-box_info>` submodule (introspect Tarantool server variables, primarily those related to replication) :ref:`box.slab <box_introspection-box_slab>` submodule (monitor the total use and fragmentation of memory allocated for storing data in Tarantool) :ref:`box.stat <box_introspection-box_stat>` submodule (introspect Tarantool request and network statistics) A very popular administrator request is :ref:`box.slab.info() <box_slab_info>`, which displays detailed memory usage statistics for a Tarantool instance. After that you can get the required information with ``fiber.info()``. After using the debugger, your console output should look like this: Alternatively, you can use the :ref:`console <console-module>` module or the :ref:`net.box <net_box-module>` module from a Tarantool server. Also, you can write your client programs with any of the :ref:`connectors <index-box_connectors>`. However, most of the examples in this manual illustrate usage with either ``tarantoolctl connect`` or :ref:`using the Tarantool server as a client <admin-using_tarantool_as_a_client>`. As with ``pstack``, the GNU debugger (also known as ``gdb``) needs to be installed before you can start using it. Your Linux package manager can help you with that. At this point, your console output should look something like this: By default, some ``perf`` commands are restricted to **root**, so, to be on the safe side, either run all commands as **root** or prepend them with ``sudo``. Executing code on an instance First, enter your instance’s interactive administrator console: For Debian/Ubuntu, run: For RHEL/CentOS/Fedora, run: For more details, use the reports provided by functions in the following submodules: Health checks If you can't understand which fiber causes performance issues, collect the metrics of the ``fiber.info()`` output for 10-15 seconds using the script above and contact the Tarantool team at support@tarantool.org. If you have any difficulties troubleshooting, let the script run for 10-15 seconds and then send the resulting ``stack-trace.txt`` file to the Tarantool team at support@tarantool.org. If you want to dynamically obtain information with ``fiber.info()``, the shell script below may come in handy. It connects to a Tarantool instance specified by ``NAME`` every 0.5 seconds, grabs the ``fiber.info()`` output and writes it to the ``fiber-info.txt`` file: It formats the statistical data in the ``perf.data`` file into a performance report and writes it to the ``perf-report.txt`` file. It takes at least a couple of minutes for the profiler to gather performance metrics. After that, save the results to disk (you can do that as many times as you need): Make a function that calls a function named f1 that does 500,000 inserts and deletes in a Tarantool space. Start the profiler, execute the function, stop the profiler, and show what the profiler sampled. Most of these tools -- except ``fiber.info()`` -- are intended for generic GNU/Linux distributions, but not FreeBSD or Mac OS. Next, say: Now run the following command: Now you're ready to go. Enter your instance’s interactive administrator console: On Debian/Ubuntu, the ``pprof`` utility is called ``google-pprof``. Once installed, say: Once the debugger is installed, say: Once there, load the ``fiber`` module: Once you do this, install Lua bindings: Ordinarily this does not affect performance. But, to force Tarantool to release memory, you can call :ref:`box.snapshot <box-snapshot>`, stop the server instance, and restart it. Poor man’s profilers Profiling performance issues Run the debugger in a loop a few times to collect enough samples for making conclusions about why Tarantool demonstrates suboptimal performance. Use the following script: Server introspection Structurally and functionally, this script is very similar to the one used with ``fiber.info()`` above. Tarantool almost never releases this memory, even if the user deletes everything that was inserted, or reduces fragmentation by calling the Lua garbage collector via the `collectgarbage function <https://www.lua.org/manual/5.1/manual.html#pdf-collectgarbage>`_. Tarantool can at times work slower than usual. There can be multiple reasons, such as disk issues, CPU-intensive Lua scripts or misconfiguration. Tarantool’s log may lack details in such cases, so the only indications that something goes wrong are log entries like this: ``W> too long DELETE: 8.546 sec``. Here are tools and techniques that can help you collect Tarantool’s performance profile, which is helpful in troubleshooting slowdowns. Tarantool displays a prompt (e.g. "tarantool>") and you can enter requests. When used this way, Tarantool can be a client for a remote server. See basic examples in :ref:`Getting started <getting_started>`. Tarantool enters the interactive mode if: Tarantool takes memory from the operating system, for example when a user does many insertions. You can see how much it has taken by saying (on Linux): The interactive mode is used by ``tarantoolctl`` to implement "enter" and "connect" commands. The jit.p profiler comes with the Tarantool application server, to load it one only needs to say ``require('jit.p')`` or ``require('jit.profile')``. There are many options for sampling and display, they are described in the documentation for `The LuaJIT Profiler <http://www.luatex.org/svn/trunk/source/libs/luajit/LuaJIT-src/doc/ext_profiler.html>`_. The resulting output should look similar to this: The simplest profiling method is to take advantage of Tarantool’s built-in functionality. :ref:`fiber.info() <fiber-info>` returns information about all running fibers with their corresponding C stack traces. You can use this data to see how many fibers are running and which C functions are executed more often than others. This command saves the gathered data to a file named ``perf.data`` inside the current working directory. To stop this process (usually, after 10-15 seconds), press **ctrl+C**. In your console, you’ll see: This tool for performance monitoring and analysis is installed separately via your package manager. Try running the ``perf`` command in the terminal and follow the prompts to install the necessary package(s). Thread 19 (Thread 0x7f09d1bff700 (LWP 24173)):
#0 0x00007f0a1a5423f2 in ?? () from /lib64/libgomp.so.1
#1 0x00007f0a1a53fdc0 in ?? () from /lib64/libgomp.so.1
#2 0x00007f0a1ad5adc5 in start_thread () from /lib64/libpthread.so.0
#3 0x00007f0a1a050ced in clone () from /lib64/libc.so.6
Thread 18 (Thread 0x7f09d13fe700 (LWP 24174)):
#0 0x00007f0a1a5423f2 in ?? () from /lib64/libgomp.so.1
#1 0x00007f0a1a53fdc0 in ?? () from /lib64/libgomp.so.1
#2 0x00007f0a1ad5adc5 in start_thread () from /lib64/libpthread.so.0
#3 0x00007f0a1a050ced in clone () from /lib64/libc.so.6
<...>
Thread 2 (Thread 0x7f09c8bfe700 (LWP 24191)):
#0 0x00007f0a1ad5e6d5 in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
#1 0x000000000045d901 in wal_writer_pop(wal_writer*) ()
#2 0x000000000045db01 in wal_writer_f(__va_list_tag*) ()
#3 0x0000000000429abc in fiber_cxx_invoke(int (*)(__va_list_tag*), __va_list_tag*) ()
#4 0x00000000004b52a0 in fiber_loop ()
#5 0x00000000006099cf in coro_init ()
Thread 1 (Thread 0x7f0a1c47fd80 (LWP 24172)):
#0 0x00007f0a1a0512c3 in epoll_wait () from /lib64/libc.so.6
#1 0x00000000006051c8 in epoll_poll ()
#2 0x0000000000607533 in ev_run ()
#3 0x0000000000428e13 in main () To check the boot log, on systems with ``systemd``, say: To check the instance status, say: To start gathering performance statistics, say: To start profiling, say: To stop profiling, say: To use the CPU profiler from the Google Performance Tools suite with Tarantool, first take care of the prerequisites: To use this tool, first install it with a package manager that comes with your Linux distribution. This command prints an execution stack trace of a running process specified by the PID. You might want to run this command several times in a row to pinpoint the bottleneck that causes the slowdown. Total: 598 samples
      83 13.9% 13.9% 83 13.9% epoll_wait
      54 9.0% 22.9% 102 17.1%
vy_mem_tree_insert.constprop.35
      32 5.4% 28.3% 34 5.7% __write_nocancel
      28 4.7% 32.9% 42 7.0% vy_mem_iterator_start_from
      26 4.3% 37.3% 26 4.3% _IO_str_seekoff
      21 3.5% 40.8% 21 3.5% tuple_compare_field
      19 3.2% 44.0% 19 3.2%
::TupleCompareWithKey::compare
      19 3.2% 47.2% 38 6.4% tuple_compare_slowpath
      12 2.0% 49.2% 23 3.8% __libc_calloc
       9 1.5% 50.7% 9 1.5%
::TupleCompare::compare@42efc0
       9 1.5% 52.2% 9 1.5% vy_cache_on_write
       9 1.5% 53.7% 57 9.5% vy_merge_iterator_next_key
       8 1.3% 55.0% 8 1.3% __nss_passwd_lookup
       6 1.0% 56.0% 25 4.2% gc_onestep
       6 1.0% 57.0% 6 1.0% lj_tab_next
       5 0.8% 57.9% 5 0.8% lj_alloc_malloc
       5 0.8% 58.7% 131 21.9% vy_prepare Typically the result will show that the sampling happened within f1() many times, but also within internal Tarantool functions, whose names may change with each new version. Unlike the poor man’s profilers, ``gperftools`` and ``perf`` have low overhead (almost negligible as compared with ``pstack`` and ``gdb``): they don’t result in long delays when attaching to a process and therefore can be used without serious consequences. Use the poor man’s profilers with caution: each time they attach to a running process, this stops the process execution for about a second, which may leave a serious footprint in high-load services. Using Tarantool as a client We highly recommend to assign meaningful names to fibers you create so that you can find them in the ``fiber.info()`` list. In the example below, we create a fiber named ``myworker``: You can also try `tarantool/prometheus <https://github.com/tarantool/prometheus>`_, a Lua module that makes it easy to collect metrics (e.g. memory usage or number of requests) from Tarantool applications and databases and expose them via the Prometheus protocol. You can also use ``tarantoolctl`` to execute Lua code on an instance without attaching to its admin console. For example: You can attach to an instance's :ref:`admin console <admin-security>` and execute some Lua code using ``tarantoolctl``: You can kill any fiber with :ref:`fiber.kill(fid) <fiber-kill>`: You can now analyze the output with the ``pprof`` utility that comes with the ``gperftools`` package: You should get similar output: Your output should look similar to this: [Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

[CUT]

Thread 1 (Thread 0x7f72289ba940 (LWP 20535)):
#0 _int_malloc (av=av@entry=0x7f7226e0eb20 <main_arena>, bytes=bytes@entry=504) at malloc.c:3697
#1 0x00007f7226acf21a in __libc_calloc (n=<optimized out>, elem_size=<optimized out>) at malloc.c:3234
#2 0x00000000004631f8 in vy_merge_iterator_reserve (capacity=3, itr=0x7f72264af9e0) at /usr/src/tarantool/src/box/vinyl.c:7629
#3 vy_merge_iterator_add (itr=itr@entry=0x7f72264af9e0, is_mutable=is_mutable@entry=true, belong_range=belong_range@entry=false) at /usr/src/tarantool/src/box/vinyl.c:7660
#4 0x00000000004703df in vy_read_iterator_add_mem (itr=0x7f72264af990) at /usr/src/tarantool/src/box/vinyl.c:8387
#5 vy_read_iterator_use_range (itr=0x7f72264af990) at /usr/src/tarantool/src/box/vinyl.c:8453
#6 0x000000000047657d in vy_read_iterator_start (itr=<optimized out>) at /usr/src/tarantool/src/box/vinyl.c:8501
#7 0x00000000004766b5 in vy_read_iterator_next (itr=itr@entry=0x7f72264af990, result=result@entry=0x7f72264afad8) at /usr/src/tarantool/src/box/vinyl.c:8592
#8 0x000000000047689d in vy_index_get (tx=tx@entry=0x7f7226468158, index=index@entry=0x2563860, key=<optimized out>, part_count=<optimized out>, result=result@entry=0x7f72264afad8) at /usr/src/tarantool/src/box/vinyl.c:5705
#9 0x0000000000477601 in vy_replace_impl (request=<optimized out>, request=<optimized out>, stmt=0x7f72265a7150, space=0x2567ea0, tx=0x7f7226468158) at /usr/src/tarantool/src/box/vinyl.c:5920
#10 vy_replace (tx=0x7f7226468158, stmt=stmt@entry=0x7f72265a7150, space=0x2567ea0, request=<optimized out>) at /usr/src/tarantool/src/box/vinyl.c:6608
#11 0x00000000004615a9 in VinylSpace::executeReplace (this=<optimized out>, txn=<optimized out>, space=<optimized out>, request=<optimized out>) at /usr/src/tarantool/src/box/vinyl_space.cc:108
#12 0x00000000004bd723 in process_rw (request=request@entry=0x7f72265a70f8, space=space@entry=0x2567ea0, result=result@entry=0x7f72264afbc8) at /usr/src/tarantool/src/box/box.cc:182
#13 0x00000000004bed48 in box_process1 (request=0x7f72265a70f8, result=result@entry=0x7f72264afbc8) at /usr/src/tarantool/src/box/box.cc:700
#14 0x00000000004bf389 in box_replace (space_id=space_id@entry=513, tuple=<optimized out>, tuple_end=<optimized out>, result=result@entry=0x7f72264afbc8) at /usr/src/tarantool/src/box/box.cc:754
#15 0x00000000004d72f8 in lbox_replace (L=0x413c5780) at /usr/src/tarantool/src/box/lua/index.c:72
#16 0x000000000050f317 in lj_BC_FUNCC ()
#17 0x00000000004d37c7 in execute_lua_call (L=0x413c5780) at /usr/src/tarantool/src/box/lua/call.c:282
#18 0x000000000050f317 in lj_BC_FUNCC ()
#19 0x0000000000529c7b in lua_cpcall ()
#20 0x00000000004f6aa3 in luaT_cpcall (L=L@entry=0x413c5780, func=func@entry=0x4d36d0 <execute_lua_call>, ud=ud@entry=0x7f72264afde0) at /usr/src/tarantool/src/lua/utils.c:962
#21 0x00000000004d3fe7 in box_process_lua (handler=0x4d36d0 <execute_lua_call>, out=out@entry=0x7f7213020600, request=request@entry=0x413c5780) at /usr/src/tarantool/src/box/lua/call.c:382
#22 box_lua_call (request=request@entry=0x7f72130401d8, out=out@entry=0x7f7213020600) at /usr/src/tarantool/src/box/lua/call.c:405
#23 0x00000000004c0f27 in box_process_call (request=request@entry=0x7f72130401d8, out=out@entry=0x7f7213020600) at /usr/src/tarantool/src/box/box.cc:1074
#24 0x000000000041326c in tx_process_misc (m=0x7f7213040170) at /usr/src/tarantool/src/box/iproto.cc:942
#25 0x0000000000504554 in cmsg_deliver (msg=0x7f7213040170) at /usr/src/tarantool/src/cbus.c:302
#26 0x0000000000504c2e in fiber_pool_f (ap=<error reading variable: value has been optimized out>) at /usr/src/tarantool/src/fiber_pool.c:64
#27 0x000000000041122c in fiber_cxx_invoke(fiber_func, typedef __va_list_tag __va_list_tag *) (f=<optimized out>, ap=<optimized out>) at /usr/src/tarantool/src/fiber.h:645
#28 0x00000000005011a0 in fiber_loop (data=<optimized out>) at /usr/src/tarantool/src/fiber.c:641
#29 0x0000000000688fbf in coro_init () at /usr/src/tarantool/third_party/coro/coro.c:110 ^C[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.225 MB perf.data (1573 samples) ] box.space.t:drop()
box.schema.space.create('t')
box.space.t:create_index('i')
function f1() for i = 1,500000 do
  box.space.t:insert{i}
  box.space.t:delete{i}
  end
return 1
end
function f3() f1() end
jit_p = require("jit.profile")
sampletable = {}
jit_p.start("f", function(thread, samples, vmstate)
  local dump=jit_p.dumpstack(thread, "f", 1)
  sampletable[dump] = (sampletable[dump] or 0) + samples
end)
f3()
jit_p.stop()
for d,v in pairs(sampletable) do print(v, d) end fiber.info() gperftools jit.p perf ps -eo args,%mem | grep "tarantool" tarantool> box.slab.info()
---
- items_size: 228128
  items_used_ratio: 1.8%
  quota_size: 1073741824
  quota_used_ratio: 0.8%
  arena_used_ratio: 43.2%
  items_used: 4208
  quota_used: 8388608
  arena_size: 2325176
  arena_used: 1003632
... tarantool> cpuprof = require('gperftools.cpu')
tarantool> cpuprof.start('/home/<username>/tarantool-on-production.prof') tarantool> cpuprof.flush() tarantool> cpuprof.stop() tarantool> fiber = require('fiber') tarantool> fiber = require('fiber')
---
...
tarantool> f = fiber.create(function() while true do fiber.sleep(0.5) end end)
---
...
tarantool> f:name('myworker') <!-- assigning the name to a fiber
---
...
tarantool> fiber.info()
---
- 102:
    csw: 14
    backtrace:
    - '#0 0x501a1a in fiber_yield_timeout+90'
    - '#1 0x4f2008 in lbox_fiber_sleep+72'
    - '#2 0x5112a7 in lj_BC_FUNCC+52'
    fid: 102
    memory:
      total: 57656
      used: 0
    name: myworker <!-- newly created background fiber
  101:
    csw: 284
    backtrace: []
    fid: 101
    memory:
      total: 57656
      used: 0
    name: interactive
... tarantool> fiber = require('fiber')
---
...
tarantool> fiber.info()
---
- 360:
    csw: 2098165
    backtrace:
    - '#0 0x4d1b77 in wal_write(journal*, journal_entry*)+487'
    - '#1 0x4bbf68 in txn_commit(txn*)+152'
    - '#2 0x4bd5d8 in process_rw(request*, space*, tuple**)+136'
    - '#3 0x4bed48 in box_process1+104'
    - '#4 0x4d72f8 in lbox_replace+120'
    - '#5 0x50f317 in lj_BC_FUNCC+52'
    fid: 360
    memory:
      total: 61744
      used: 480
    name: main
  129:
    csw: 113
    backtrace: []
    fid: 129
    memory:
      total: 57648
      used: 0
    name: 'console/unix/:'
... tarantool> fiber.kill(102)
---
...
tarantool> fiber.info()
---
- 101:
    csw: 324
    backtrace: []
    fid: 101
    memory:
      total: 57656
      used: 0
    name: interactive
... the instance file contains :ref:`console.start() <console-start>`. to show the PID of the Tarantool instance that runs the ``INSTANCENAME.lua`` file. you start Tarantool without an :ref:`instance file <admin-instance_file>`, or Project-Id-Version: Tarantool 1.10
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
 # Samples: 14K of event 'cycles'
# Event count (approx.): 9927346847
#
# Children Self Samples Command Shared Object Symbol
# ........ ........ ............ ......... .................. .......................................
#
    35.50% 0.55% 79 tarantool tarantool [.] lj_gc_step
            |
             --34.95%--lj_gc_step
                       |
                       |--29.26%--gc_onestep
                       | |
                       | |--13.85%--gc_sweep
                       | | |
                       | | |--5.59%--lj_alloc_free
                       | | |
                       | | |--1.33%--lj_tab_free
                       | | | |
                       | | | --1.01%--lj_alloc_free
                       | | |
                       | | --1.17%--lj_cdata_free
                       | |
                       | |--5.41%--gc_finalize
                       | | |
                       | | |--1.06%--lj_obj_equal
                       | | |
                       | | --0.95%--lj_tab_set
                       | |
                       | |--4.97%--rehashtab
                       | | |
                       | | --3.65%--lj_tab_resize
                       | | |
                       | | |--0.74%--lj_tab_set
                       | | |
                       | | --0.72%--lj_tab_newkey
                       | |
                       | |--0.91%--propagatemark
                       | |
                       | --0.67%--lj_cdata_free
                       |
                        --5.43%--propagatemark
                                  |
                                   --0.73%--gc_mark $ # выполнение команд напрямую из командной строки
$ <command> | tarantoolctl eval my_app
<...>

$ # - ИЛИ -

$ # выполнение команд из скрипта
$ tarantoolctl eval my_app script.lua
<...> $ # для локальных экземпляров:
$ tarantoolctl enter my_app
/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
/bin/tarantoolctl: Connecting to /var/run/tarantool/my_app.control
/bin/tarantoolctl: connected to unix/:/var/run/tarantool/my_app.control
unix/:/var/run/tarantool/my_app.control> 1 + 1
---
- 2
...
unix/:/var/run/tarantool/my_app.control>

$ # для локальных и удаленных экземпляров:
$ tarantoolctl connect username:password@127.0.0.1:3306 $ apt-get install libgoogle-perftools4 $ echo $(pidof tarantool INSTANCENAME.lua) $ gdb -ex "set pagination 0" -ex "thread apply all bt" --batch -p $(pidof tarantool INSTANCENAME.lua) $ journalctl -u tarantool@my_app -n 5
-- Logs begin at Fri 2016-01-08 12:21:53 MSK, end at Thu 2016-01-21 21:17:47 MSK. --
Jan 21 21:17:47 localhost.localdomain systemd[1]: Stopped Tarantool Database Server.
Jan 21 21:17:47 localhost.localdomain systemd[1]: Starting Tarantool Database Server...
Jan 21 21:17:47 localhost.localdomain tarantoolctl[5969]: /usr/bin/tarantoolctl: Found my_app.lua in /etc/tarantool/instances.available
Jan 21 21:17:47 localhost.localdomain tarantoolctl[5969]: /usr/bin/tarantoolctl: Starting instance...
Jan 21 21:17:47 localhost.localdomain systemd[1]: Started Tarantool Database Server $ perf record -g -p $(pidof tarantool INSTANCENAME.lua) $ perf report -n -g --stdio | tee perf-report.txt $ pprof --text /usr/bin/tarantool /home/<имя_пользователя>/tarantool-on-production.prof $ pstack $(pidof tarantool INSTANCENAME.lua) $ rm -f fiber.info.txt
$ watch -n 0.5 "echo 'require(\"fiber\").info()' | tarantoolctl enter NAME | tee -a fiber-info.txt" $ rm -f stack-trace.txt
$ watch -n 0.5 "gdb -ex 'set pagination 0' -ex 'thread apply all bt' --batch -p $(pidof tarantool INSTANCENAME.lua) | tee -a stack-trace.txt" $ tarantoolctl enter NAME $ tarantoolctl rocks install gperftools $ tarantoolctl status my_app
my_app is running (pid: /var/run/tarantool/my_app.pid)

$ # - ИЛИ -

$ systemctl status tarantool@my_app
tarantool@my_app.service - Tarantool Database Server
Loaded: loaded (/etc/systemd/system/tarantool@.service; disabled; vendor preset: disabled)
Active: active (running)
Docs: man:tarantool(1)
Process: 5346 ExecStart=/usr/bin/tarantoolctl start %I (code=exited, status=0/SUCCESS)
Main PID: 5350 (tarantool)
Tasks: 11 (limit: 512)
CGroup: /system.slice/system-tarantool.slice/tarantool@my_app.service
+ 5350 tarantool my_app.lua <running> $ yum install gperftools-libs **Пример** **gdb -ex "bt" -p <pid>** **pstack <pid>** :ref:`box.cfg <box_introspection-box_cfg>` -- проверка и указание всех конфигурационных параметров Tarantool-сервера, :ref:`box.info <box_introspection-box_info>` -- просмотр переменных Tarantool-сервера -- в первую очередь тех, что относятся к репликации, :ref:`box.slab <box_introspection-box_slab>` -- мониторинг использования и фрагментированности памяти, выделенной для хранения данных в Tarantool'е, :ref:`box.stat <box_introspection-box_stat>` -- просмотр статистики Tarantool'а по запросам и использованию сети, Очень часто администраторам приходится вызывать функцию :ref:`box.slab.info() <box_slab_info>`, которая показывает подробную статистику по использованию памяти для конкретного экземпляра Tarantool'а. Теперь можно получить необходимую информацию с помощью `fiber.info()`. После использования отладчика в консоль должна выводиться следующая информация: Еще можно использовать модули :ref:`console <console-module>` и :ref:`net.box <net_box-module>` из Tarantool-сервера. Также вы можете писать свои клиентские программы с использованием любого из доступных :ref:`коннекторов <index-box_connectors>`. Однако большинство примеров в данном документе использует или ``tarantoolctl connect``, или :ref:`Tarantool-сервер как клиент <admin-using_tarantool_as_a_client>`. Как и в случае с ``pstack``,  перед использованием GNU-отладчик (также известный как ``gdb``) необходимо сначала установить через пакетный менеджер, встроенный в ваш дистрибутив Linux. На этом шаге в вашей консоли должно выводиться следующее: По умолчанию некоторые команды из пакета ``perf`` можно выполнять только с **root**-правами, поэтому необходимо либо зайти в систему из-под пользователя **root**, либо добавлять перед каждой командой ``sudo``. Выполнение кода на экземпляре Tarantool'а Сначала войдите в интерактивную административную консоль вашего экземпляра Tarantool’а: Если вы используете Debian/Ubuntu, запустите эту команду: Если вы используете RHEL/CentOS/Fedora, запустите эту команду: Более подробная информация содержится в отчетах, которые можно получить с помощью функций из следующих подмодулей: Проверка состояния экземпляра Если вы не можете самостоятельно разобраться, какой именно файбер вызывает проблемы с производительностью, запустите данный скрипт на 10-15 секунд и пришлите получившийся файл команде Tarantool’а на адрес support@tarantool.org. Если вам не удается отыскать причину пониженной производительности, запустите данный скрипт на 10-15 секунд и пришлите получившийся файл ``stack-trace.txt`` команде Tarantool’а на адрес support@tarantool.org. Если вам необходимо динамически получать информацию с помощью ``fiber.info()``, вам может пригодиться приведенный ниже скрипт. Он каждые полсекунды подключается к экземпляру Tarantool’а, указанному в переменной ``NAME``, выполняет команду ``fiber.info()`` и записывает ее выход в файл ``fiber-info.txt``: Она превращает содержащиеся в ``perf.data`` статистические данные в отчет  о производительности, который сохраняется в файл ``perf-report.txt``. На сбор метрик производительности у профилировщика уходит по крайней мере  пара минут. По истечении этого времени можно сохранять информацию на диск (неограниченное количество раз): Создайте функцию для вызова функции под названием f1, которая осуществляет 500 000 вставок и удалений в спейсе Tarantool'а. Запустите профилировщик, выполните функцию, завершите работу профилировщика. Получите результат выборки профилировщика. Большинство инструментов, за исключением ``fiber.info()``, предназначено для дистрибутивов GNU/Linux, но не для FreeBSD или Mac OS. Затем выполните: Затем выполните эту команду: После окончания установки войдите в интерактивную административную консоль вашего экземпляра Tarantool’а: В дистрибутивах Debian/Ubuntu утилита ``pprof`` называется ``google-pprof``. После установки воспользуйтесь следующей командой: После установки воспользуйтесь следующей командой: После этого загрузите модуль ``fiber``: После этого установите привязки для Lua: Как правило, это не влияет на производительность. Однако, чтобы заставить Tarantool высвободить память, можно вызвать :ref:`box.snapshot <box-snapshot>`, остановить экземпляр и перезапустить его. Простейшие профилировщики Профилирование производительности Запустите отладчик в цикле, чтобы собрать достаточно информации, которая поможет установить причину спада производительности Tarantool’а. Можно воспользоваться следующим скриптом: Просмотр состояния сервера С точки зрения структуры и функциональности, этот скрипт идентичен тому, что используется выше с ``fiber.info()``. Tarantool почти никогда не освобождает эту память, даже если пользователь удалит все, что было вставлено, или уменьшит фрагментацию, вызвав сборщик мусора в Lua с помощью `функции collectgarbage <https://www.lua.org/manual/5.1/manual.html #pdf-collectgarbage>`_. Иногда Tarantool может работать медленнее, чем обычно. Причин такого поведения может быть несколько: проблемы с диском, Lua-скрипты, активно использующие процессор, или неправильная настройка. В таких случаях в журнале Tarantool’а могут отсутствовать необходимые подробности, поэтому единственным признаком неправильного поведения является наличие в журнале  записей вида ``W> too long DELETE: 8.546 sec``. Ниже приведены инструменты и приемы, которые облегчают снятие профиля производительности  Tarantool’а. Эта процедура может помочь при решении проблем с замедлением. Tarantool выводит приглашение командной строки (например, "tarantool>") -- и вы можете посылать запросы. Если использовать Tarantool таким образом, он может выступать клиентом для удаленного сервера, см. простые примеры в :ref:`Руководстве для начинающих <getting_started>`. Tarantool входит в интерактивный режим, если: Tarantool занимает память операционной системы, например, когда пользователь вставляет много данных. Можно проверить, сколько памяти занято, выполнив команду (в Linux): Скрипт ``tarantoolctl`` использует интерактивный режим для реализации команд  "enter" и "connect". Профилировщик "jit.p" входит в комплект сервера приложений Tarantool'а. Чтобы загрузить его, выполните команду ``require('jit.p')`` или ``require('jit.profile')``. Есть много параметров для настройки выборки и вывода, они описаны в документации по `Профилировщику LuaJIT <http://www.luatex.org/svn/trunk/source/libs/luajit/LuaJIT-src/doc/ext_profiler.html>`_. Получившийся отчет выглядит следующим образом: Самый простой способ профилирования -- это использование встроенных функций Tarantool’а. :ref:`fiber.info() <fiber-info>` возвращает информацию обо всех работающих файберах с соответствующей трассировкой стека для языка C. Эти данные показывают, сколько файберов запущенно на данный момент и какие функции, написанные на C, вызываются чаще остальных. Эта команда сохраняет собранные данные в файл ``perf.data``, который находится в текущей рабочей папке. Для остановки процесса (обычно через 10-15 секунд) нажмите **ctrl+C**. В консоли должно появиться следующее: Этот инструмент для мониторинга и анализа производительности устанавливается отдельно с помощью пакетного менеджера. Попробуйте ввести в окне консоли команду ``perf`` и следуйте подсказкам, чтобы установить необходимые пакеты. Thread 19 (Thread 0x7f09d1bff700 (LWP 24173)):
#0 0x00007f0a1a5423f2 in ?? () from /lib64/libgomp.so.1
#1 0x00007f0a1a53fdc0 in ?? () from /lib64/libgomp.so.1
#2 0x00007f0a1ad5adc5 in start_thread () from /lib64/libpthread.so.0
#3 0x00007f0a1a050ced in clone () from /lib64/libc.so.6
Thread 18 (Thread 0x7f09d13fe700 (LWP 24174)):
#0 0x00007f0a1a5423f2 in ?? () from /lib64/libgomp.so.1
#1 0x00007f0a1a53fdc0 in ?? () from /lib64/libgomp.so.1
#2 0x00007f0a1ad5adc5 in start_thread () from /lib64/libpthread.so.0
#3 0x00007f0a1a050ced in clone () from /lib64/libc.so.6
<...>
Thread 2 (Thread 0x7f09c8bfe700 (LWP 24191)):
#0 0x00007f0a1ad5e6d5 in pthread_cond_wait@@GLIBC_2.3.2 () from /lib64/libpthread.so.0
#1 0x000000000045d901 in wal_writer_pop(wal_writer*) ()
#2 0x000000000045db01 in wal_writer_f(__va_list_tag*) ()
#3 0x0000000000429abc in fiber_cxx_invoke(int (*)(__va_list_tag*), __va_list_tag*) ()
#4 0x00000000004b52a0 in fiber_loop ()
#5 0x00000000006099cf in coro_init ()
Thread 1 (Thread 0x7f0a1c47fd80 (LWP 24172)):
#0 0x00007f0a1a0512c3 in epoll_wait () from /lib64/libc.so.6
#1 0x00000000006051c8 in epoll_poll ()
#2 0x0000000000607533 in ev_run ()
#3 0x0000000000428e13 in main () Если вы используете систему, на которой доступна утилита ``systemd``, выполните следующую команду для проверки содержимого журнала загрузки: Чтобы проверить статус экземпляра Tarantool-сервера, выполните команду: Чтобы начать сбор показателей производительности, выполните следующую команду: Для запуска профилировщика выполните следующий код: Для остановки профилировщика выполните следующую команду: Чтобы использовать профилировщик процессора из набора Google Performance Tools с Tarantool’ом, необходимо сначала установить зависимости: Чтобы использовать этот инструмент, его необходимо установить с помощью пакетного менеджера, поставляемого с вашим дистрибутивом Linux. Данная команда выводит трассировку стека выполнения для работающего процесса с соответствующим PID. При необходимости команду можно запустить несколько раз, чтобы выявить узкое место, которое вызывает падение производительности. Total: 598 samples
      83 13.9% 13.9% 83 13.9% epoll_wait
      54 9.0% 22.9% 102 17.1%
vy_mem_tree_insert.constprop.35
      32 5.4% 28.3% 34 5.7% __write_nocancel
      28 4.7% 32.9% 42 7.0% vy_mem_iterator_start_from
      26 4.3% 37.3% 26 4.3% _IO_str_seekoff
      21 3.5% 40.8% 21 3.5% tuple_compare_field
      19 3.2% 44.0% 19 3.2%
::TupleCompareWithKey::compare
      19 3.2% 47.2% 38 6.4% tuple_compare_slowpath
      12 2.0% 49.2% 23 3.8% __libc_calloc
       9 1.5% 50.7% 9 1.5%
::TupleCompare::compare@42efc0
       9 1.5% 52.2% 9 1.5% vy_cache_on_write
       9 1.5% 53.7% 57 9.5% vy_merge_iterator_next_key
       8 1.3% 55.0% 8 1.3% __nss_passwd_lookup
       6 1.0% 56.0% 25 4.2% gc_onestep
       6 1.0% 57.0% 6 1.0% lj_tab_next
       5 0.8% 57.9% 5 0.8% lj_alloc_malloc
       5 0.8% 58.7% 131 21.9% vy_prepare Как правило, результат покажет, что выборка многократно осуществлялась в рамках f1(), а также в рамках внутренних функций Tarantool'а, имена которых могут изменяться с каждой новой версией. Инструменты ``gperftools`` и ``perf`` отличаются от ``pstack`` и ``gdb`` низкой затратой ресурсов (пренебрежимо малой по сравнению с ``pstack`` и ``gdb``): они подключаются к работающим процессам без больших задержек, а потому могут использоваться без серьезных последствий. Следует использовать ``pstack`` и ``gdb`` с осторожностью: каждый раз, подключаясь с работающему процессу, они приостанавливают выполнение этого  процесса приблизительно на одну секунду, что может иметь серьезные последствия для высоконагруженных сервисов. Использование Tarantool'а в качестве клиента Мы рекомендуем присваивать создаваемым файберам понятные имена, чтобы их можно было легко найти в списке, выводимом ``fiber.info()``. В примере ниже создается файбер с именем ``myworker``: Можно также попробовать воспользоваться Lua-модулем `tarantool/prometheus <https://github.com/tarantool/prometheus>`_, который облегчает сбор метрик (например, использование памяти или количество запросов) с Tarantool-приложений и баз данных и их публикацию через протокол Prometheus. Можно также использовать ``tarantoolctl`` для выполнения Lua-кода на запущенном экземпляре Tarantool-сервера, не подключаясь к его административной консоли. Например: Можно подключиться к :ref:`административной консоли <admin-security>` экземпляра и выполнить некий Lua-код с помощью утилиты ``tarantoolctl``: Для принудительного завершения файбера используется команда :ref:`fiber.kill(fid) <fiber-kill>`: Теперь можно проанализировать собранные данные с помощью утилиты ``pprof``, которая входит в пакет ``gperftools``: В вашей консоли должно отображаться приблизительно следующее: В консоль должно выводиться приблизительно следующее: [Thread debugging using libthread_db enabled]
Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".

[CUT]

Thread 1 (Thread 0x7f72289ba940 (LWP 20535)):
#0 _int_malloc (av=av@entry=0x7f7226e0eb20 <main_arena>, bytes=bytes@entry=504) at malloc.c:3697
#1 0x00007f7226acf21a in __libc_calloc (n=<optimized out>, elem_size=<optimized out>) at malloc.c:3234
#2 0x00000000004631f8 in vy_merge_iterator_reserve (capacity=3, itr=0x7f72264af9e0) at /usr/src/tarantool/src/box/vinyl.c:7629
#3 vy_merge_iterator_add (itr=itr@entry=0x7f72264af9e0, is_mutable=is_mutable@entry=true, belong_range=belong_range@entry=false) at /usr/src/tarantool/src/box/vinyl.c:7660
#4 0x00000000004703df in vy_read_iterator_add_mem (itr=0x7f72264af990) at /usr/src/tarantool/src/box/vinyl.c:8387
#5 vy_read_iterator_use_range (itr=0x7f72264af990) at /usr/src/tarantool/src/box/vinyl.c:8453
#6 0x000000000047657d in vy_read_iterator_start (itr=<optimized out>) at /usr/src/tarantool/src/box/vinyl.c:8501
#7 0x00000000004766b5 in vy_read_iterator_next (itr=itr@entry=0x7f72264af990, result=result@entry=0x7f72264afad8) at /usr/src/tarantool/src/box/vinyl.c:8592
#8 0x000000000047689d in vy_index_get (tx=tx@entry=0x7f7226468158, index=index@entry=0x2563860, key=<optimized out>, part_count=<optimized out>, result=result@entry=0x7f72264afad8) at /usr/src/tarantool/src/box/vinyl.c:5705
#9 0x0000000000477601 in vy_replace_impl (request=<optimized out>, request=<optimized out>, stmt=0x7f72265a7150, space=0x2567ea0, tx=0x7f7226468158) at /usr/src/tarantool/src/box/vinyl.c:5920
#10 vy_replace (tx=0x7f7226468158, stmt=stmt@entry=0x7f72265a7150, space=0x2567ea0, request=<optimized out>) at /usr/src/tarantool/src/box/vinyl.c:6608
#11 0x00000000004615a9 in VinylSpace::executeReplace (this=<optimized out>, txn=<optimized out>, space=<optimized out>, request=<optimized out>) at /usr/src/tarantool/src/box/vinyl_space.cc:108
#12 0x00000000004bd723 in process_rw (request=request@entry=0x7f72265a70f8, space=space@entry=0x2567ea0, result=result@entry=0x7f72264afbc8) at /usr/src/tarantool/src/box/box.cc:182
#13 0x00000000004bed48 in box_process1 (request=0x7f72265a70f8, result=result@entry=0x7f72264afbc8) at /usr/src/tarantool/src/box/box.cc:700
#14 0x00000000004bf389 in box_replace (space_id=space_id@entry=513, tuple=<optimized out>, tuple_end=<optimized out>, result=result@entry=0x7f72264afbc8) at /usr/src/tarantool/src/box/box.cc:754
#15 0x00000000004d72f8 in lbox_replace (L=0x413c5780) at /usr/src/tarantool/src/box/lua/index.c:72
#16 0x000000000050f317 in lj_BC_FUNCC ()
#17 0x00000000004d37c7 in execute_lua_call (L=0x413c5780) at /usr/src/tarantool/src/box/lua/call.c:282
#18 0x000000000050f317 in lj_BC_FUNCC ()
#19 0x0000000000529c7b in lua_cpcall ()
#20 0x00000000004f6aa3 in luaT_cpcall (L=L@entry=0x413c5780, func=func@entry=0x4d36d0 <execute_lua_call>, ud=ud@entry=0x7f72264afde0) at /usr/src/tarantool/src/lua/utils.c:962
#21 0x00000000004d3fe7 in box_process_lua (handler=0x4d36d0 <execute_lua_call>, out=out@entry=0x7f7213020600, request=request@entry=0x413c5780) at /usr/src/tarantool/src/box/lua/call.c:382
#22 box_lua_call (request=request@entry=0x7f72130401d8, out=out@entry=0x7f7213020600) at /usr/src/tarantool/src/box/lua/call.c:405
#23 0x00000000004c0f27 in box_process_call (request=request@entry=0x7f72130401d8, out=out@entry=0x7f7213020600) at /usr/src/tarantool/src/box/box.cc:1074
#24 0x000000000041326c in tx_process_misc (m=0x7f7213040170) at /usr/src/tarantool/src/box/iproto.cc:942
#25 0x0000000000504554 in cmsg_deliver (msg=0x7f7213040170) at /usr/src/tarantool/src/cbus.c:302
#26 0x0000000000504c2e in fiber_pool_f (ap=<error reading variable: value has been optimized out>) at /usr/src/tarantool/src/fiber_pool.c:64
#27 0x000000000041122c in fiber_cxx_invoke(fiber_func, typedef __va_list_tag __va_list_tag *) (f=<optimized out>, ap=<optimized out>) at /usr/src/tarantool/src/fiber.h:645
#28 0x00000000005011a0 in fiber_loop (data=<optimized out>) at /usr/src/tarantool/src/fiber.c:641
#29 0x0000000000688fbf in coro_init () at /usr/src/tarantool/third_party/coro/coro.c:110 ^C[ perf record: Woken up 1 times to write data ]
[ perf record: Captured and wrote 0.225 MB perf.data (1573 samples) ] box.space.t:drop()
box.schema.space.create('t')
box.space.t:create_index('i')
function f1() for i = 1,500000 do
  box.space.t:insert{i}
  box.space.t:delete{i}
  end
return 1
end
function f3() f1() end
jit_p = require("jit.profile")
sampletable = {}
jit_p.start("f", function(thread, samples, vmstate)
  local dump=jit_p.dumpstack(thread, "f", 1)
  sampletable[dump] = (sampletable[dump] or 0) + samples
end)
f3()
jit_p.stop()
for d,v in pairs(sampletable) do print(v, d) end fiber.info() gperftools jit.p perf ps -eo args,%mem | grep "tarantool" tarantool> box.slab.info()
---
- items_size: 228128
  items_used_ratio: 1.8%
  quota_size: 1073741824
  quota_used_ratio: 0.8%
  arena_used_ratio: 43.2%
  items_used: 4208
  quota_used: 8388608
  arena_size: 2325176
  arena_used: 1003632
... tarantool> cpuprof = require('gperftools.cpu')
tarantool> cpuprof.start('/home/<имя_пользователя>/tarantool-on-production.prof') tarantool> cpuprof.flush() tarantool> cpuprof.stop() tarantool> fiber = require('fiber') tarantool> fiber = require('fiber')
---
...
tarantool> f = fiber.create(function() while true do fiber.sleep(0.5) end end)
---
...
tarantool> f:name('myworker') <!-- присваивание имени файберу
---
...
tarantool> fiber.info()
---
- 102:
    csw: 14
    backtrace:
    - '#0 0x501a1a in fiber_yield_timeout+90'
    - '#1 0x4f2008 in lbox_fiber_sleep+72'
    - '#2 0x5112a7 in lj_BC_FUNCC+52'
    fid: 102
    memory:
      total: 57656
      used: 0
    name: myworker <!-- новый созданный фоновый файбер
  101:
    csw: 284
    backtrace: []
    fid: 101
    memory:
      total: 57656
      used: 0
    name: interactive
... tarantool> fiber = require('fiber')
---
...
tarantool> fiber.info()
---
- 360:
    csw: 2098165
    backtrace:
    - '#0 0x4d1b77 in wal_write(journal*, journal_entry*)+487'
    - '#1 0x4bbf68 in txn_commit(txn*)+152'
    - '#2 0x4bd5d8 in process_rw(request*, space*, tuple**)+136'
    - '#3 0x4bed48 in box_process1+104'
    - '#4 0x4d72f8 in lbox_replace+120'
    - '#5 0x50f317 in lj_BC_FUNCC+52'
    fid: 360
    memory:
      total: 61744
      used: 480
    name: main
  129:
    csw: 113
    backtrace: []
    fid: 129
    memory:
      total: 57648
      used: 0
    name: 'console/unix/:'
... tarantool> fiber.kill(102)
---
...
tarantool> fiber.info()
---
- 101:
    csw: 324
    backtrace: []
    fid: 101
    memory:
      total: 57656
      used: 0
    name: interactive
... в файле экземпляра содержится команда :ref:`console.start() <console-start>`. чтобы вывести на экран PID экземпляра Tarantool’а, использующего файл ``INSTANCENAME.lua``. вы запускаете его без :ref:`файла экземпляра <admin-instance_file>`, либо 