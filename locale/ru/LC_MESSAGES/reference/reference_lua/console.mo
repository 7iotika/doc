��    *      l              �     �      �  *   �  .     (   E  &   n    �  -   �     �  �   �  �   �     o     u  �  �     ;     L     Q  
   Z  z   e  9   �     	     *	    G	     e
  6   w
  b  �
  �     �  �  �  �  S  |  A   �       4     2   K     ~     �  �   �    4  �   8          3  �  R     �        *   (  .   S  (   �  &   �  �  �  \   �  .   )  V  X    �     �  <   �  �       �                 3   �   F   �   ,!  )   �!  E   �!    "     7$  ^   S$  �  �$  c  W'  �  �(  �  �,    l0  �   p2     �2  h   3  2   q3     �3     �3  �   �3    �4  �   �5  -   �6  -   �6   **Example:** :ref:`console.ac() <console-ac>` :ref:`console.connect() <console-connect>` :ref:`console.delimiter() <console-delimiter>` :ref:`console.listen() <console-listen>` :ref:`console.start() <console-start>` A special use of ``console.start()`` is with :ref:`initialization files <index-init_label>`. Normally, if one starts the Tarantool instance with :samp:`tarantool {initialization file}` there is no console. This can be remedied by adding these lines at the end of the initialization file: Below is a list of all ``console`` functions. Connect to an instance Connect to the instance at :ref:`URI <index-uri>`, change the prompt from '``tarantool>``' to ':samp:`{uri}>`', and act henceforth as a client until the user ends the session or types ``control-D``. If the Tarantool instance at :samp:`uri` requires authentication, the connection might look something like: ``console.connect('admin:secretpassword@distanthost.com:3301')``. Index Listen for incoming requests Listen on :ref:`URI <index-uri>`. The primary way of listening for incoming requests is via the connection-information string, or URI, specified in ``box.cfg{listen=...}``. The alternative way of listening is via the URI specified in ``console.listen(...)``. This alternative way is called "administrative" or simply :ref:`"admin port" <admin-security>`. The listening is usually over a local host with a Unix domain socket. Module `console` Name Overview Parameters Possible errors: the connection will fail if the target Tarantool instance was not initiated with ``box.cfg{listen=...}``. Set a custom end-of-request marker for Tarantool console. Set a delimiter Set the auto-completion flag Set the auto-completion flag. If auto-completion is `true`, and the user is using Tarantool as a client or the user is using Tarantool via ``console.connect()``, then hitting the TAB key may cause tarantool to complete a word automatically. The default auto-completion value is `true`. Start the console Start the console on the current interactive terminal. The "admin" address is the URI to listen on. It has no default value, so it must be specified if connections will occur via an admin port. The parameter is expressed with URI = Universal Resource Identifier format, for example "/tmpdir/unix_domain_socket.sock", or a numeric TCP port. Connections are often made with telnet. A typical port value is 3313. The console module allows one Tarantool instance to access another Tarantool instance, and allows one Tarantool instance to start listening on an :ref:`admin port <admin-security>`. The console.connect function allows one Tarantool instance, in interactive mode, to access another Tarantool instance. Subsequent requests will appear to be handled locally, but in reality the requests are being sent to the remote instance and the local instance is acting as a client. Once connection is successful, the prompt will change and subsequent requests are sent to, and executed on, the remote instance. Results are displayed on the local instance. To return to local mode, enter ``control-D``. The default end-of-request marker is a newline (line feed). Custom markers are not necessary because Tarantool can tell when a multi-line request has not ended (for example, if it sees that a function declaration does not have an end keyword). Nonetheless for special needs, or for entering multi-line requests in older Tarantool versions, you can change the end-of-request marker. As a result, newline alone is not treated as end of request. There are no restrictions on the types of requests that can be entered, except those which are due to privilege restrictions -- by default the login to the remote instance is done with user name = 'guest'. The remote instance could allow for this by granting at least one privilege: ``box.schema.user.grant('guest','execute','universe')``. To go back to normal mode, say: ``console.delimiter('')<marker>`` Use a custom end-of-request marker for Tarantool console local console = require('console')
console.start() nil return tarantool> console = require('console')
---
...
tarantool> console.connect('198.18.44.44:3301')
---
...
198.18.44.44:3301> -- prompt is telling us that instance is remote tarantool> console = require('console')
---
...
tarantool> console.listen('unix/:/tmp/X.sock')
... main/103/console/unix/:/tmp/X I> started
---
- fd: 6
  name:
    host: unix/
    family: AF_UNIX
    type: SOCK_STREAM
    protocol: 0
    port: /tmp/X.sock
... tarantool> console = require('console'); console.delimiter('!')
---
...
tarantool> function f ()
         > statement_1 = 'a'
         > statement_2 = 'b'
         > end!
---
...
tarantool> console.delimiter('')!
---
... the URI of the local instance the URI of the remote instance Project-Id-Version: Tarantool 1.10
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
 **Пример:** :ref:`console.ac() <console-ac>` :ref:`console.connect() <console-connect>` :ref:`console.delimiter() <console-delimiter>` :ref:`console.listen() <console-listen>` :ref:`console.start() <console-start>` ``console.start()`` специально используется с :ref:`файлами инициализации <index-init_label>`. Как правило, при запуске экземпляра Tarantool'а с помощью команды :samp:`tarantool {initialization file}`, консоль не поддерживается. Эту проблему можно решить путем добавления следующих строк в конце файла инициализации: Ниже приведен перечень всех функций модуля ``console``. Подключение к экземпляру Подключение к экземпляру по :ref:`URI <index-uri>`, смена командной строки с '``tarantool>``' на ':samp:`{uri}>`' и дальнейшая работа в качестве клиента до окончания сессии пользователя или ввода команды ``control-D``. Если экземпляр Tarantool'а по :samp:`URI` запрашивает авторизацию, подключение может выглядеть следующим образом: ``console.connect('admin:secretpassword@distanthost.com:3301')``. Указатель Прослушивание входящих запросов Прослушивание по :ref:`URI <index-uri>`. Основной способ прослушивания на предмет входящих запросов -- по строке информации о подключении, или URI, указанному в ``box.cfg{listen=...}``. Другой способ прослушивания -- по URI, указанному в ``console.listen(...)``. Этот другой способ называется "административным" или просто :ref:`"по порту администрирования" <admin-security>`. Такое прослушивание обычно осуществляется по локальному хосту с доменным Unix-сокетом. Модуль `console` Имя Общие сведения Параметры Возможные ошибки: подключение не будет установлено, если целевой экземпляр Tarantool'а не был инициирован с помощью ``box.cfg{listen=...}``. Настройка специального маркера окончания запроса для консоли Tarantool'а. Настройка разделителя Установка флага автодополнения ввода Установка флага автодополнения ввода. Если значение автодополнения = `true` (правда), и пользователь использует Tarantool в качестве клиента или подключен к Tarantool'у по ``console.connect()``, то при нажатии клавиши TAB Tarantool будет автоматически дополнять текст по введенной части. По умолчанию, задано значение `true`. Запуск консоли Запуск консоли на текущем интерактивном терминале. "Административный" адрес -- это URI для прослушивания. У него нет значения по умолчанию, поэтому следует указать, будет ли подключение производиться по порту администрирования. Параметр выражен URI = Универсальным идентификатором ресурса, например "/tmpdir/unix_domain_socket.sock", или числовым идентификатором TCP-порта. Подключения часто выполняются по telnet. Типичное значение порта: 3313. Модуль `console` позволяет одному экземпляру Tarantool'а получать доступ к другому экземпляру Tarantool'а и позволяет одному экземпляру Tarantool'а начать прослушивание по :ref:`порту администрирования <admin-security>`. Функция console.connect позволяет одному экземпляру Tarantool'а в интерактивном режиме получать доступ к другому экземпляру Tarantool'а. Последующие запросы на первый взгляд будут обрабатываться локально, но в действительности запросы отправляются на удаленный экземпляр, а локальный экземпляр выступает в виде клиента. После успешного подключения командная строка сменится, и последующие запросы отправляются и выполняются на удаленном экземпляре. Результат выводится на локальный экземпляр. Чтобы вернуться к работе на локальном экземпляре, введите команду ``control-D``. По умолчанию, маркер окончания запроса представляет собой символ разрыва строки (перевод строки). Нет необходимости в специальных маркерах, поскольку Tarantool может определить, если многостроковый запрос не завершен (например, если видно, что при объявлении функции еще не задано конечное ключевое слово). Тем не менее, в особых случаях или при вводе многостроковых запросов в более ранних версиях Tarantool'а, можно изменить маркер окончания запроса. В результате символ разрыва строки не будет означать окончание запроса. Нет ограничений по типу вводимых запросов, кроме ограничений по правам на выполняемые запросы -- по умолчанию, вход в систему на удаленном экземпляре выполняется от имени пользователя 'guest'. Можно разрешить работу на удаленном экземпляре, выдав права: ``box.schema.user.grant('guest','execute','universe')``. Чтобы вернуться в нормальный режим, введите команду: ``console.delimiter('')<marker>`` Назначение специальный маркер окончания запроса для консоли Tarantool'а local console = require('console')
console.start() nil возвращает tarantool> console = require('console')
---
...
tarantool> console.connect('198.18.44.44:3301')
---
...
198.18.44.44:3301> -- командная строка показывает, что работа идет с удаленным экземпляром tarantool> console = require('console')
---
...
tarantool> console.listen('unix/:/tmp/X.sock')
... main/103/console/unix/:/tmp/X I> started
---
- fd: 6
  name:
    host: unix/
    family: AF_UNIX
    type: SOCK_STREAM
    protocol: 0
    port: /tmp/X.sock
... tarantool> console = require('console'); console.delimiter('!')
---
...
tarantool> function f ()
         > statement_1 = 'a'
         > statement_2 = 'b'
         > end!
---
...
tarantool> console.delimiter('')!
---
... URI локального экземпляра URI удаленного экземпляра 