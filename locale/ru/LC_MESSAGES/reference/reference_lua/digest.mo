��    j      l              �  $   �  .   �  .     4   @  4   u  $   �  ,   �  $   �      !  (   B      k  (   �  &   �  .   �  &   	  "   2	  *   U	  &   �	  .   �	  &   �	  .   �	  &   ,
  .   S
  &   �
  .   �
  (   �
  W     �  Y  ,   &     S     r     �     �     �  ?   �     
  1     $   I  $   n  %   �  $   �  $   �  0     0   4  0   e     �     �  !   �     �       &   )  &   P  (   w  (   �     �  n   �  G   U  �   �  ,   �     �     �     �  q   �  _   `     �     �  E   �       5   $  5   Z  I   �  7   �  7     8   J  5   �  ;   �  (   �  E     E   d  8   �  F   �  6   *  H   a  H   �  H   �  +   <  0   h  4   �  .   �  �   �  �  �  �  l               ,  @   0  X   q  �   �  V  `  2   �      �   &  �   :   &#  N   a#  �   �#  �  K$  C   �%  .   2&  .   a&  4   �&  4   �&  $   �&  ,   '  $   L'      q'  (   �'      �'  (   �'  &   (  .   ,(  &   [(  "   �(  *   �(  &   �(  .   �(  &   &)  .   M)  &   |)  .   �)  &   �)  .   �)  (   (*  W   Q*  
  �*  [   �-  F   .  K   W.  B   �.  E   �.     ,/  h   9/     �/  w   �/  P   (0  P   y0  \   �0  P   '1  P   x1  v   �1  v   @2  v   �2  ;   .3  ;   j3  B   �3  >   �3  =   (4  `   f4  `   �4  b   (5  c   �5  A   �5  �   16  j   �6  j  [7  F   �8     9  B    9  Y   c9  �   �9  �   �:     H;     ^;  �   e;     <  }   ,<  }   �<  �   (=     �=     U>     �>  }   U?  �   �?  Y   W@  �   �@  �   YA     B  �   �B     +C  �   �C  �   WD  �   E  `   �E  h   F  h   yF  c   �F  �  FG  �   I  �  �K  �  �N     �P     �P  �   Q  �   �Q    dR  �  rS  2   )U     \U  &  qU  :   �W  N   �W  �   "X   (the expected output is 3304160206). :ref:`digest.aes256cbc.decrypt() <digest-aes>` :ref:`digest.aes256cbc.encrypt() <digest-aes>` :ref:`digest.base64_decode() <digest-base64_decode>` :ref:`digest.base64_encode() <digest-base64_encode>` :ref:`digest.crc32() <digest-crc32>` :ref:`digest.crc32.new() <digest-crc32_new>` :ref:`digest.guava() <digest-guava>` :ref:`digest.md4() <digest-md4>` :ref:`digest.md4_hex() <digest-md4_hex>` :ref:`digest.md5() <digest-md5>` :ref:`digest.md5_hex() <digest-md5_hex>` :ref:`digest.murmur() <digest-murmur>` :ref:`digest.murmur.new() <digest-murmur_new>` :ref:`digest.pbkdf2() <digest-pbkdf2>` :ref:`digest.sha1() <digest-sha1>` :ref:`digest.sha1_hex() <digest-sha1_hex>` :ref:`digest.sha224() <digest-sha224>` :ref:`digest.sha224_hex() <digest-sha224_hex>` :ref:`digest.sha256() <digest-sha256>` :ref:`digest.sha256_hex() <digest-sha256_hex>` :ref:`digest.sha384() <digest-sha384>` :ref:`digest.sha384_hex() <digest-sha384_hex>` :ref:`digest.sha512() <digest-sha512>` :ref:`digest.sha512_hex() <digest-sha512_hex>` :ref:`digest.urandom() <digest-urandom>` >>> import crcmod
>>> fun = crcmod.mkCrcFun('4812730177')
>>> fun('string')
3304160206L A "digest" is a value which is returned by a function (usually a `Cryptographic hash function`_), applied against a string. Tarantool's ``digest`` module supports several types of cryptographic hash functions (AES_, MD4_, MD5_, SHA-1_, SHA-2_, PBKDF2_) as well as a checksum function (CRC32_), two functions for base64_, and two non-cryptographic hash functions (guava_, murmur_). Some of the digest functionality is also present in the :ref:`crypto <crypto>`. Below is a list of all ``digest`` functions. Decode a Base64-encoded string Decrypt a string using AES Encode a string to Base64 Encrypt a string using AES Example For example, in Python, install the ``crcmod`` package and say: For example: Get a 128-byte hexadecimal digest made with SHA-2 Get a 224-bit digest made with SHA-2 Get a 256-bit digest made with SHA-2 Get a 32-bit checksum made with CRC32 Get a 384-bit digest made with SHA-2 Get a 512-bit digest made with SHA-2 Get a 56-byte hexadecimal digest made with SHA-2 Get a 64-byte hexadecimal digest made with SHA-2 Get a 96-byte hexadecimal digest made with SHA-2 Get a digest made with MD4 Get a digest made with MD5 Get a digest made with MurmurHash Get a digest made with PBKDF2 Get a digest made with SHA-1 Get a hexadecimal digest made with MD4 Get a hexadecimal digest made with MD5 Get a hexadecimal digest made with SHA-1 Get a number made with a consistent hash Get an array of random bytes If a later user calls the ``password_check()`` function and enters the wrong password, the result is an error. In Perl, install the ``Digest::CRC`` module and run the following code: In the following example, the user creates two functions, ``password_insert()`` which inserts a SHA-1_ digest of the word "**^S^e^c^ret Wordpass**" into a tuple set, and ``password_check()`` which requires input of a password. Incremental methods in the ``digest`` module Index Initiate incremental CRC32 Initiate incremental MurmurHash Initiates incremental MurmurHash. See :ref:`incremental methods <digest-incremental_digests>` notes. For example: Initiates incremental crc32. See :ref:`incremental methods <digest-incremental_digests>` notes. Module `digest` Name Options may be ``true`` or ``false``, the default value is ``false``. Overview Returns 128-bit binary string = digest made with MD4. Returns 128-bit binary string = digest made with MD5. Returns 128-byte string = hexadecimal of a digest calculated with sha512. Returns 160-bit binary string = digest made with SHA-1. Returns 224-bit binary string = digest made with SHA-2. Returns 256-bit binary string =  digest made with SHA-2. Returns 256-bit binary string = digest made with AES. Returns 32-bit binary string = digest made with MurmurHash. Returns 32-bit checksum made with CRC32. Returns 32-byte string = hexadecimal of a digest calculated with md4. Returns 32-byte string = hexadecimal of a digest calculated with md5. Returns 384-bit binary string =  digest made with SHA-2. Returns 40-byte string = hexadecimal of a digest calculated with sha1. Returns 512-bit binary tring = digest made with SHA-2. Returns 56-byte string = hexadecimal of a digest calculated with sha224. Returns 64-byte string = hexadecimal of a digest calculated with sha256. Returns 96-byte string = hexadecimal of a digest calculated with sha384. Returns a number made with consistent hash. Returns a regular string from a base64 encoding. Returns array of random bytes with length = integer. Returns base64 encoding from a regular string. Returns binary string = digest made with PBKDF2. |br| For effective encryption the ``iterations`` value should be at least several thousand. The ``digest-length`` value determines the length of the resulting binary string. Suppose that a digest is done for a string 'A', then a new part 'B' is appended to the string, then a new digest is required. The new digest could be recomputed for the whole string 'AB', but it is faster to take what was computed before for 'A' and apply changes based on the new part 'B'. This is called multi-step or "incremental" digesting, which Tarantool supports with crc32 and with murmur... The ``crc32`` and ``crc32_update`` functions use the `Cyclic Redundancy Check`_ polynomial value: ``0x1EDC6F41`` / ``4812730177``. (Other settings are: input = reflected, output = reflected, initial value = 0xFFFFFFFF, final xor value = 0x0.) If it is necessary to be compatible with other checksum functions in other programming languages, ensure that the other functions use the same polynomial value. The guava function uses the `Consistent Hashing`_ algorithm of the Google guava library. The first parameter should be a hash code; the second parameter should be the number of buckets; the returned value will be an integer between 0 and the number of buckets. For example, The possible options are: Use ``nopad`` -- result must not include '=' for padding at the end, ``nowrap`` -- result must not include line feed for splitting lines after 72 characters, ``urlsafe`` -- result must not include '=' or line feed, and may contain '-' or '_' instead of '+' or '/' for positions 62 and 63 in the index table. digest = require('digest')

-- print crc32 of 'AB', with one step, then incrementally
print(digest.crc32('AB'))
c = digest.crc32.new()
c:update('A')
c:update('B')
print(c:result())

-- print murmur hash of 'AB', with one step, then incrementally
print(digest.murmur('AB'))
m = digest.murmur.new()
m:update('A')
m:update('B')
print(m:result()) digest.base64_encode(string_variable,{nopad=true}) murmur.new({seed=0}) tarantool> digest = require('digest')
---
...
tarantool> function password_insert()
         >   box.space.tester:insert{1234, digest.sha1('^S^e^c^ret Wordpass')}
         >   return 'OK'
         > end
---
...
tarantool> function password_check(password)
         >   local t = box.space.tester:select{12345}
         >   if digest.sha1(password) == t[2] then
         >     return 'Password is valid'
         >   else
         >     return 'Password is not valid'
         >   end
         > end
---
...
tarantool> password_insert()
---
- 'OK'
... tarantool> digest.guava(10863919174838991, 11)
---
- 8
... tarantool> password_check('Secret Password')
---
- 'Password is not valid'
... use Digest::CRC;
$d = Digest::CRC->new(width => 32, poly => 0x1EDC6F41, init => 0xFFFFFFFF, refin => 1, refout => 1);
$d->add('string');
print $d->digest; Project-Id-Version: Tarantool 1.10
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
 (ожидается выходное значение: 3304160206). :ref:`digest.aes256cbc.decrypt() <digest-aes>` :ref:`digest.aes256cbc.encrypt() <digest-aes>` :ref:`digest.base64_decode() <digest-base64_decode>` :ref:`digest.base64_encode() <digest-base64_encode>` :ref:`digest.crc32() <digest-crc32>` :ref:`digest.crc32.new() <digest-crc32_new>` :ref:`digest.guava() <digest-guava>` :ref:`digest.md4() <digest-md4>` :ref:`digest.md4_hex() <digest-md4_hex>` :ref:`digest.md5() <digest-md5>` :ref:`digest.md5_hex() <digest-md5_hex>` :ref:`digest.murmur() <digest-murmur>` :ref:`digest.murmur.new() <digest-murmur_new>` :ref:`digest.pbkdf2() <digest-pbkdf2>` :ref:`digest.sha1() <digest-sha1>` :ref:`digest.sha1_hex() <digest-sha1_hex>` :ref:`digest.sha224() <digest-sha224>` :ref:`digest.sha224_hex() <digest-sha224_hex>` :ref:`digest.sha256() <digest-sha256>` :ref:`digest.sha256_hex() <digest-sha256_hex>` :ref:`digest.sha384() <digest-sha384>` :ref:`digest.sha384_hex() <digest-sha384_hex>` :ref:`digest.sha512() <digest-sha512>` :ref:`digest.sha512_hex() <digest-sha512_hex>` :ref:`digest.urandom() <digest-urandom>` >>> import crcmod
>>> fun = crcmod.mkCrcFun('4812730177')
>>> fun('string')
3304160206L "Дайджест" -- это значение, которое возвращает функция (как правило, криптографическая хеш-функция -- `Cryptographic hash function`_), примененная к строке. Модуль``digest`` Tarantool'а поддерживает несколько типов криптографических хеш-функций  (AES_, MD4_, MD5_, SHA-1_, SHA-2_, PBKDF2_), а также функцию контрольного суммирования (CRC32_), две функции для base64_ и две некриптографические хеш-функции (guava_, murmur_). Часть функций модуля digest также включена в модуль :ref:`crypto <crypto>`. Ниже приведен перечень всех функций модуля ``digest``. Декодирование строки по стандарту Base64 Расшифрование строки с использованием AES Кодирование строки по стандарту Base64 Шифрование строки с использованием AES Пример Например, в Python установите пакет ``crcmod`` и введите команду: Пример: Получение 128-байтного шестнадцатеричного дайджеста с помощью SHA-2 Получение 224-битного дайджеста с помощью SHA-2 Получение 256-битного дайджеста с помощью SHA-2 Получение 32-битной контрольной суммы с помощью CRC32 Получение 384-битного дайджеста с помощью SHA-2 Получение 512-битного дайджеста с помощью SHA-2 Получение 56-байтного шестнадцатеричного дайджеста с помощью SHA-2 Получение 64-байтного шестнадцатеричного дайджеста с помощью SHA-2 Получение 96-байтного шестнадцатеричного дайджеста с помощью SHA-2 Получение дайджеста с помощью MD4 Получение дайджеста с помощью MD5 Получение дайджеста с помощью MurmurHash Получение дайджеста с помощью PBKDF2 Получение дайджеста с помощью SHA-1 Получение шестнадцатеричного дайджеста с помощью MD4 Получение шестнадцатеричного дайджеста с помощью MD5 Получение шестнадцатеричного дайджеста с помощью SHA-1 Получение числа с помощью консистентного хеширования Получение массива случайных байтов Если затем пользователь вызовет функцию ``password_check()`` и вводит неверный пароль, результатом будет ошибка. В Perl установите модуль ``Digest::CRC`` и выполните следующий код: В следующем примере пользователь создает две функции: функцию ``password_insert()``, которая вставляет дайджест слова "**^S^e^c^ret Wordpass**" по SHA-1_ в набор кортежей, и функцию ``password_check()``, которая требует ввод пароля. Инкрементальные методы в модуле ``digest`` Указатель Запуск инкрементного вычисления CRC32 Запуск инкрементного вычисления с помощью MurmurHash Запуск инкрементного вычисления с помощью MurmurHash. См. примечания по :ref:`инкрементным методам <digest-incremental_digests>`. Например: Запуск инкрементного вычисления CRC32. См. примечания по :ref:`инкрементным методам <digest-incremental_digests>`. Модуль `digest` Имя Значения параметров могут быть ``true`` (правда) или ``false`` (ложь), по умолчанию используется ``false``. Общие сведения Возврат 128-битной двоичной строки = дайджест, полученный с помощью MD4. Возврат 128-битной двоичной строки = дайджест, полученный с помощью MD5. Возврат 128-байтной строки = шестнадцатеричное значение дайджеста, вычисленного с помощью SHA-512. Возврат 160-битной двоичной строки = дайджест, полученный с помощью SHA-1. Возврат 224-битной двоичной строки = дайджест, полученный с помощью SHA-2. Возврат 256-битной двоичной строки = дайджест, полученный с помощью SHA-2. Возврат 256-битной двоичной строки = дайджест, полученный с помощью AES. Возврат 32-битной двоичной строки = дайджест, полученный с помощью MurmurHash. Возврат 32-битной контрольной суммы с помощью CRC32. Возврат 32-байтной строки = шестнадцатеричное значение дайджеста, вычисленного с помощью MD4. Возврат 32-байтной строки = шестнадцатеричное значение дайджеста, вычисленного с помощью MD5. Возврат 384-битной двоичной строки = дайджест, полученный с помощью SHA-2. Возврат 40-байтной строки = шестнадцатеричное значение дайджеста, вычисленного с помощью SHA-1. Возврат 512-битной двоичной строки = дайджест, полученный с помощью SHA-2. Возврат 56-байтной строки = шестнадцатеричное значение дайджеста, вычисленного с помощью SHA-224. Возврат 64-байтной строки = шестнадцатеричное значение дайджеста, вычисленного с помощью SHA-256. Возврат 96-байтной строки = шестнадцатеричное значение дайджеста, вычисленного с помощью SHA-384. Возврат числа с помощью консистентного хеширования. Возврат обычной строки из кодированного по base64 значения. Возврат массива случайных байтов с длиной = целому числу. Возврат кодированного по base64 значения обычной строки. Возврат двоичной строки = дайджест, полученный с помощью PBKDF2. |br| Для эффективности шифрования значение параметра количества итераций ``iterations`` должно быть как минимум несколько тысяч. Значение параметра ``digest-length`` определяет длину полученной двоичной строки. Предположим, что вычислен дайджест для строки 'A', затем часть 'B' добавляется в строку, необходим новый дайджест. Новый дайджест можно пересчитать для всей строки 'AB', но быстрее будет взять вычисленный дайджест для 'A' и внести изменения на основании добавленной части 'B'. Это называется многошаговым процессом или "инкрементным" хеш-суммированием, которое поддерживает Tarantool поддерживает для crc32 и murmur... Функции ``crc32`` и ``crc32_update`` используют значение многочлена `Cyclic Redundancy Check`_ : ``0x1EDC6F41`` / ``4812730177``. (Другие используемые значения: ввод = отраженное значение, вывод = отраженное значение, начальное значение = 0xFFFFFFFF, финальное xor-значение = 0x0.) Если необходима совместимость с другими функциями контрольной суммы на другом языке программирования, убедитесь, что другие функции используют то же значение многочлена. Функция guava использует алгоритм консистентного хеширование (`Consistent Hashing`_) из библиотеки guava от Google. Первым параметром должен быть хеш-код; вторым параметром должно быть число слотов; возвращается значение в виде целого числа в диапазоне от 0 до указанного числа слотов. Например, Возможные опции: Назначение ``nopad`` -- результат не должен включать в себя '=' для заполнения символами в конце, ``nowrap`` -- результат не должен включать в себя символ переноса строки для разделения строк после 72 символов, ``urlsafe`` -- результат не должен включать в себя '=' или символ переноса строки и может содержать '-' или '_' взамен '+' или '/' в качестве 62 и 63 символа в схеме. digest = require('digest')

-- вывести дайджест 'AB' по crc32 пошагово, затем с инкрементом
print(digest.crc32('AB'))
c = digest.crc32.new()
c:update('A')
c:update('B')
print(c:result())

-- вывести дайджест 'AB' по murmur hash пошагово, затем с инкрементом
print(digest.murmur('AB'))
m = digest.murmur.new()
m:update('A')
m:update('B')
print(m:result()) digest.base64_encode(string_variable,{nopad=true}) murmur.new({seed=0}) tarantool> digest = require('digest')
---
...
tarantool> function password_insert()
         >   box.space.tester:insert{1234, digest.sha1('^S^e^c^ret Wordpass')}
         >   return 'OK'
         > end
---
...
tarantool> function password_check(password)
         >   local t = box.space.tester:select{12345}
         >   if digest.sha1(password) == t[2] then
         >     return 'Password is valid'
         >   else
         >     return 'Password is not valid'
         >   end
         > end
---
...
tarantool> password_insert()
---
- 'OK'
... tarantool> digest.guava(10863919174838991, 11)
---
- 8
... tarantool> password_check('Secret Password')
---
- 'Password is not valid'
... use Digest::CRC;
$d = Digest::CRC->new(width => 32, poly => 0x1EDC6F41, init => 0xFFFFFFFF, refin => 1, refout => 1);
$d->add('string');
print $d->digest; 