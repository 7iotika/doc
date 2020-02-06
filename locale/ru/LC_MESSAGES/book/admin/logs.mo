��          �               �   E  �   �   3  �   �  �  �  �   �  �   U	  (   
     A
  �   F
  �   �
     �  �   �  �  �  E  h  �   �  �   w  �  ^  ;  �  s  %  >   �     �  �   �  n  �  @   P  �  �   $ tail /var/log/tarantool/my_app.log
2017-04-04 15:54:04.977 [29255] main/101/tarantoolctl C> version 1.7.3-382-g68ef3f6a9
2017-04-04 15:54:04.977 [29255] main/101/tarantoolctl C> log level 5
2017-04-04 15:54:04.978 [29255] main/101/tarantoolctl I> mapping 134217728 bytes for tuple arena...
2017-04-04 15:54:04.985 [29255] iproto/101/main I> binary: bound to [::1]:3301
2017-04-04 15:54:04.986 [29255] main/101/tarantoolctl I> recovery start
2017-04-04 15:54:04.986 [29255] main/101/tarantoolctl I> recovering from `/var/lib/tarantool/my_app/00000000000000000000.snap'
2017-04-04 15:54:04.988 [29255] main/101/tarantoolctl I> ready to accept requests
2017-04-04 15:54:04.988 [29255] main/101/tarantoolctl I> set 'checkpoint_interval' configuration option to 3600
2017-04-04 15:54:04.988 [29255] main/101/my_app I> Run console at unix/:/var/run/tarantool/my_app.control
2017-04-04 15:54:04.989 [29255] main/106/console/unix/:/var/ I> started
2017-04-04 15:54:04.989 [29255] main C> entering the event loop
2017-04-04 15:54:47.147 [29255] main/107/console/unix/: I> Hello for the manual readers $ tarantoolctl enter my_app
/bin/tarantoolctl: connected to unix/:/var/run/tarantool/my_app.control
unix/:/var/run/tarantool/my_app.control> require('log').info("Hello for the manual readers")
---
... /var/log/tarantool/*.log {
    daily
    size 512k
    missingok
    rotate 10
    compress
    delaycompress
    create 0640 tarantool adm
    postrotate
        /usr/bin/tarantoolctl logrotate `basename ${1%%.*}`
    endscript
} By default, logs are written to a file as defined in ``tarantoolctl`` defaults. ``tarantoolctl`` automatically detects if an instance is using ``syslog`` or an external program for logging, and does not override the log destination in this case. In such configurations, log rotation is usually handled by the external program used for logging. So, ``tarantoolctl logrotate`` command works only if logging-into-file is enabled in the instance file. File ``/etc/logrotate.d/tarantool`` is part of the standard Tarantool distribution, and you can modify it to change the default behavior. This is what this file is usually like: If you use a different log rotation program, you can invoke ``tarantoolctl logrotate`` command to request instances to reopen their log files after they were moved by the program of your choice. Let’s write something to the log file: Logs Tarantool can write its logs to a log file, ``syslog`` or a program specified in the configuration file (see :ref:`log <cfg_logging-log>` parameter). Tarantool logs important events to a file, e.g. ``/var/log/tarantool/my_app.log``. To build the log file path, ``tarantoolctl`` takes the instance name, prepends the instance directory and appends “.log” extension. Then check the logs: When logging to a file, the system administrator must ensure logs are rotated timely and do not take up all the available disk space. With ``tarantoolctl``, log rotation is pre-configured to use ``logrotate`` program, which you must have installed. Project-Id-Version: Tarantool 1.10
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
 $ tail /var/log/tarantool/my_app.log
2017-04-04 15:54:04.977 [29255] main/101/tarantoolctl C> version 1.7.3-382-g68ef3f6a9
2017-04-04 15:54:04.977 [29255] main/101/tarantoolctl C> log level 5
2017-04-04 15:54:04.978 [29255] main/101/tarantoolctl I> mapping 134217728 bytes for tuple arena...
2017-04-04 15:54:04.985 [29255] iproto/101/main I> binary: bound to [::1]:3301
2017-04-04 15:54:04.986 [29255] main/101/tarantoolctl I> recovery start
2017-04-04 15:54:04.986 [29255] main/101/tarantoolctl I> recovering from `/var/lib/tarantool/my_app/00000000000000000000.snap'
2017-04-04 15:54:04.988 [29255] main/101/tarantoolctl I> ready to accept requests
2017-04-04 15:54:04.988 [29255] main/101/tarantoolctl I> set 'checkpoint_interval' configuration option to 3600
2017-04-04 15:54:04.988 [29255] main/101/my_app I> Run console at unix/:/var/run/tarantool/my_app.control
2017-04-04 15:54:04.989 [29255] main/106/console/unix/:/var/ I> started
2017-04-04 15:54:04.989 [29255] main C> entering the event loop
2017-04-04 15:54:47.147 [29255] main/107/console/unix/: I> Hello for the manual readers $ tarantoolctl enter my_app
/bin/tarantoolctl: connected to unix/:/var/run/tarantool/my_app.control
unix/:/var/run/tarantool/my_app.control> require('log').info("Hello for the manual readers")
---
... /var/log/tarantool/*.log {
    daily
    size 512k
    missingok
    rotate 10
    compress
    delaycompress
    create 0640 tarantool adm
    postrotate
        /usr/bin/tarantoolctl logrotate `basename ${1%%.*}`
    endscript
} По умолчанию запись производится в файл журнала, как указано в исходных настройках ``tarantoolctl``. Скрипт ``tarantoolctl`` автоматически определяет, когда экземпляр использует для журналирования ``syslog`` или внешнюю программу, и не изменяет то, куда ведется запись. В таких случаях  ротацию журналов обычно выполняет та же программа, которая используется для журналирования. Именно поэтому команда ``tarantoolctl logrotate`` сработает только в том случае, если в файле экземпляра включена возможность вести запись в файл. Файл ``/etc/logrotate.d/tarantool`` поставляется со стандартным дистрибутивом Tarantool. Его можно редактировать для изменения поведения по умолчанию. Содержимое файла обычно выглядит так: Если вы используете другую программу для ротации журналов, можно вызвать команду ``tarantoolctl logrotate``, чтобы экземпляры переоткрыли свои файлы журнала после того, как выбранная вами программа переместила их. Запишем что-нибудь в файл журнала: Журналирование Tarantool может писать события в файл журнала, ``syslog`` или программу, указанную в конфигурационном файле (см. параметр :ref:`log <cfg_logging-log>`). Все важные события Tarantool записывает в файл журнала -- например, в ``/var/log/tarantool/my_app.log``.  ``tarantoolctl`` строит путь до файла  журнала следующим образом: "путь до директории с экземплярами" + "имя  экземпляра" + ".lua". Затем проверим содержимое журнала: При включенном журналировании системный администратор должен обеспечивать  своевременную ротацию журналов, чтобы избежать переполнения дискового пространства. Ротация журналов в ``tarantoolctl`` производится с помощью программы ``logrotate``, которую необходимо установить заранее. 