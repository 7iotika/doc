��    :      �              �  �  �     S  H   `  H   �  2   �  .   %  ,   T     �     �  @   �  6   �          (  7   7  (   o     �     �     �     �  �   �  �   M  N   �  �  %	  �   �
     =  �   A  8     8   >  8   w     �     �  	  �  �  �  :   �  E     R   H     �     �     �  1   �  <     1   S  <   �     �     �  A   �  R   3  6   �  B   �  :      H   ;  :   �  H   �  :     H   C  :   �  H   �  �    �  �     Q  H   c  H   �  2   �  .   (  [   W  '   �  !   �  �   �  l   �  %     $   +  c   P  F   �     �          $     +  �   G    #  �   (     �   �   �#     q$  �   �$  e   J%  e   �%  e   &  >   |&  =   �&  [  �&  �  U)  :   0+  E   k+  �   �+  /   [,  2   �,  6   �,  ^   �,  m   T-  ^   �-  m   !.  2   �.  3   �.  n   �.  �   e/  c   �/  s   M0  g   �0  y   )1  g   �1  y   2  g   �2  y   �2  g   g3  y   �3   "Crypto" is short for "Cryptography", which generally refers to the production of a digest value from a function (usually a `Cryptographic hash function`_), applied against a string. Tarantool's ``crypto`` module supports ten types of cryptographic hash functions (AES_, DES_, DSS_, MD4_, MD5_, MDC2_, RIPEMD_, SHA-1_, SHA-2_). Some of the crypto functionality is also present in the :ref:`digest` module. **Example:** :ref:`crypto.cipher.{algorithm}.{cipher_mode}.decrypt() <crypto-cipher>` :ref:`crypto.cipher.{algorithm}.{cipher_mode}.encrypt() <crypto-cipher>` :ref:`crypto.digest.{algorithm}() <crypto-digest>` :ref:`crypto.hmac.{algorithm}() <crypto-hmac>` Below is a list of all ``crypto`` functions. Decrypt a string Encrypt a string For more information, read the article about `Encryption Modes`_ Four choices of block cipher modes are also available: Get a digest Get a hash key Getting the same results from digest and crypto modules Incremental methods in the crypto module Index Module `crypto` Name Overview Pass a key and a string. The result is an `HMAC <https://en.wikipedia.org/wiki/HMAC>`_ message authentication code. The eight algorithm choices: Pass or return a cipher derived from the string, key, and (optionally, sometimes) initialization vector. The four choices of algorithms: Pass or return a digest derived from the string. The eleven algorithm choices: Suppose that a digest is done for a string 'A', then a new part 'B' is appended to the string, then a new digest is required. The new digest could be recomputed for the whole string 'AB', but it is faster to take what was computed before for 'A' and apply changes based on the new part 'B'. This is called multi-step or "incremental" digesting, which Tarantool supports for all crypto functions. The following functions are equivalent. For example, the ``digest`` function and the ``crypto`` function will both produce the same result. Use _16byte_iv='1234567890123456'
_16byte_pass='1234567890123456'
e=crypto.cipher.aes128.cbc.encrypt('string', _16byte_pass, _16byte_iv)
crypto.cipher.aes128.cbc.decrypt(e,  _16byte_pass, _16byte_iv) aes128 - aes-128 (with 192-bit binary strings using AES) aes192 - aes-192 (with 192-bit binary strings using AES) aes256 - aes-256 (with 256-bit binary strings using AES) cbc - Cipher Block Chaining cfb - Cipher Feedback crypto = require('crypto')

-- print aes-192 digest of 'AB', with one step, then incrementally
key = 'key/key/key/key/key/key/'
iv =  'iviviviviviviviv'
print(crypto.cipher.aes192.cbc.encrypt('AB', key, iv))
c = crypto.cipher.aes192.cbc.encrypt.new(key)
c:init(nil, iv)
c:update('A')
c:update('B')
print(c:result())
c:free()

-- print sha-256 digest of 'AB', with one step, then incrementally
print(crypto.digest.sha256('AB'))
c = crypto.digest.sha256.new()
c:init()
c:update('A')
c:update('B')
print(c:result())
c:free() crypto.cipher.aes256.cbc.encrypt('x',b32,b16)==digest.aes256cbc.encrypt('x',b32,b16)
crypto.digest.md4('string') == digest.md4('string')
crypto.digest.md5('string') == digest.md5('string')
crypto.digest.sha1('string') == digest.sha1('string')
crypto.digest.sha224('string') == digest.sha224('string')
crypto.digest.sha256('string') == digest.sha256('string')
crypto.digest.sha384('string') == digest.sha384('string')
crypto.digest.sha512('string') == digest.sha512('string') crypto.digest.md4('string')
crypto.digest.sha512('string') crypto.hmac.md4('key', 'string')
crypto.hmac.md4_hex('key', 'string') des    - des (with 56-bit binary strings using DES, though DES is not recommended) dss - dss (using DSS) dss1 - dss (using DSS-1) ecb - Electronic Codebook md4 - md4 (with 128-bit binary strings using MD4) md4 or md4_hex - md4 (with 128-bit binary strings using MD4) md5 - md5 (with 128-bit binary strings using MD5) md5 or md5_hex - md5 (with 128-bit binary strings using MD5) mdc2 - mdc2 (using MDC2) ofb - Output Feedback ripemd160 - ripemd (with 160-bit binary strings using RIPEMD-160) ripemd160 or ripemd160_hex - ripemd (with 160-bit binary strings using RIPEMD-160) sha1 - sha-1 (with 160-bit binary strings using SHA-1) sha1 or sha1_hex - sha-1 (with 160-bit binary strings using SHA-1) sha224 - sha-224 (with 224-bit binary strings using SHA-2) sha224 or sha224_hex - sha-224 (with 224-bit binary strings using SHA-2) sha256 - sha-256 (with 256-bit binary strings using SHA-2) sha256 or sha256_hex - sha-256 (with 256-bit binary strings using SHA-2) sha384 - sha-384 (with 384-bit binary strings using SHA-2) sha384 or sha384_hex - sha-384 (with 384-bit binary strings using SHA-2) sha512 - sha-512(with 512-bit binary strings using SHA-2). sha512 or sha512_hex - sha-512(with 512-bit binary strings using SHA-2). Project-Id-Version: Tarantool 1.10
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
 "Crypto" -- это сокращенно "криптография", что обычно означает производство значения дайджеста из функции (как правило, криптографической хеш-функции -- `Cryptographic hash function`_), примененной к строке. Модуль ``crypto`` Tarantool'а поддерживает десять типов криптографических хеш-функций (AES_, DES_, DSS_, MD4_, MD5_, MDC2_, RIPEMD_, SHA-1_, SHA-2_). В модуле :ref:`digest` также есть некоторые криптографические функции. **Пример:** :ref:`crypto.cipher.{algorithm}.{cipher_mode}.decrypt() <crypto-cipher>` :ref:`crypto.cipher.{algorithm}.{cipher_mode}.encrypt() <crypto-cipher>` :ref:`crypto.digest.{algorithm}() <crypto-digest>` :ref:`crypto.hmac.{algorithm}() <crypto-hmac>` Ниже приведен перечень всех функций модуля ``crypto``. Расшифрование строки Шифрование строки Для получения дополнительной информации, см. статью о режимах шифрования `Encryption Modes`_ Также доступны четыре режима блочного шифрования на выбор: Получение дайджеста Получение хеш-ключа Получение одинаковых результатов из модулей digest и crypto Инкрементальные методы в модуле ``crypto`` Указатель Модуль `crypto` Имя Общие сведения Передача ключа и строки. Результатом будет код аутентификации сообщения `HMAC <https://ru.wikipedia.org/wiki/HMAC>`_. 8 алгоритмов на выбор: Передача или возврат шифрованного сообщения, полученного из строки, ключа и (необязательно) вектора инициализации. Четыре алгоритма на выбор: Передача или возврат дайджеста из строки. Выбор из одиннадцати алгоритмов: Предположим, что вычислен дайджест для строки 'A', затем часть 'B' добавляется в строку, необходим новый дайджест. Новый дайджест можно пересчитать для всей строки 'AB', но быстрее будет взять вычисленный дайджест для 'A' и внести изменения на основании добавленной части 'B'. Это называется многошаговым процессом или "инкрементным" хеш-суммированием, которое поддерживает Tarantool поддерживает для всех криптографических функций. Следующие функции равноценны. Например, функция ``digest`` и функция ``crypto`` приведут к одному результату. Назначение _16byte_iv='1234567890123456'
_16byte_pass='1234567890123456'
e=crypto.cipher.aes128.cbc.encrypt('string', _16byte_pass, _16byte_iv)
crypto.cipher.aes128.cbc.decrypt(e,  _16byte_pass, _16byte_iv) aes128 - aes-128 (128-битные двоичные строки с использованием AES) aes192 - aes-192 (192-битные двоичные строки с использованием AES) aes256 - aes-256 (256-битные двоичные строки с использованием AES) cbc - Сцепление блоков шифротекста  cfb - Обратная связь по шифротексту crypto = require('crypto')

-- вывести дайджест 'AB' по aes-192 пошагово, затем с инкрементом
key = 'key/key/key/key/key/key/'
iv =  'iviviviviviviviv'
print(crypto.cipher.aes192.cbc.encrypt('AB', key, iv))
c = crypto.cipher.aes192.cbc.encrypt.new(key)
c:init(nil, iv)
c:update('A')
c:update('B')
print(c:result())
c:free()

-- вывести дайджест 'AB' по sha-256 пошагово, затем с инкрементом
print(crypto.digest.sha256('AB'))
c = crypto.digest.sha256.new()
c:init()
c:update('A')
c:update('B')
print(c:result())
c:free() crypto.cipher.aes256.cbc.encrypt('x',b32,b16)==digest.aes256cbc.encrypt('x',b32,b16)
crypto.digest.md4('string') == digest.md4('string')
crypto.digest.md5('string') == digest.md5('string')
crypto.digest.sha1('string') == digest.sha1('string')
crypto.digest.sha224('string') == digest.sha224('string')
crypto.digest.sha256('string') == digest.sha256('string')
crypto.digest.sha384('string') == digest.sha384('string')
crypto.digest.sha512('string') == digest.sha512('string') crypto.digest.md4('string')
crypto.digest.sha512('string') crypto.hmac.md4('key', 'string')
crypto.hmac.md4_hex('key', 'string') des    - des (56-битные двоичные строки с использованием DES, хотя использование DES не рекомендуется) dss - dss (с использованием DSS) dss1 - dss (с использованием DSS-1) ecb - Электронная кодовая книга md4 - md4 (128-битные двоичные строки с использованием MD4) md4 или md4_hex - md4 (128-битные двоичные строки с использованием MD4) md5 - md5 (128-битные двоичные строки с использованием MD5) md5 или md5_hex - md5 (128-битные двоичные строки с использованием MD5) mdc2 - mdc2 (с использованием MDC2) ofb - Обратная связь по выходу ripemd160 - ripemd (160-битные двоичные строки с использованием RIPEMD-160) ripemd160 или ripemd160_hex - ripemd (160-битные двоичные строки с использованием RIPEMD-160) sha1 - sha-1 (160-битные двоичные строки с использованием SHA-1) sha1 или sha1_hex - sha-1 (160-битные двоичные строки с использованием SHA-1) sha224 - sha-224 (224-битные двоичные строки с использованием SHA-2) sha224 или sha224_hex - sha-224 (224-битные двоичные строки с использованием SHA-2) sha256 - sha-256 (256-битные двоичные строки с использованием SHA-2) sha256 или sha256_hex - sha-256 (256-битные двоичные строки с использованием SHA-2) sha384 - sha-384 (384-битные двоичные строки с использованием SHA-2) sha384 или sha384_hex - sha-384 (384-битные двоичные строки с использованием SHA-2) sha512 - sha-512(512-битные двоичные строки с использованием SHA-2). sha512 или sha512_hex - sha-512(512-битные двоичные строки с использованием SHA-2). 