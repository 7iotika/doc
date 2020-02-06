��    F      L              |  z   }  �   �  z   z  P   �  &   F  /   m  �   �  %   Q  ?   w  C   �  0   �     ,  <   8  �  u  �  �  �   �  E   �     �  J  �     A     J  \   Z  @  �  �   �  1  y  r   �  �     �   �  u   �  �     �   �  g   {     �  	   �  �        �     �  �   �  �  v   @   ;#  �   |#      K$  U   l$    �$  f   �%  �   6&  �  5'  �   �(  f   �)  w   *  w  �*  a  -  �   q.  �   W/  �   �/  l   �0    U1     f2  X   l2  ]   �2  �   #3  �   �3  L   )4  )   v4  o  �4  F   8  9   W8  +   �8  N   �8  �  9  �   �:  �   �;  �   �<  �   �=  \   =>  �   �>  Z  $?  ^   @  ?   �@  �   A  o   �A     B  g    B  �  �B  G  N  �  ST  n   V  %   sV  �  �V     Y  F   .Y  �   uY  /  RZ  �   �\  �  {]  �   q_  �   c`  o  Ra    �b  �  �c  �   �e  �   ff      8g     Yg  �   fg     Hh  (   Qh  N  zh  h  �i  a   2o  |  �o  F   q  �   Xq  �  �q  �   �s  _  pt  =  �u  �  y  �   �z  �   >{  �  (|  o  ��  �  �  ?  ӄ  �  �  �   և  �  ��     ��  �   ��  �   K�    (�  �   F�  �   �  n   ��  o  ��  F   m�  v   ��  J   +�  u   v�   'alter', e.g. allow :ref:`box.space.x.index.y:alter <box_index-alter>` (access to certain system spaces is also necessary) 'create', e.g. allow :ref:`box.schema.space.create <box_schema-space_create>` (access to certain system spaces is also necessary) 'drop', e.g. allow :ref:`box.sequence.x:drop <box_schema-sequence_drop>` (currently this can be granted but has no effect) 'execute', e.g. allow call of a function, or (less commonly) allow use of a role 'read', e.g. allow select from a space 'session', e.g. whether the user can 'connect'. 'usage', e.g. whether any action is allowable regardless of other privileges (sometimes revoking 'usage' is a convenient way to block a user temporarily without dropping the user) 'write', e.g. allow update on a space (user-name, privilege, object-type [, object-name [, options]]) **Example for creating users and objects then granting privileges** **Example for granting many privileges at once** **Example** **Examples for granting privileges for specific operations** -- So that 'U' can create spaces:
  box.schema.user.grant('U','create','universe')
  box.schema.user.grant('U','write', 'space', '_schema')
  box.schema.user.grant('U','write', 'space', '_space')
-- So that 'U' can  create indexes (assuming 'U' created the space)
  box.schema.user.grant('U','read', 'space', '_space')
  box.schema.user.grant('U','read,write', 'space', '_index')
-- So that 'U' can  create indexes on space T (assuming 'U' did not create space T)
  box.schema.user.grant('U','create','space','T')
  box.schema.user.grant('U','read', 'space', '_space')
  box.schema.user.grant('U','write', 'space', '_index')
-- So that 'U' can  alter indexes on space T (assuming 'U' did not create the index)
  box.schema.user.grant('U','alter','space','T')
  box.schema.user.grant('U','read','space','_space')
  box.schema.user.grant('U','read','space','_index')
  box.schema.user.grant('U','read','space','_space_sequence')
  box.schema.user.grant('U','write','space','_index')
-- So that 'U' can create users or roles:
  box.schema.user.grant('U','create','universe')
  box.schema.user.grant('U','read,write', 'space', '_user')
  box.schema.user.grant('U','write','space', '_priv')
-- So that 'U' can create sequences:
  box.schema.user.grant('U','create','universe')
  box.schema.user.grant('U','read,write','space','_sequence')
-- So that 'U' can create functions:
  box.schema.user.grant('U','create','universe')
  box.schema.user.grant('U','read,write','space','_func')
-- So that 'U' can grant access on objects that 'U' created
  box.schema.user.grant('U','read','space','_user')
-- So that 'U' can select or get from a space named 'T'
  box.schema.user.grant('U','read','space','T')
-- So that 'U' can update or insert or delete or truncate a space named 'T'
  box.schema.user.grant('U','write','space','T')
-- So that 'U' can execute a function named 'F'
  box.schema.user.grant('U','execute','function','F')
-- So that 'U' can use the "S:next()" function with a sequence named S
  box.schema.user.grant('U','read,write','sequence','S')
-- So that 'U' can use the "S:set()" or "S:reset() function with a sequence named S
  box.schema.user.grant('U','write','sequence','S') -- This example will work for a user with many privileges, such as 'admin'
-- or a user with the pre-defined 'super' role
-- Create space T with a primary index
box.schema.space.create('T')
box.space.T:create_index('primary', {})
-- Create user U1 so that later we can change the current user to U1
box.schema.user.create('U1')
-- Create two roles, R1 and R2
box.schema.role.create('R1')
box.schema.role.create('R2')
-- Grant role R2 to role R1 and role R1 to user U1 (order doesn't matter)
-- There are two ways to grant a role; here we use the shorter way
box.schema.role.grant('R1', 'R2')
box.schema.user.grant('U1', 'R1')
-- Grant read/write privileges for space T to role R2
-- (but not to role R1 and not to user U1)
box.schema.role.grant('R2', 'read,write', 'space', 'T')
-- Change the current user to user U1
box.session.su('U1')
-- An insertion to space T will now succeed because, due to nested roles,
-- user U1 has write privilege on space T
box.space.T:insert{1} A **role** is a container for privileges which can be granted to regular users. Instead of granting or revoking individual privileges, you can put all the privileges in a role and then grant or revoke the role. A **session** is the state of a connection to Tarantool. It contains: Access control An important feature in role management is that roles can be **nested**. For example, role R1 can be granted a privilege "role R2", so users with the role R1 will subsequently get all privileges from both roles R1 and R2. In other words, a user gets all the privileges that are granted to a user’s roles, directly or indirectly. Briefly: Details follow. Each user (except 'guest') may have a **password**. The password is any alphanumeric string. First, we create two spaces ('u' and 'i') and grant a no-password user ('internal') full access to them. Then we define a function ('read_and_modify') and the no-password user becomes this function's creator. Finally, we grant another user ('public_user') access to execute Lua functions created by the no-password user. For a binary port connection -- with the :ref:`AUTH protocol command <box_protocol-iproto_protocol>`, supported by most clients; For a binary-port connection invoking a stored function with the CALL command -- if the :ref:`SETUID <box_schema-func_create>` property is enabled for the function, Tarantool temporarily replaces the current user with the function’s creator, with all the creator's privileges, during function execution. For an admin-console connection and in a Lua initialization script -- with :ref:`box.session.su <box_session-su>`; For more detail see :ref:`box.schema.user.grant() <box_schema-user_grant>` and :ref:`box.schema.role.grant() <box_schema-role_grant>` in the built-in modules reference. For more details of the password hashing algorithm (e.g. for the purpose of writing a new client application), read the `scramble.h <https://github.com/tarantool/tarantool/blob/2.1/src/scramble.h>`_ header file. Here we create a Lua function that will be executed under the user id of its creator, even if called by another user. In Tarantool, a single session can execute multiple concurrent transactions. Each transaction is identified by a unique integer id, which can be queried at start of the transaction using :ref:`box.session.sync() <box_session-sync>`. In these examples the object's creator grants precisely the minimal privileges necessary for particular operations, to user 'U'. In this example user 'admin' grants many privileges on many objects to user 'U', with a single request. Owners and privileges Passwords Role information is stored in the :ref:`_user <box_space-user>` space, but the third field in the tuple -- the type field -- is ‘role’ rather than ‘user’. Roles Sessions and security Tarantool has one database. It may be called "box.schema" or "universe". The database contains database objects, including spaces, indexes, users, roles, sequences, and functions. Tarantool passwords are stored in the :ref:`_user <box_space-user>` system space with a `cryptographic hash function <https://en.wikipedia.org/wiki/Cryptographic_hash_function>`_ so that, if the password is ‘x’, the stored hash-password is a long string like ‘lL3OvhkIPOKh+Vn9Avlkx69M/Ck=‘. When a client connects to a Tarantool instance, the instance sends a random `salt value <https://en.wikipedia.org/wiki/Salt_%28cryptography%29>`_ which the client must mix with the hashed-password before sending to the instance. Thus the original value ‘x’ is never stored anywhere except in the user’s head, and the hashed value is never passed down a network wire except when mixed with a random salt. The 'usage' and 'session' privileges cannot be granted to roles. The **owner** of a database object is the user who created it. The owner of the database itself, and the owner of objects that are created initially (the system spaces and the default users) is '**admin**'. The current user can be changed: The current user name can be found with :ref:`box.session.user() <box_session-user>`. There are actually two ways to grant or revoke a role: :samp:`box.schema.user.grant-or-revoke({user-name-or-role-name},'execute', 'role',{role-name}...)` or :samp:`box.schema.user.grant-or-revoke({user-name-or-role-name},{role-name}...)`. The second way is preferable. There are functions for saying that certain users are allowed to do certain things (“privileges”). There are two functions for managing passwords in Tarantool: :ref:`box.schema.user.passwd() <box_schema-user_passwd>` for changing a user's password and :ref:`box.schema.user.password() <box_schema-user_password>` for getting a hash of a user's password. There is a **current user** for any program working with Tarantool, local or remote. If a remote connection is using a :ref:`binary port <admin-security>`, the current user, by default, is '**guest**'. If the connection is using an :ref:`admin-console port <admin-security>`, the current user is '**admin**'. When executing a :ref:`Lua initialization script <index-init_label>`, the current user is also ‘**admin**’. There is a :ref:`_priv <box_space-priv>` system space, where privileges are stored. Whenever a user tries to do an operation, there is a check whether the user has the privilege to do the operation (“access control”). There is a :ref:`_user <box_space-user>` system space, where usernames and password-hashes are stored. There is a method to guarantee with password checks that users really are who they say they are (“authentication”). This system prevents malicious onlookers from finding passwords by snooping in the log files or snooping on the wire. It is the same system that `MySQL introduced several years ago <http://dev.mysql.com/doc/refman/5.7/en/password-hashing.html>`_, which has proved adequate for medium-security installations. Nevertheless, administrators should warn users that no system is foolproof against determined long-term attacks, so passwords should be guarded and changed occasionally. Administrators should also advise users to choose long unobvious passwords, but it is ultimately up to the users to choose or change their own passwords. To **access** objects, users need an appropriate privilege on the object (for example, the 'execute' privilege on function F if the users need to execute function F). See below some :ref:`examples for granting specific privileges <authentication-owners_privileges-examples-specific>` that a grantor -- that is, 'admin' or the object creator -- can make. To **create** objects, users need the 'create' privilege and at least 'read' and 'write' privileges on the system space with a similar name (for example, on the :ref:`_space <box_space-space>` if the user needs to create spaces). To **drop** an object, users must be the object's creator or be 'admin'. As the owner of the entire database, 'admin' can drop any object including other users. To grant privileges to a user, the object owner says :ref:`grant() <box_schema-user_grant>`. To revoke privileges from a user, the object owner says :ref:`revoke() <box_schema-user_revoke>`. In either case, there are up to five parameters: To track all connects and disconnects, you can use :ref:`connection and authentication triggers <triggers>`. Understanding security details is primarily an issue for administrators. However, ordinary users should at least skim this section to get an idea of how Tarantool makes it possible for administrators to prevent unauthorized access to the database and to certain functions. Users ``object-name`` is what the privilege is for (omitted if ``object-type`` is 'universe'); ``object-type`` is any of 'space', 'index', 'sequence', 'function', role-name, or 'universe'; ``options`` is a list inside braces for example ``{if_not_exists=true|false}`` (usually omitted because the default is acceptable). ``privilege`` is any of 'read', 'write', 'execute', 'create', 'alter', 'drop', 'usage', or 'session' (or a comma-separated list); ``user-name`` is the user (or role) that will receive or lose the privilege; an integer id identifying the connection, box.schema.space.create('u')
box.schema.space.create('i')
box.space.u:create_index('pk')
box.space.i:create_index('pk')

box.schema.user.create('internal')

box.schema.user.grant('internal', 'read,write', 'space', 'u')
box.schema.user.grant('internal', 'read,write', 'space', 'i')
box.schema.user.grant('internal', 'create', 'universe')
box.schema.user.grant('internal', 'read,write', 'space', '_func')

function read_and_modify(key)
  local u = box.space.u
  local i = box.space.i
  local fiber = require('fiber')
  local t = u:get{key}
  if t ~= nil then
    u:put{key, box.session.uid()}
    i:put{key, fiber.time()}
  end
end

box.session.su('internal')
box.schema.func.create('read_and_modify', {setuid= true})
box.session.su('admin')
box.schema.user.create('public_user', {password = 'secret'})
box.schema.user.grant('public_user', 'execute', 'function', 'read_and_modify') box.schema.user.grant('U','read,write,execute,create,drop','universe') session local state, such as Lua variables and functions. text description of the connected peer, and the :ref:`current user <authentication-users>` associated with the connection, Project-Id-Version: Tarantool 1.10
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
 'alter' (изменение), например, разрешить выполнение :ref:`box.space.x.index.y:alter <box_index-alter>` (также необходим доступ к определенным системным спейсам 'create' (создание), например, разрешить выполнение :ref:`box.schema.space.create <box_schema-space_create>` (также необходим доступ к определенным системным спейсам) 'drop' (удаление), например, разрешить выполнение :ref:`box.sequence.x:drop <box_schema-sequence_drop>` (сейчас можно настроить такие права, но они не действуют) 'execute' (выполнение), например, разрешить вызов функции, или (реже) разрешить использование роли 'read' (чтение), например, разрешить выборку из спейса 'session' (сессия), например, может ли пользователь выполнить подключение 'connect'. 'usage' (использование), например, допустимо ли любое действие, несмотря на другие права (иногда удобно отменить право на использование, чтобы временно заблокировать пользователя, не удаляя ег 'write' (запись), например, разрешить обновление спейса (user-name, privilege, object-type [, object-name [, options]]) **Пример создания пользователей и объектов и последующей выдачи прав** **Пример предоставления нескольких типов прав одновременно** **Пример** **Примеры предоставления прав на определенные действия** -- Чтобы 'U' мог создавать спейсы:
   box.schema.user.grant('U','create','universe')
   box.schema.user.grant('U','write', 'space', '_schema')
   box.schema.user.grant('U','write', 'space', '_space')
-- Чтобы 'U' мог создавать индексы (подразумевая, что 'U' создал спейс)
   box.schema.user.grant('U','read', 'space', '_space')
   box.schema.user.grant('U','read,write', 'space', '_index')
-- Чтобы 'U' мог создавать индексы в спейсы T (подразумевая, что 'U' не создал спейс T)
   box.schema.user.grant('U','create','space','T')
   box.schema.user.grant('U','read', 'space', '_space')
   box.schema.user.grant('U','write', 'space', '_index')
-- Чтобы 'U' мог изменять индексы в спейсе T (подразумевая, что 'U' не создал индекс)
   box.schema.user.grant('U','alter','space','T')
   box.schema.user.grant('U','read','space','_space')
   box.schema.user.grant('U','read','space','_index')
   box.schema.user.grant('U','read','space','_space_sequence')
   box.schema.user.grant('U','write','space','_index')
-- Чтобы 'U' мог создавать пользователей или роли:
   box.schema.user.grant('U','create','universe')
   box.schema.user.grant('U','read,write', 'space', '_user')
   box.schema.user.grant('U','write','space', '_priv')
-- Чтобы 'U' мог создавать последовательности:
   box.schema.user.grant('U','create','universe')
   box.schema.user.grant('U','read,write','space','_sequence')
-- Чтобы 'U' мог создавать функции:
   box.schema.user.grant('U','create','universe')
   box.schema.user.grant('U','read,write','space','_func')
-- Чтобы 'U' мог выдавать права на созданные им объекты:
   box.schema.user.grant('U','read','space','_user')
-- Чтобы 'U' мог производить выборку или получать данные из спейса под названием 'T'
   box.schema.user.grant('U','read','space','T')
-- Чтобы 'U' мог производить обновление, вставку, удаление или очистку спейса под названием 'T'
   box.schema.user.grant('U','write','space','T')
-- Чтобы 'U' мог выполнять функцию под названием 'F'
   box.schema.user.grant('U','execute','function','F')
-- Чтобы 'U' мог использовать функцию "S:next()" для последовательности под названием S
   box.schema.user.grant('U','read,write','sequence','S')
-- Чтобы 'U' мог использовать функцию "S:set()" или "S:reset()" для последовательности под названием S
  box.schema.user.grant('U','write','sequence','S') -- Этот пример сработает для пользователя со множеством прав, например, 'admin'
-- или для пользователя с заданной ролью 'super'
-- Создать спейс T с первичным индексом
box.schema.space.create('T')
box.space.T:create_index('primary', {})
-- Создать пользователя U1, чтобы затем можно было заменить текущего пользователя на U1
box.schema.user.create('U1')
-- Создать две роли, R1 и R2
box.schema.role.create('R1')
box.schema.role.create('R2')
-- Предоставить роль R2 для роли R1, а роль R1 пользователю U1 (порядок не имеет значения)
-- Есть два способа предоставить роль, здесь используется более короткий способ
box.schema.role.grant('R1', 'R2')
box.schema.user.grant('U1', 'R1')
-- Предоставить права на чтение/запись на спейс T для роли R2
-- (но не для роли R1 и не пользователю U1)
box.schema.role.grant('R2', 'read,write', 'space', 'T')
-- Изменить текущего пользователя на пользователя U1
box.session.su('U1')
-- Теперь вставка в спейс T сработает, потому что благодаря вложенным ролям,
-- у пользователя U1 есть права на запись в спейс T
box.space.T:insert{1} **Роль** представляет собой контейнер для прав, которые можно предоставить обычным пользователям. Вместо того, чтобы предоставлять или отменять индивидуальные права, можно поместить все права в роль, а затем назначить или отменить роль. **Сессия** -- это состояние подключения к Tarantool'у. Она содержит: Управление доступом В управлении доступом на основе ролей один из главных моментов -- это то, что роли могут быть **вложенными**. Например, роли R1 можно предоставить право типа "роль R2", то есть пользователи с ролью R1 тогда получат все права роли R1 и роли R2. Другими словами, пользователь получает все права, которые предоставляются ролям пользователя напрямую и опосредованно. Вкратце: Подробная информация приводится ниже. У каждого пользователя (за исключением гостя 'guest') может быть **пароль**. Паролем является любая буквенно-цифровая строка. Для начала создадим два спейса ('u' и 'i') и дадим полный доступ к ним пользователю без пароля ('internal'). Затем определим функцию ('read_and_modify'), и пользователь без пароля становится создателем функции. Наконец, дадим другому пользователю ('public_user') доступ на выполнение Lua-функций, созданных пользователем без пароля. Для соединения по бинарному порту -- с помощью :ref:`команды протокола AUTH <box_protocol-iproto_protocol>`, которая поддерживается большинством клиентов; Для соединения по бинарному порту, которое вызывает хранимую функцию с помощью команды CALL -- если для функции включена настройка :ref:`SETUID <box_schema-func_create>`, Tarantool временно заменит текущего пользователя на создателя функции со всеми правами создателя во время выполнения функции. Для соединения по порту для административной консоли и при выполнении скрипта инициализации на Lua -- с помощью :ref:`box.session.su <box_session-su>`; Более подробную информацию см. в справочнике по встроенным модулям: :ref:`box.schema.user.grant() <box_schema-user_grant>` и :ref:`box.schema.role.grant() <box_schema-role_grant>`. Для получения дополнительной информации об алгоритме хеширования паролей (например, для написания нового клиентского приложения), прочтите файл заголовка `scramble.h <https://github.com/tarantool/tarantool/blob/2.1/ src/scramble.h>`_. Здесь создадим Lua-функциб, которая будет выполняться от ID пользователя, который является ее создателем, даже если она вызывается другим пользователем. В Tarantool'е отдельная сессия может выполнять несколько транзакций одновременно. Каждая транзакция определяется по уникальному идентификатору в виде целого числа, который можно запросить в начале транзакции с помощью :ref:`box.session.sync() <box_session-sync>`. В данных примерах создатель объекта выдает пользователю 'U' минимально необходимые права на определенные действия. В данном примере пользователь 'admin' выдает много типов прав на множество объектов пользователю 'U' в едином запросе. Владельцы и права Пароли Информация о роли хранится в спейсе :ref:`_user <box_space-user>`, но третье поле кортежа -- поле типа -- это ‘роль’, а не ‘пользователь’. Роли Сессии и безопасность В Tarantool'е одна база данных. Она может называться "box.schema" или "universe". База данных содержит объекты базы данных, включая спейсы, индексы, пользователей, роли, последовательности и функции. Пароли Tarantool'а хранятся в системном спейсе :ref:`_user <box_space-user>` с `криптографической хеш-функцией <https://ru.wikipedia.org/wiki/%D0%9A%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D1%87%D0%B5%D1%81%D0%BA%D0%B0%D1%8F_%D1%85%D0%B5%D1%88-%D1%84%D1%83%D0%BD%D0%BA%D1%86%D0%B8%D1%8F>`_, так что если паролем является ‘x’, хранится хеш-пароль в виде длинной строки, например ‘lL3OvhkIPOKh+Vn9Avlkx69M/Ck=‘. Когда клиент подключается к экземпляру Tarantool'а, экземпляр отправляет случайное `значение соль <https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D0%BB%D1%8C_(%D0%BA%D1%80%D0%B8%D0%BF%D1%82%D0%BE%D0%B3%D1%80%D0%B0%D1%84%D0%B8%D1%8F)>`_, которое клиент должен сложить вместе с хеш-паролем перед отправкой на экземпляр. Таким образом, изначальное значение ‘x’ никогда не хранится нигде, кроме как в голове самого пользователя, а хешированное значение никогда не передается по сети, кроме как в смешанном с солью виде. Права типов 'usage' и 'session' нельзя предоставить для роли. **Владелец** объекта базы данных -- это пользователь, который создал его. Владельцем самой базы данных и объектов, которые изначально были созданы (системные спейсы и пользователи по умолчанию) является '**admin**'. Текущего пользователя можно изменить: Имя текущего пользователя можно узнать с помощью :ref:`box.session.user() <box_session-user>`. Фактически есть два способа предоставить или отменить роль: :samp:`box.schema.user.grant-or-revoke({имя-пользователя-или-имя-роли},'execute', 'role',{имя-роли}...)` или :samp:`box.schema.user.grant-or-revoke({имя-пользователя-или-имя-роли},{имя-роли}...)`. Рекомендуется использовать второй способ. Существуют функции, чтобы дать определенным пользователям право совершать определенные действия (“права”). Для управления паролями в Tarantool'е есть две функции: :ref:`box.schema.user.passwd() <box_schema-user_passwd>` для изменения пароля пользователя и :ref:`box.schema.user.password() <box_schema-user_password>` для получения хеша пароля пользователя. Для любой локальной или удаленной программы, работающей с Tarantool'ом, есть **текущий пользователь**. Если удаленное соединение использует :ref:`бинарный порт <admin-security>`, то текущим пользователем, по умолчанию, будет '**guest**' (гость). Если соединение использует :ref:`порт для административной консоли <admin-security>`, текущим пользователем будет '**admin**' (администратор). При выполнении :ref:`скрипта инициализации на Lua <index-init_label>`, текущим пользователем также будет ‘**admin**’. Существует системный спейс :ref:`_priv <box_space-priv>`, где хранятся права. Когда пользователь пытается выполнить операцию, проводится проверка на наличие у него прав на выполнение такой операции (“управление доступом”). Существует системный спейс :ref:`_user <box_space-user>`, где хранятся имена пользователей и хеши паролей. Существует метод, который с помощью паролей проверяет, что пользователи являются теми, за кого себя выдают (“аутентификация”). Система не дает злоумышленнику определить пароли путем просмотра файлов журнала или слежения за активностью. Это та же система, `несколько лет назад внедренная в MySQL <http://dev.mysql.com/doc/refman/5.7/en/password-hashing.html>`_, которой оказалось достаточно для объектов со средней степенью безопасности. Тем не менее, администраторы должны предупреждать пользователей, что никакая система не защищена полностью от постоянных длительных атак, поэтому пароли следует охранять и периодически изменять. Администраторы также должны рекомендовать пользователям выбирать длинные неочевидные пароли, но сами пользователи выбирают свои пароли и изменяют их. Чтобы **получать доступ** к объектам, у пользователей должны быть соответствующие права на объект (например, права на выполнение 'execute' на функцию F, если пользователям необходимо выполнить функцию F). См. ниже некоторые :ref:`примеры предоставления определенных прав <authentication-owners_privileges-examples-specific>`, которые может выдать 'admin' или создатель объекта. Чтобы **создавать** объекты, у пользователей должны быть права на создание 'create' и хотя бы права на чтение 'read' и запись 'write' в системный спейс с похожим именем (например, на спейс :ref:`_space <box_space-space>`, если пользователю необходимо создавать спейсы. Чтобы **удалить** объект, пользователь должен быть создателем объекта или 'admin'. Как владелец всей базы данных, 'admin' может удалить любой объект, в том числе других пользователей. Чтобы предоставить права пользователю, владелец объекта выполняет команду :ref:`grant() <box_schema-user_grant>`. Чтобы отменить права пользователя, владелец объекта выполняет команду :ref:`revoke() <box_schema-user_revoke>`. В любом случае можно использовать до пяти параметров: Чтобы отследить все подключения и отключения, можно использовать :ref:`триггеры соединений и аутентификации <triggers>`. В основном администраторы занимаются вопросами настроек безопасности. Однако обычные пользователи должны хотя бы бегло прочитать этот раздел, чтобы понять, как Tarantool позволяет администраторам не допустить неавторизованный доступ к базе данных и некоторым функциям. Пользователи ``object-name`` -- это то, на что распространяются права (не указывается, если ``object-type`` = 'universe'); ``object-type`` -- это любой тип объекта: 'space' (спейс), 'index' (индекс), 'sequence' (последовательность), 'function' (функция), имя роли или 'universe'; ``options`` -- это список параметров, приведенный в скобках, например, ``{if_not_exists=true|false}`` (как правило, не указывается, поскольку допускаются значения по умолчанию). ``privilege`` -- это тип прав: 'read', 'write', 'execute', 'create', 'alter', 'drop', 'usage' или 'session' (или список прав, разделенных запятыми); ``user-name`` -- это пользователь (или роль), который получит или потеряет права; идентификатор в виде целого числа, определяющий соединение, box.schema.space.create('u')
box.schema.space.create('i')
box.space.u:create_index('pk')
box.space.i:create_index('pk')

box.schema.user.create('internal')

box.schema.user.grant('internal', 'read,write', 'space', 'u')
box.schema.user.grant('internal', 'read,write', 'space', 'i')
box.schema.user.grant('internal', 'create', 'universe')
box.schema.user.grant('internal', 'read,write', 'space', '_func')

function read_and_modify(key)
  local u = box.space.u
  local i = box.space.i
  local fiber = require('fiber')
  local t = u:get{key}
  if t ~= nil then
    u:put{key, box.session.uid()}
    i:put{key, fiber.time()}
  end
end

box.session.su('internal')
box.schema.func.create('read_and_modify', {setuid= true})
box.session.su('admin')
box.schema.user.create('public_user', {password = 'secret'})
box.schema.user.grant('public_user', 'execute', 'function', 'read_and_modify') box.schema.user.grant('U','read,write,execute,create,drop','universe') локальное состояние сессии, например, переменные и функции на Lua. текстовое описание подключенного узла и :ref:`текущий пользователь <authentication-users>`, использующий соединение, 