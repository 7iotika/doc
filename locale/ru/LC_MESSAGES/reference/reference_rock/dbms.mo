��    \      �              �  �   �  z   ^  :   �  A         V  $   w     �     �  ;   �     �  7     4   P  =   �  @   �  [   	  >   `	  ;   �	  ;   �	  >   
  P   V
  �   �
  �   f  z   "  t   �         )  v   <  s   �  
   '    2  #  P     t  G   |  4   �     �  )     .   9     h  }   u  z   �  �   n  Q     N   o     �  R  �       �   *  �   '       H   !  M   j  	   �  �   �  �   c          !  �   2  �  �  B   ]  �   �  �   A  �   9  ?   3   �  s   �  �!    �#  �   �$  C   �%  @   	&  7   J&  ;   �&     �&     �&  �   �&  s   �'  ~   2(     �(     1)     J)  ?  ])  D   �*  >   �*     !+  �   A+  �   �+  %   �,  "  �,  >  �.  L  0  �   j2  �   3  �  �3  �   d5  z   �5  :   c6  A   �6      �6  $   7     &7  %   87  V   ^7  $   �7  \   �7  Y   78  a   �8  j   �8  |   ^9  W   �9  e   3:  e   �:  p   �:  �   p;  Z  )<    �=  �   �>  �   ??  �  �?  %   sA  �   �A  �   YB     C    -C  ,  JE     wG  �   �G  w   H  '   �H  C   �H  H   �H     AI  �   OI  �   :J    "K  �   0L  �   �L  $   =M  S  bM     �O  �  �O  �  �Q     �S  �   �S  �   qT      /U    PU  !  hV     �W     �W  �   �W  �  ~X  t   "]  	  �]  <  �^  >  �_  t   a  �  �a    @d  �  Hg    %i  �   �j  �   Jk  �   �k  �   ql     �l     �l  �   m  s   �m  ~   qn  �   �n     xo     �o  f  �o  D   q  >   Pq     �q  �   �q  �   lr  %   s  "  )s  >  Lu  L  �v  %  �x    �y   $ git clone https://github.com/tarantool/mysql.git
$ cd mysql && cmake . -DCMAKE_BUILD_TYPE=RelWithDebInfo
$ make
$ make install $ git clone https://github.com/tarantool/pg.git
$ cd pg && cmake . -DCMAKE_BUILD_TYPE=RelWithDebInfo
$ make
$ make install $ luarocks install mysql MYSQL_LIBDIR=/usr/local/mysql/lib $ luarocks install pg POSTGRESQL_LIBDIR=/usr/local/postgresql/lib $ sudo apt-get install libpq-dev $ sudo apt-get install tarantool-dev **Example:** *connection-name*:close() *connection-name*:execute(*sql-statement* [, *parameters*]) *connection-name*:ping() *connection_name* = mysql.connect(*connection options*) *connection_name* = pg.connect(*connection options*) :samp:`db = {database-name}` - string, default value is blank :samp:`host = {host-name}` - string, default value = 'localhost' :samp:`pass = {password}` or :samp:`password = {password}` - string, default value is blank :samp:`password = {password}` - string, default value is blank :samp:`port = {port-number}` - number, default value = 3306 :samp:`port = {port-number}` - number, default value = 5432 :samp:`raise = {true|false}` - boolean, default value is false :samp:`user = {user-name}` - string, default value is operating-system user name At this point it is a good idea to check that the installation produced a file named ``driver.so``, and to check that this file is on a directory that is searched by the ``require`` request. Begin by installing luarocks and making sure that tarantool is among the upstream servers, as in the instructions on `rocks.tarantool.org`_, the Tarantool luarocks page. Now execute this: Begin by making a ``require`` request for the mysql driver. We will assume that the name is ``mysql`` in further examples. Begin by making a ``require`` request for the pg driver. We will assume that the name is ``pg`` in further examples. Check the instructions for `downloading and installing a binary package <http://tarantool.org/download.html>`_ that apply for the environment where Tarantool was installed. In addition to installing ``tarantool``, install ``tarantool-dev``. For example, on Ubuntu, add the line: Closing connection Configure tarantool and load mysql module. Make sure that tarantool doesn't reply "error" for the call to "require()". Configure tarantool and load pg module. Make sure that tarantool doesn't reply "error" for the call to "require()". Connecting Create a Lua function that will connect to a PostgreSQL server, (using some factory default values for the port and user and password), retrieve one row, and display the row. For explanations of the statement types used here, read the Lua tutorial earlier in the Tarantool user manual. Create a Lua function that will connect to the MySQL server instance, (using some factory default values for the port and user and password), retrieve one row, and display the row. For explanations of the statement types used here, read the Lua tutorial earlier in the Tarantool user manual. Example Example, creating a function which sets each option in a separate line: Example, using a table literal enclosed in {braces}: Executing a statement For all MySQL statements, the request is: For all PostgreSQL statements, the request is: For example: For further information, including examples of rarely-used requests, see the README.md file at `github.com/tarantool/mysql`_. For further information, including examples of rarely-used requests, see the README.md file at `github.com/tarantool/pg`_. From a user's point of view the MySQL and PostgreSQL rocks are very similar, so the following sections -- "MySQL Example" and "PostgreSQL Example" -- contain some redundancy. Go the site `github.com/tarantool/mysql`_. Follow the instructions there, saying: Go the site `github.com/tarantool/pg`_. Follow the instructions there, saying: How to ping However, because not all platforms are alike, for this example the assumption is that the user must check that the appropriate PostgreSQL files are present and must explicitly state where they are when building the Tarantool/PostgreSQL driver. One can use ``find`` or ``whereis`` to see what directories PostgreSQL files are installed in. Installation It will be necessary to install Tarantool's MySQL driver shared library, load it, and use it to connect to a MySQL server instance. After that, one can pass any MySQL statement to the server instance and receive results, including multiple result sets. It will be necessary to install Tarantool's PostgreSQL driver shared library, load it, and use it to connect to a PostgreSQL server instance. After that, one can pass any PostgreSQL statement to the server instance and receive results. MySQL Example Now, for the MySQL driver shared library, there are two ways to install: Now, for the PostgreSQL driver shared library, there are two ways to install: Now, say: Observe the result. It contains "MySQL row". So this is the row that was inserted into the MySQL database. And now it's been selected with the Tarantool client. Observe the result. It contains "PostgreSQL row". So this is the row that was inserted into the PostgreSQL database. And now it's been selected with the Tarantool client. PostgreSQL Example SQL DBMS Modules Tarantool supplies DBMS connector modules with the module manager for Lua, LuaRocks. So the connector modules may be called "rocks". The Tarantool rocks allow for connecting to SQL servers and executing SQL statements the same way that a MySQL or PostgreSQL client does. The SQL statements are visible as Lua methods. Thus Tarantool can serve as a "MySQL Lua Connector" or "PostgreSQL Lua Connector", which would be useful even if that was all Tarantool could do. But of course Tarantool is also a DBMS, so the module also is useful for any operations, such as database copying and accelerating, which work best when the application can work on both SQL and Tarantool inside the same Lua routine. The methods for connect/select/insert/etc. are similar to the ones in the :ref:`net.box <net_box-module>` module. The connection-options parameter is a table. Possible options are: The discussion here in the reference is about incorporating and using two modules that have already been created: the "SQL DBMS rocks" for MySQL and PostgreSQL. The example was run on an Ubuntu 12.04 ("precise") machine where tarantool had been installed in a /usr subdirectory, and a copy of MySQL had been installed on ~/mysql-5.5. The mysqld server instance is already running on the local host 127.0.0.1. The example was run on an Ubuntu 12.04 ("precise") machine where tarantool had been installed in a /usr subdirectory, and a copy of PostgreSQL had been installed on /usr. The PostgreSQL server instance is already running on the local host 127.0.0.1. The names are similar to the names that PostgreSQL itself uses. The option names, except for `raise`, are similar to the names that MySQL's mysql client uses, for details see the MySQL manual at `dev.mysql.com/doc/refman/5.6/en/connecting.html`_. The `raise` option should be set to :codenormal:`true` if errors should be raised when encountered. To connect with a Unix socket rather than with TCP, specify ``host = 'unix/'`` and :samp:`port = {socket-name}`. This example assumes that MySQL 5.5 or MySQL 5.6 or MySQL 5.7 has been installed. Recent MariaDB versions will also work, the MariaDB C connector is used. The package that matters most is the MySQL client developer package, typically named something like libmysqlclient-dev. The file that matters most from this package is libmysqlclient.so or a similar name. One can use ``find`` or ``whereis`` to see what directories these files are installed in. This example assumes that PostgreSQL 8 or PostgreSQL 9 has been installed. More recent versions should also work. The package that matters most is the PostgreSQL developer package, typically named something like libpq-dev. On Ubuntu this can be installed with: To call another DBMS from Tarantool, the essential requirements are: another DBMS, and Tarantool. The module which connects Tarantool to another DBMS may be called a "connector". Within the module there is a shared library which may be called a "driver". To end a session that began with ``mysql.connect``, the request is: To end a session that began with ``pg.connect``, the request is: To ensure that a connection is working, the request is: We will assume that the name is 'conn' in further examples. With GitHub With LuaRocks conn = mysql.connect({
    host = '127.0.0.1',
    port = 3306,
    user = 'p',
    password = 'p',
    db = 'test',
    raise = true
})
-- OR
conn = mysql.connect({
    host = 'unix/',
    port = '/var/run/mysqld/mysqld.sock'
}) conn = pg.connect({
    host = '127.0.0.1',
    port = 5432,
    user = 'p',
    password = 'p',
    db = 'test'
}) luarocks install mysql [MYSQL_LIBDIR = *path*]
                       [MYSQL_INCDIR = *path*]
                       [--local] luarocks install pg [POSTGRESQL_LIBDIR = *path*]
                    [POSTGRESQL_INCDIR = *path*]
                    [--local] mysql = require('mysql') pg = require('pg') tarantool> -- Connection function. Usage: conn = mysql_connect()
tarantool> function mysql_connection()
         >   local p = {}
         >   p.host = 'widgets.com'
         >   p.db = 'test'
         >   conn = mysql.connect(p)
         >   return conn
         > end
---
...
tarantool> conn = mysql_connect()
---
... tarantool> box.cfg{}
...
tarantool> mysql = require('mysql')
---
... tarantool> box.cfg{}
...
tarantool> pg = require('pg')
---
... tarantool> conn:close()
---
... tarantool> conn:execute('select table_name from information_schema.tables')
---
- - table_name: ALL_PLUGINS
  - table_name: APPLICABLE_ROLES
  - table_name: CHARACTER_SETS
  <...>
- 78
... tarantool> conn:execute('select tablename from pg_tables')
---
- - tablename: pg_statistic
  - tablename: pg_type
  - tablename: pg_authid
  <...>
... tarantool> conn:ping()
---
- true
... tarantool> function mysql_select ()
         >   local conn = mysql.connect({
         >     host = '127.0.0.1',
         >     port = 3306,
         >     user = 'root',
         >     db = 'test'
         >   })
         >   local test = conn:execute('SELECT * FROM test WHERE s1 = 1')
         >   local row = ''
         >   for i, card in pairs(test) do
         >       row = row .. card.s2 .. ' '
         >       end
         >   conn:close()
         >   return row
         > end
---
...
tarantool> mysql_select()
---
- 'MySQL row '
... tarantool> function pg_connect()
         >   local p = {}
         >   p.host = 'widgets.com'
         >   p.db = 'test'
         >   p.user = 'postgres'
         >   p.password = 'postgres'
         >   local conn = pg.connect(p)
         >   return conn
         > end
---
...
tarantool> conn = pg_connect()
---
... tarantool> function pg_select ()
         >   local conn = pg.connect({
         >     host = '127.0.0.1',
         >     port = 5432,
         >     user = 'postgres',
         >     password = 'postgres',
         >     db = 'postgres'
         >   })
         >   local test = conn:execute('SELECT * FROM test WHERE s1 = 1')
         >   local row = ''
         >   for i, card in pairs(test) do
         >       row = row .. card.s2 .. ' '
         >       end
         >   conn:close()
         >   return row
         > end
---
...
tarantool> pg_select()
---
- 'PostgreSQL row '
... where ``sql-statement`` is a string, and the optional ``parameters`` are extra values that can be plugged in to replace any placeholders ($1 $2 $3 etc.) in the SQL statement. where ``sql-statement`` is a string, and the optional ``parameters`` are extra values that can be plugged in to replace any question marks ("?"s) in the SQL statement. Project-Id-Version: Tarantool 1.10
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
 $ git clone https://github.com/tarantool/mysql.git
 $ cd mysql && cmake . -DCMAKE_BUILD_TYPE=RelWithDebInfo
 $ make
 $ make install $ git clone https://github.com/tarantool/pg.git
$ cd pg && cmake . -DCMAKE_BUILD_TYPE=RelWithDebInfo
$ make
$ make install $ luarocks install mysql MYSQL_LIBDIR=/usr/local/mysql/lib $ luarocks install pg POSTGRESQL_LIBDIR=/usr/local/postgresql/lib $ sudo apt-get install libpq-dev $ sudo apt-get install tarantool-dev **Пример:** *имя-соединения*:close() *имя-соединения*:execute(*sql-оператор* [, *параметры*]) *имя-соединение*:ping() *имя_подключения* = mysql.connect(*параметры подключения*) *имя_подключения* = pg.connect(*параметры подключения*) :samp:`db = {имя-базы-данных}` -- строка, по умолчанию пустая :samp:`host = {имя-хоста}` -- строка, значение по умолчанию = 'localhost' :samp:`pass = {пароль}` или :samp:`password = {пароль}` -- строка, по умолчанию пустая :samp:`password = {пароль}` -- строка, по умолчанию пустая :samp:`port = {номер-порта}` -- число, значение по умолчанию = 3306 :samp:`port = {номер-порта}` -- число, значение по умолчанию = 5432 :samp:`raise = {true|false}` -- логическое значение, по умолчанию, false (ложь) :samp:`user = {имя-пользователя}` -- строка, значение по умолчанию -- имя пользователя в операционной системе На данном этапе желательно проверить, что после установки появился файл под названием ``driver.so``, а также проверить, что этот файл находится в директории, которую можно найти по запросу ``require``. Начните с установки luarocks. Убедитесь, что tarantool указан в серверах, как описано на странице сторонних модулей Tarantool'а `rocks.tarantool.org`_. Затем выполните: Начните с выполнения запроса ``require`` для драйвера mysql. В дальнейших примерах у него будет имя ``mysql``. Начните с выполнения запроса ``require`` для драйвера pg. В дальнейших примерах у него будет имя ``pg``. Проверьте инструкции по `загрузке и установке бинарного пакета <http://tarantool.org/download.html>`_, которые применимы к среде, где установлен Tarantool. Помимо установки ``tarantool``, установите ``tarantool-dev``. Например, в Ubuntu добавьте строку: Закрытие соединения Настройте Tarantool и загрузите модуль mysql. Убедитесь, что Tarantool не выбрасывает ошибку в ответ на вызов "require()". Настройте Tarantool и загрузите модуль pg. Убедитесь, что Tarantool не выбрасывает ошибку в ответ на вызов "require()". Подключение Создайте Lua-функцию, которая подключится к PostgreSQL-серверу (используя значения по умолчанию для параметров порта, пользователя и пароля), выберите одну строку и выведите ее на экран. Описание используемых здесь типов операторов вы можете найти в практикуме по Lua в руководстве пользователя Tarantool'а. Создайте Lua-функцию, которая подключится к экземпляру MySQL-сервера (используя значения по умолчанию для параметров порта, пользователя и пароля), выберите одну строку и выведите ее на экран. Описание используемых здесь типов операторов вы можете найти в практикуме по Lua в руководстве пользователя Tarantool'а. Пример Пример с созданием функции, которая определяет параметры в отдельных строках: Пример с использованием таблицы, заключенной в {фигурные скобки}: Исполнение оператора Для всех операторов MySQL запрос будет: Для всех операторов PostgreSQL запрос будет: Пример: Для получения дополнительной информации, включая примеры редко используемых запросов, см. файл README.md по ссылке `github.com/tarantool/mysql`_. Для получения дополнительной информации, включая примеры редко используемых запросов, см. файл README.md по ссылке `github.com/tarantool/pg`_. С точки зрения пользователя, модули для MySQL и PostgreSQL очень похожи, поэтому следующие разделы -- "Пример для MySQL" и "Пример для PostgreSQL" -- слегка избыточны. Перейдите по ссылке `github.com/tarantool/mysql`_. Следуя инструкциям, введите команду: Перейдите по ссылке `github.com/tarantool/pg`_. Следуя инструкциям, введите команду: Как проверить связь Однако, не все платформы одинаковы, поэтому в данном примере предполагается, что пользователь должен проверить наличие нужных PostgreSQL-файлов, а также явным образом прописать, где они находятся, для сборки драйвера Tarantool/PostgreSQL. Для поиска директорий, где установлены PostgreSQL-файлы, можно воспользоваться командами ``find`` или ``whereis``. Установка Также нужно будет установить библиотеку общего пользования Tarantool'а с драйвером для MySQL, загрузить ее и использовать для подключения к экземпляру MySQL-сервера. После этого можно передавать любой оператор MySQL на экземпляр сервера и получать результаты, включая наборы результатов. Также нужно будет установить библиотеку общего пользования Tarantool'а с драйвером для PostgreSQL, загрузить ее и использовать для подключения к экземпляру PostgreSQL-сервера. После этого можно передавать любой оператор PostgreSQL на экземпляр сервера и получать результаты. Пример для MySQL Что касается библиотеки общего пользования с драйвером для MySQL, ее можно установить двумя способами: Что касается библиотеки общего пользования с драйвером для PostgreSQL, ее можно установить двумя способами: Теперь выполните: Просмотрите результат. В нем есть строка "MySQL row". Это и есть строка, которая была вставлена в базу данных MySQL. А сейчас она выделена с помощью Tarantool-клиента. Просмотрите результат. В нем есть строка "PostgreSQL row". Это и есть строка, которая была вставлена в базу данных PostgreSQL. А сейчас она выделена с помощью Tarantool-клиента. Пример для PostgreSQL  Модули СУБД SQL Tarantool предоставляет модули-коннекторы для СУБД вместе с менеджером модулей для Lua под названием LuaRocks. Модули Tarantool'а позволяют подключаться к SQL-серверам и выполнять SQL-запросы так же, как это делает клиент MySQL или PostgreSQL. Операторы SQL доступны как Lua-методы. Таким образом, Tarantool может служить Lua-коннектором для MySQL или Lua-коннектором для PostgreSQL, что было бы полезно, даже если бы Tarantool больше ничего не умел. Но конечно же, Tarantool также представляет собой СУБД, поэтому модуль используется для любых операций, таких как копирование и ускорение базы данных, которые максимально эффективно, если приложение может работать как с SQL, так и с Tarantool в пределах одной Lua-процедуры. Методы подключения / выборки / вставки / и т.д. аналогичны методам модуля :ref:`net.box <net_box-module>`. Параметры подключения включены в таблицу. Доступные параметры: В данном разделе справочника рассматривается внедрение и использование двух уже созданных модулей: сторонние библиотеки СУБД SQL для MySQL и PostgreSQL. Пример выполняется на машине с ОС Ubuntu 12.04 (Precise Pangolin), где Tarantool установлен в поддиректорию /usr, а копия MySQL установлена в ~/mysql-5.5. Экземпляр сервера mysqld уже запущен на localhost 127.0.0.1. Пример выполняется на машине с ОС Ubuntu 12.04 (Precise Pangolin), где Tarantool установлен в поддиректорию /usr, а копия PostgreSQL установлена в /usr. Экземпляр сервера PostgreSQL уже запущен на localhost 127.0.0.1. Имена параметров похожи на имена, которые используются в PostgreSQL. Имена параметров, за исключением `raise`, похожи на имена, которые используются в MySQL-клиенте mysql, для получения подробной информации см. руководство по MySQL по ссылке `dev.mysql.com/doc/refman/5.6/en/connecting.html`_. Значение параметра `raise` следует указать как :codenormal:`true`, если ошибки должны возникать при обнаружении. Чтобы подключиться по Unix-сокету, а не по TCP, укажите ``host = 'unix/'`` и :samp:`port = {имя-сокета}`. В данном примере предполагается, что установлены MySQL 5.5, MySQL 5.6 или MySQL 5.7. Последние версии MariaDB также подойдут, используется коннектор к MariaDB для C. Самым важным пакетом будет пакет для разработчиков клиента MySQL, который обычно называется libmysqlclient-dev. Наиболее важным файлом из этого пакета будет файл libmysqlclient.so или с похожим названием. Можно использовать `` find`` или `` whereis``, чтобы узнать, в каких директориях установлены эти файлы. В данном примере предполагается, что установлены PostgreSQL 8 или PostgreSQL 9. Более поздние версии  также должны сработать. Самым важным пакетом будет пакет для разработчиков клиента PostgreSQL, который обычно называется libpq-dev. На Ubuntu его можно установить следующим образом: Для вызова другой СУБД из Tarantool'а нужно: другая СУБД и Tarantool. Модуль, который соединяет другую СУБД может называться коннектором. В модуле есть библиотека общего пользования, которая может называться драйвером. Чтобы закрыть сессию, которую открыли с помощью ``mysql.connect``, используется следующий запрос: Чтобы закрыть сессию, которую открыли с помощью ``pg.connect``, используется следующий запрос: Чтобы убедиться, что подключение работает, следует использовать запрос: Предполагаем, что в дальнейших примерах будет использоваться имя 'conn'. Из GitHub Из LuaRocks conn = mysql.connect({
     host = '127.0.0.1',
     port = 3306,
     user = 'p',
     password = 'p',
     db = 'test',
     raise = true
 })
-- ИЛИ
conn = mysql.connect({
    host = 'unix/',
    port = '/var/run/mysqld/mysqld.sock'
}) conn = pg.connect({
    host = '127.0.0.1',
    port = 5432,
    user = 'p',
    password = 'p',
    db = 'test'
}) luarocks install mysql [MYSQL_LIBDIR = *path*]
                       [MYSQL_INCDIR = *path*]
                       [--local] luarocks install pg [POSTGRESQL_LIBDIR = *путь*]
                    [POSTGRESQL_INCDIR = *путь*]
                    [--local] mysql = require('mysql') pg = require('pg') tarantool> -- Функция подключения. Использование: conn = mysql_connect()
tarantool> function mysql_connection()
         >   local p = {}
         >   p.host = 'widgets.com'
         >   p.db = 'test'
         >   conn = mysql.connect(p)
         >   return conn
         > end
---
...
tarantool> conn = mysql_connect()
---
... tarantool> box.cfg{}
...
tarantool> mysql = require('mysql')
---
... tarantool> box.cfg{}
...
tarantool> pg = require('pg')
---
... tarantool> conn:close()
---
... tarantool> conn:execute('select table_name from information_schema.tables')
---
- - table_name: ALL_PLUGINS
  - table_name: APPLICABLE_ROLES
  - table_name: CHARACTER_SETS
  <...>
- 78
... tarantool> conn:execute('select tablename from pg_tables')
---
- - tablename: pg_statistic
  - tablename: pg_type
  - tablename: pg_authid
  <...>
... tarantool> conn:ping()
---
- true
... tarantool> function mysql_select ()
         >   local conn = mysql.connect({
         >     host = '127.0.0.1',
         >     port = 3306,
         >     user = 'root',
         >     db = 'test'
         >   })
         >   local test = conn:execute('SELECT * FROM test WHERE s1 = 1')
         >   local row = ''
         >   for i, card in pairs(test) do
         >       row = row .. card.s2 .. ' '
         >       end
         >   conn:close()
         >   return row
         > end
---
...
tarantool> mysql_select()
---
- 'MySQL row '
... tarantool> function pg_connect()
         >   local p = {}
         >   p.host = 'widgets.com'
         >   p.db = 'test'
         >   p.user = 'postgres'
         >   p.password = 'postgres'
         >   local conn = pg.connect(p)
         >   return conn
         > end
---
...
tarantool> conn = pg_connect()
---
... tarantool> function pg_select ()
         >   local conn = pg.connect({
         >     host = '127.0.0.1',
         >     port = 5432,
         >     user = 'postgres',
         >     password = 'postgres',
         >     db = 'postgres'
         >   })
         >   local test = conn:execute('SELECT * FROM test WHERE s1 = 1')
         >   local row = ''
         >   for i, card in pairs(test) do
         >       row = row .. card.s2 .. ' '
         >       end
         >   conn:close()
         >   return row
         > end
---
...
tarantool> pg_select()
---
- 'PostgreSQL row '
... где ``sql-statement`` -- это строка, а необязательные параметры -- это дополнительные значения, которыми можно заменить любые местозаполнители ($1 $2 $3 и т.д.) в SQL-операторе. где ``sql-statement`` -- это строка, а необязательные параметры -- это дополнительные значения, которыми можно заменить любые знаки вопроса ("?") в SQL-операторе. 