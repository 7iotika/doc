��    X      �              �     �    �  ]  �  �   3	  :   
  3   ?
  �  s
    .  �   4  �  �  `  j    �  �   �  �  �  %  �  5  �  H  �  h  2  �  �   �   ."  �  �"    :$  X  R%  �   �*  I   �+  0   �+  �   ,  W   �,  �   ;-  �   �-     .  n  �.  �   �/  /   �0  N   1  k  V1    �2  �   �3     �4  )   �4  S   �4  ,   )5  �   V5  {   6  �   �7  @  68  M   w9  �   �9     �:  t   �:  G   (;  H   p;  >   �;  ?   �;  �   8<  �   �<  �   �=  �   t>  .  2?  \   a@  �   �@  	   xA     �A     �A     �A     �A     �A     �A     �A     	B     B     %B     EB     RB     `B     lB     |B     �B     �B     �B     �B  ^  �B     -D     >D     RD     hD     |D  �  �D     (F  4  AF  �  vG  �   J  :   �J  3   &K    ZK    bP  �   hR  �  S  :  �T    �Y  �   �Z  �  �[  `  �]  @  6_  H  w`  h  �a  �  )c  �   �d  �  De    �f  �  �g  �   �n  I   �o  2   p  �   Jp  �   q  �   �q  �   �r  D   ns  �  �s  *  rv  �   �w  �   Sx  R  �x  �  Q{    3}  1   N~  F   �~  �   �~  L   j  Z  �  q  �    ��    ��  �   ��  �  ��  5   �  �   S�  �   .�  �   ��  o   G�  m   ��    %�  2  2�  �  e�  -  �  �  2�  �   ��    ��  	   ��     ��     Е     ��     ��     �     #�     8�     E�     T�     a�     ��     ��     ��     ��     ��     Ȗ     ߖ     �     ��  �  
�     ��     ��     ��     ՘     �   #!/usr/bin/env tarantool #!/usr/bin/env tarantool

-- Configure database
box.cfg {
    listen = 3313
}

box.once("bootstrap", function()
    box.schema.space.create('tweedledum')
    box.space.tweedledum:create_index('primary',
        { type = 'TREE', parts = {1, 'unsigned'}})
end)

require('console').start() #!/usr/bin/env tarantool

-- define class objects
local myclass_somemethod = function(self)
    print('test 1', self.data)
end

local myclass_someothermethod = function(self)
    print('test 2', self.data)
end

local myclass_tostring = function(self)
    return 'MyClass <'..self.data..'>'
end

local myclass_mt = {
    __tostring = myclass_tostring;
    __index = {
        somemethod = myclass_somemethod;
        someothermethod = myclass_someothermethod;
    }
}

-- create a new object of myclass
local object = setmetatable({ data = 'data'}, myclass_mt)
print(object:somemethod())
print(object.data) #!/usr/bin/env tarantool

array = { 'Apple', 'Orange', 'Grapefruit', 'Banana'}
for k, v in ipairs(array) do print(k, v) end

map = { k1 = 'v1', k2 = 'v2', k3 = 'v3' }
for k, v in pairs(map) do print(k, v) end #!/usr/bin/env tarantool

array = { 1, 2, 3}
print(#array) #!/usr/bin/env tarantool

collectgarbage('collect') #!/usr/bin/env tarantool

local ffi = require("ffi")
ffi.cdef[[
    unsigned long compressBound(unsigned long sourceLen);
    int compress2(uint8_t *dest, unsigned long *destLen,
    const uint8_t *source, unsigned long sourceLen, int level);
    int uncompress(uint8_t *dest, unsigned long *destLen,
    const uint8_t *source, unsigned long sourceLen);
]]
local zlib = ffi.load(ffi.os == "Windows" and "zlib1" or "z")

-- Lua wrapper for compress2()
local function compress(txt)
    local n = zlib.compressBound(#txt)
    local buf = ffi.new("uint8_t[?]", n)
    local buflen = ffi.new("unsigned long[1]", n)
    local res = zlib.compress2(buf, buflen, txt, #txt, 9)
    assert(res == 0)
    return ffi.string(buf, buflen[0])
end

-- Lua wrapper for uncompress
local function uncompress(comp, n)
    local buf = ffi.new("uint8_t[?]", n)
    local buflen = ffi.new("unsigned long[1]", n)
    local res = zlib.uncompress(buf, buflen, comp, #comp)
    assert(res == 0)
    return ffi.string(buf, buflen[0])
end

-- Simple test code.
local txt = string.rep("abcd", 1000)
print("Uncompressed size: ", #txt)
local c = compress(txt)
print("Compressed size: ", #c)
local txt2 = uncompress(c, #txt)
assert(txt2 == txt) #!/usr/bin/env tarantool

local ffi = require("ffi")
ffi.cdef[[
typedef struct { double x, y; } point_t;
]]

local point
local mt = {
  __add = function(a, b) return point(a.x+b.x, a.y+b.y) end,
  __len = function(a) return math.sqrt(a.x*a.x + a.y*a.y) end,
  __index = {
    area = function(a) return a.x*a.x + a.y*a.y end,
  },
}
point = ffi.metatype("point_t", mt)

local a = point(3, 4)
print(a.x, a.y)  --> 3  4
print(#a)        --> 5
print(a:area())  --> 25
local b = a + point(0.5, 8)
print(#b)        --> 12.5 #!/usr/bin/env tarantool

local ffi = require('ffi')
ffi.cdef[[
    int printf(const char *format, ...);
]]

ffi.C.printf("Hello, %s\n", os.getenv("USER")); #!/usr/bin/env tarantool

local ffi = require('ffi')
ffi.cdef[[
    typedef long time_t;
    typedef struct timeval {
    time_t tv_sec;
    time_t tv_usec;
} timeval;
    int gettimeofday(struct timeval *t, void *tzp);
]]

local timeval_buf = ffi.new("timeval")
local now = function()
    ffi.C.gettimeofday(timeval_buf, nil)
    return tonumber(timeval_buf.tv_sec * 1000 + (timeval_buf.tv_usec / 1000))
end #!/usr/bin/env tarantool

local fiber = require('fiber')
local function consumer_loop(ch, i)
    -- initialize consumer synchronously or raise an error()
    fiber.sleep(0) -- allow fiber.create() to continue
    while true do
        local data = ch:get()
        if data == nil then
            break
        end
        print('consumed', i, data)
        fiber.sleep(math.random()) -- simulate some work
    end
end

local function producer_loop(ch, i)
    -- initialize consumer synchronously or raise an error()
    fiber.sleep(0) -- allow fiber.create() to continue
    while true do
        local data = math.random()
        ch:put(data)
        print('produced', i, data)
    end
end

local function start()
    local consumer_n = 5
    local producer_n = 3

    -- Create a channel
    local ch_size = math.max(consumer_n, producer_n)
    local ch = fiber.channel(ch_size)

    -- Start consumers
    for i=1, consumer_n,1 do
        fiber.create(consumer_loop, ch, i)
    end

    -- Start producers
    for i=1, producer_n,1 do
        fiber.create(producer_loop, ch, i)
    end
end

start()
print('started') #!/usr/bin/env tarantool

local fio = require('fio')
local errno = require('errno')
local f = fio.open('/tmp/xxxx.txt', {'O_CREAT', 'O_WRONLY', 'O_APPEND'},
    tonumber('0666', 8))
if not f then
    error("Failed to open file: "..errno.strerror())
end
f:write("Hello\n");
f:close() #!/usr/bin/env tarantool

local fio = require('fio')
local errno = require('errno')
local f = fio.open('/tmp/xxxx.txt', {'O_RDONLY' })
if not f then
    error("Failed to open file: "..errno.strerror())
end
local data = f:read(4096)
f:close()
print(data) #!/usr/bin/env tarantool

local function handler(s, peer)
    s:write("Welcome to test server, " .. peer.host .."\n")
    while true do
        local line = s:read('\n')
        if line == nil then
            break -- error or eof
        end
        if not s:write("pong: "..line) then
            break -- error or eof
        end
    end
end

local server, addr = require('socket').tcp_server('localhost', 3311, handler) #!/usr/bin/env tarantool

local function handler(self)
    return self:render{ json = { ['Your-IP-Is'] = self.peer.host } }
end

local server = require('http.server').new(nil, 8080) -- listen *:8080
server:route({ path = '/' }, handler)
server:start()
-- connect to localhost:8080 and see json #!/usr/bin/env tarantool

local function handler(self)
local fruits = { 'Apple', 'Orange', 'Grapefruit', 'Banana'}
    return self:render{ fruits = fruits }
end

local server = require('http.server').new(nil, 8080) -- nil means '*'
server:route({ path = '/', file = 'index.html.lua' }, handler)
server:start() #!/usr/bin/env tarantool

local http_client = require('http.client')
local json = require('json')
local data = json.encode({ Key = 'Value'})
local headers = { Token = 'xxxx', ['X-Secret-Value'] = 42 }
local r = http_client.post('http://localhost:8081', data, { headers = headers})
if r.status == 200 then
    print 'Success'
end #!/usr/bin/env tarantool

local http_client = require('http.client')
local json = require('json')
local r = http_client.get('http://api.openweathermap.org/data/2.5/weather?q=Oakland,us')
if r.status ~= 200 then
    print('Failed to get weather forecast ', r.reason)
    return
end
local data = json.decode(r.body)
print('Oakland wind speed: ', data.wind.speed) #!/usr/bin/env tarantool

local json = require('json')
local t = {}
t[1] = 1; t[2] = json.NULL; t[3]= json.NULL;
t[4] = 4; t[5] = json.NULL; t[6]= json.NULL;
t[6] = 4; t[7] = json.NULL; t[8]= json.NULL;
t[9] = json.NULL
t[10] = 10
print(#t)
local counter = 0
for k,v in pairs(t) do counter = counter + 1 end
print(counter)
local max = 0
for k,v in pairs(t) do if k > max then max = k end end
print(max) #!/usr/bin/env tarantool

local map = { a = 10, b = 15, c = 20 }
local size = 0
for _ in pairs(map) do size = size + 1; end
print(size) #!/usr/bin/env tarantool

local s = require('socket').getaddrinfo('google.com', 'http', { type = 'SOCK_STREAM' })
print('host=',s[1].host)
print('family=',s[1].family)
print('type=',s[1].type)
print('protocol=',s[1].protocol)
print('port=',s[1].port)
print('host=',s[2].host)
print('family=',s[2].family)
print('type=',s[2].type)
print('protocol=',s[2].protocol)
print('port=',s[2].port) #!/usr/bin/env tarantool

local s = require('socket').tcp_connect('google.com', 80)
print(s:peer().host)
print(s:peer().family)
print(s:peer().type)
print(s:peer().protocol)
print(s:peer().port)
print(s:write("GET / HTTP/1.0\r\n\r\n"))
print(s:read('\r\n'))
print(s:read('\r\n')) #!/usr/bin/env tarantool

local socket = require('socket')
local errno = require('errno')
local fiber = require('fiber')

local function udp_server_loop(s, handler)
    fiber.name("udp_server")
    while true do
        -- try to read a datagram first
        local msg, peer = s:recvfrom()
        if msg == "" then
            -- socket was closed via s:close()
            break
        elseif msg ~= nil then
            -- got a new datagram
            handler(s, peer, msg)
        else
            if s:errno() == errno.EAGAIN or s:errno() == errno.EINTR then
                -- socket is not ready
                s:readable() -- yield, epoll will wake us when new data arrives
            else
                -- socket error
                local msg = s:error()
                s:close() -- save resources and don't wait GC
                error("Socket error: " .. msg)
            end
        end
    end
end

local function udp_server(host, port, handler)
    local s = socket('AF_INET', 'SOCK_DGRAM', 0)
    if not s then
        return nil -- check errno:strerror()
    end
    if not s:bind(host, port) then
        local e = s:errno() -- save errno
        s:close()
        errno(e) -- restore errno
        return nil -- check errno:strerror()
    end

    fiber.create(udp_server_loop, s, handler) -- start a new background fiber
    return s
end #!/usr/bin/env tarantool

local t = {}
t[1] = 1
t[4] = 4
t[10] = 10
print(#t)
local counter = 0
for k,v in pairs(t) do counter = counter + 1 end
print(counter)
local max = 0
for k,v in pairs(t) do if k > max then max = k end end
print(max) #!/usr/bin/env tarantool

local x = 1
local y = 2
x, y = y, x
print(x, y) #!/usr/bin/env tarantool

print('Hello, World!') <html>
<body>
    <table border="1">
        % for i,v in pairs(fruits) do
        <tr>
            <td><%= i %></td>
            <td><%= v %></td>
        </tr>
        % end
    </table>
</body>
</html> A function for a client that connects to this server could look something like this ... Activate the `Lua garbage collector <https://www.lua.org/manual/5.1/manual.html#2.10>`_ with the `collectgarbage function <https://www.lua.org/manual/5.1/manual.html#pdf-collectgarbage>`_. An "HTML" file for this server, including Lua, could look like this (it would produce "1 Apple | 2 Orange | 3 Grapefruit | 4 Banana"). Cookbook recipes Create Lua tables, and print them. Notice that for the 'array' table the iterator function is ipairs(), while for the 'map' table the iterator function is pairs(). (`ipairs()` is faster than `pairs()`, but pairs() is recommended for map-like tables or mixed tables.) The display will look like: "1 Apple | 2 Orange | 3 Grapefruit | 4 Banana | k3 v3 | k1 v1 | k2 v2". Create a class, create a metatable for the class, create an instance of the class. Another illustration is at `http://lua-users.org/wiki/LuaClassesWithMetatable <http://lua-users.org/wiki/LuaClassesWithMetatable>`_. Get the number of elements in a map-like table. Here are contributions of Lua programs for some frequent or tricky situations. Missing elements in arrays, which Lua treats as "nil"s, cause the simple "#" operator to deliver improper results. The "print(#t)" instruction will print "4"; the "print(counter)" instruction will print "3"; the "print(max)" instruction will print "10". Other table functions, such as :ref:`table.sort() <table-sort>`, will also misbehave when "nils" are present. Start one fiber for producer and one fiber for consumer. Use :ref:`fiber.channel() <fiber_ipc-channel>` to exchange data and synchronize. One can tweak the channel size (:code:`ch_size` in the program code) to control the number of simultaneous tasks waiting for processing. Tarantool does not currently have a `udp_server` function, therefore socket_udp_echo.lua is more complicated than socket_tcp_echo.lua. It can be implemented with sockets and fibers. The first line is a "hashbang": The standard example of a simple program. This runs  Tarantool Lua application server, which should be on the execution path. This section contains the following recipes: Use :ref:`box.once() <box-once>` to initialize a database (creating spaces) if this is the first time the server has been run. Then use :ref:`console.start() <console-start>` to start interactive mode. Use :ref:`socket.getaddrinfo() <socket-getaddrinfo>` to perform non-blocking DNS resolution, getting both the AF_INET6 and AF_INET information for 'google.com'. This technique is not always necessary for tcp connections because :ref:`socket.tcp_connect() <socket-tcp_connect>` performs `socket.getaddrinfo` under the hood, before trying to connect to the first available address. Use :ref:`socket.tcp_connect() <socket-tcp_connect>` to connect to a remote host via TCP. Display the connection details and the result of a GET request. Use :ref:`socket.tcp_connect() <socket-tcp_connect>` to set up a simple TCP server, by creating a function that handles requests and echos them, and passing the function to :ref:`socket.tcp_server() <socket-tcp_server>`. This program has been used to test with 100,000 clients, with each client getting a separate fiber. Use a Lua peculiarity to swap two variables without needing a third variable. Use explicit ``NULL`` values to avoid the problems caused by Lua's nil == missing value behavior. Although :code:`json.NULL == nil` is :code:`true`, all the print instructions in this program will print the correct value: 10. Use freely. Use the '#' operator to get the number of items in an array-like Lua table. This operation has O(log(N)) complexity. Use the :ref:`fio module <fio-module>` to open, read, and close a file. Use the :ref:`fio module <fio-module>` to open, write, and close a file. Use the :ref:`http module <http-module>` to get data via HTTP. Use the :ref:`http module <http-module>` to send data via HTTP. Use the `LuaJIT ffi library <http://luajit.org/ext_ffi.html>`_ to access a C object via a metamethod (a method which is defined with a metatable). Use the `LuaJIT ffi library <http://luajit.org/ext_ffi.html>`_ to call a C built-in function: printf(). (For help understanding ffi, see the `FFI tutorial <http://luajit.org/ext_ffi_tutorial.html>`_.) Use the `LuaJIT ffi library <http://luajit.org/ext_ffi.html>`_ to call a C function: gettimeofday(). This delivers time with millisecond precision, unlike the time function in Tarantool's :ref:`clock module <clock-module>`. Use the `LuaJIT ffi library <http://luajit.org/ext_ffi.html>`_ to call a C library function. (For help understanding ffi, see the `FFI tutorial <http://luajit.org/ext_ffi_tutorial.html>`_.) Use the `http`_ `rock` (which must first be installed) to generate HTML pages from templates. The `http`_ `rock`_ has a fairly simple template engine which allows execution of regular Lua code inside text blocks (like PHP). Therefore there is no need to learn new languages in order to write templates. Use the `http`_ `rock`_ (which must first be installed) to turn Tarantool into a web server. You can execute any of these programs by copying the code into a ``.lua`` file, and then entering :samp:`chmod +x ./{program-name}.lua` and :samp:`./{program-name}.lua` on the terminal. class.lua console_start.lua count_array.lua count_array_with_nils.lua count_array_with_nulls.lua count_map.lua ffi_gettimeofday.lua ffi_meta.lua ffi_printf.lua ffi_zlib.lua fiber_producer_and_consumer.lua fio_read.lua fio_write.lua garbage.lua getaddrinfo.lua hello_world.lua http_generate_html.lua http_get.lua http_send.lua http_server.lua local function handler(s, peer, msg)
    -- You don't have to wait until socket is ready to send UDP
    -- s:writable()
    s:sendto(peer.host, peer.port, "Pong: " .. msg)
end

local server = udp_server('127.0.0.1', 3548, handler)
if not server then
    error('Failed to bind: ' .. errno.strerror())
end

print('Started')

require('console').start() print_arrays.lua socket_tcp_echo.lua socket_tcpconnect.lua socket_udp_echo.lua swap.lua Project-Id-Version: Tarantool 1.10
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
 #!/usr/bin/env tarantool #!/usr/bin/env tarantool

-- Настроить базу данных
box.cfg {
    listen = 3313
}

box.once("bootstrap", function()
    box.schema.space.create('tweedledum')
    box.space.tweedledum:create_index('primary',
        { type = 'TREE', parts = {1, 'unsigned'}})
end)

require('console').start() #!/usr/bin/env tarantool

-- определить объекты класса
local myclass_somemethod = function(self)
    print('test 1', self.data)
end

local myclass_someothermethod = function(self)
    print('test 2', self.data)
end

local myclass_tostring = function(self)
    return 'MyClass <'..self.data..'>'
end

local myclass_mt = {
    __tostring = myclass_tostring;
    __index = {
        somemethod = myclass_somemethod;
        someothermethod = myclass_someothermethod;
    }
}

-- создать новый объект своего класса myclass
local object = setmetatable({ data = 'data'}, myclass_mt)
print(object:somemethod())
print(object.data) #!/usr/bin/env tarantool

array = { 'Apple', 'Orange', 'Grapefruit', 'Banana'}
for k, v in ipairs(array) do print(k, v) end

map = { k1 = 'v1', k2 = 'v2', k3 = 'v3' }
for k, v in pairs(map) do print(k, v) end #!/usr/bin/env tarantool

array = { 1, 2, 3}
print(#array) #!/usr/bin/env tarantool

collectgarbage('collect') #!/usr/bin/env tarantool

local ffi = require("ffi")
ffi.cdef[[
    unsigned long compressBound(unsigned long sourceLen);
    int compress2(uint8_t *dest, unsigned long *destLen,
    const uint8_t *source, unsigned long sourceLen, int level);
    int uncompress(uint8_t *dest, unsigned long *destLen,
    const uint8_t *source, unsigned long sourceLen);
]]
local zlib = ffi.load(ffi.os == "Windows" and "zlib1" or "z")

-- Надстройка Lua для функции compress2()
local function compress(txt)
    local n = zlib.compressBound(#txt)
    local buf = ffi.new("uint8_t[?]", n)
    local buflen = ffi.new("unsigned long[1]", n)
    local res = zlib.compress2(buf, buflen, txt, #txt, 9)
    assert(res == 0)
    return ffi.string(buf, buflen[0])
end

-- Надстройка Lua для функции uncompress
local function uncompress(comp, n)
    local buf = ffi.new("uint8_t[?]", n)
    local buflen = ffi.new("unsigned long[1]", n)
    local res = zlib.uncompress(buf, buflen, comp, #comp)
    assert(res == 0)
    return ffi.string(buf, buflen[0])
end

-- Простой код теста
local txt = string.rep("abcd", 1000)
print("Uncompressed size: ", #txt)
local c = compress(txt)
print("Compressed size: ", #c)
local txt2 = uncompress(c, #txt)
assert(txt2 == txt) #!/usr/bin/env tarantool

local ffi = require("ffi")
ffi.cdef[[
typedef struct { double x, y; } point_t;
]]

local point
local mt = {
  __add = function(a, b) return point(a.x+b.x, a.y+b.y) end,
  __len = function(a) return math.sqrt(a.x*a.x + a.y*a.y) end,
  __index = {
    area = function(a) return a.x*a.x + a.y*a.y end,
  },
}
point = ffi.metatype("point_t", mt)

local a = point(3, 4)
print(a.x, a.y)  --> 3  4
print(#a)        --> 5
print(a:area())  --> 25
local b = a + point(0.5, 8)
print(#b)        --> 12.5 #!/usr/bin/env tarantool

local ffi = require('ffi')
ffi.cdef[[
    int printf(const char *format, ...);
]]

ffi.C.printf("Hello, %s\n", os.getenv("USER")); #!/usr/bin/env tarantool

local ffi = require('ffi')
ffi.cdef[[
    typedef long time_t;
    typedef struct timeval {
    time_t tv_sec;
    time_t tv_usec;
} timeval;
    int gettimeofday(struct timeval *t, void *tzp);
]]

local timeval_buf = ffi.new("timeval")
local now = function()
    ffi.C.gettimeofday(timeval_buf, nil)
    return tonumber(timeval_buf.tv_sec * 1000 + (timeval_buf.tv_usec / 1000))
end #!/usr/bin/env tarantool

local fiber = require('fiber')
local function consumer_loop(ch, i)
    -- инициализировать потребитель синхронно или выдать ошибку()
    fiber.sleep(0) -- позволить fiber.create() продолжать
    while true do
        local data = ch:get()
        if data == nil then
            break
        end
        print('consumed', i, data)
        fiber.sleep(math.random()) -- моделировать работу
    end
end

local function producer_loop(ch, i)
    -- инициализировать потребитель синхронно или выдать ошибку()
    fiber.sleep(0) -- allow fiber.create() to continue
    while true do
        local data = math.random()
        ch:put(data)
        print('produced', i, data)
    end
end

local function start()
    local consumer_n = 5
    local producer_n = 3

    -- создать канал
    local ch_size = math.max(consumer_n, producer_n)
    local ch = fiber.channel(ch_size)

    -- запустить потребители
    for i=1, consumer_n,1 do
        fiber.create(consumer_loop, ch, i)
    end

    -- запустить производители
    for i=1, producer_n,1 do
        fiber.create(producer_loop, ch, i)
    end
end

start()
print('started') #!/usr/bin/env tarantool

local fio = require('fio')
local errno = require('errno')
local f = fio.open('/tmp/xxxx.txt', {'O_CREAT', 'O_WRONLY', 'O_APPEND'},
    tonumber('0666', 8))
if not f then
    error("Failed to open file: "..errno.strerror())
end
f:write("Hello\n");
f:close() #!/usr/bin/env tarantool

local fio = require('fio')
local errno = require('errno')
local f = fio.open('/tmp/xxxx.txt', {'O_RDONLY' })
if not f then
    error("Failed to open file: "..errno.strerror())
end
local data = f:read(4096)
f:close()
print(data) #!/usr/bin/env tarantool

local function handler(s, peer)
    s:write("Welcome to test server, " .. peer.host .."\n")
    while true do
        local line = s:read('\n')
        if line == nil then
            break -- ошибка или конец файла
        end
        if not s:write("pong: "..line) then
            break -- ошибка или конец файла
        end
    end
end

local server, addr = require('socket').tcp_server('localhost', 3311, handler) #!/usr/bin/env tarantool

local function handler(self)
    return self:render{ json = { ['Your-IP-Is'] = self.peer.host } }
end

local server = require('http.server').new(nil, 8080) -- анализировать связь с *:8080
server:route({ path = '/' }, handler)
server:start()
-- подключиться к localhost:8080 и читать JSON #!/usr/bin/env tarantool

local function handler(self)
local fruits = { 'Apple', 'Orange', 'Grapefruit', 'Banana'}
    return self:render{ fruits = fruits }
end

local server = require('http.server').new(nil, 8080) -- nil означает '*'
server:route({ path = '/', file = 'index.html.lua' }, handler)
server:start() #!/usr/bin/env tarantool

local http_client = require('http.client')
local json = require('json')
local data = json.encode({ Key = 'Value'})
local headers = { Token = 'xxxx', ['X-Secret-Value'] = 42 }
local r = http_client.post('http://localhost:8081', data, { headers = headers})
if r.status == 200 then
    print 'Success'
end #!/usr/bin/env tarantool

local http_client = require('http.client')
local json = require('json')
local r = http_client.get('http://api.openweathermap.org/data/2.5/weather?q=Oakland,us')
if r.status ~= 200 then
    print('Failed to get weather forecast ', r.reason)
    return
end
local data = json.decode(r.body)
print('Oakland wind speed: ', data.wind.speed) #!/usr/bin/env tarantool

local json = require('json')
local t = {}
t[1] = 1; t[2] = json.NULL; t[3]= json.NULL;
t[4] = 4; t[5] = json.NULL; t[6]= json.NULL;
t[6] = 4; t[7] = json.NULL; t[8]= json.NULL;
t[9] = json.NULL
t[10] = 10
print(#t)
local counter = 0
for k,v in pairs(t) do counter = counter + 1 end
print(counter)
local max = 0
for k,v in pairs(t) do if k > max then max = k end end
print(max) #!/usr/bin/env tarantool

local map = { a = 10, b = 15, c = 20 }
local size = 0
for _ in pairs(map) do size = size + 1; end
print(size) #!/usr/bin/env tarantool

local s = require('socket').getaddrinfo('google.com', 'http', { type = 'SOCK_STREAM' })
print('host=',s[1].host)
print('family=',s[1].family)
print('type=',s[1].type)
print('protocol=',s[1].protocol)
print('port=',s[1].port)
print('host=',s[2].host)
print('family=',s[2].family)
print('type=',s[2].type)
print('protocol=',s[2].protocol)
print('port=',s[2].port) #!/usr/bin/env tarantool

local s = require('socket').tcp_connect('google.com', 80)
print(s:peer().host)
print(s:peer().family)
print(s:peer().type)
print(s:peer().protocol)
print(s:peer().port)
print(s:write("GET / HTTP/1.0\r\n\r\n"))
print(s:read('\r\n'))
print(s:read('\r\n')) #!/usr/bin/env tarantool

local socket = require('socket')
local errno = require('errno')
local fiber = require('fiber')

local function udp_server_loop(s, handler)
    fiber.name("udp_server")
    while true do
        -- попытка прочитать сначала датаграмму
        local msg, peer = s:recvfrom()
        if msg == "" then
            -- сокет был закрыт с помощью s:close()
            break
        elseif msg ~= nil then
            -- получена новая датаграмма
            handler(s, peer, msg)
        else
            if s:errno() == errno.EAGAIN or s:errno() == errno.EINTR then
                -- сокет не готов
                s:readable() -- передача управления, epoll сообщит, когда будут новые данные
            else
                -- ошибка сокета
                local msg = s:error()
                s:close() -- сохранить ресурсы и не ждать сборку мусора
                error("Socket error: " .. msg)
            end
        end
    end
end

local function udp_server(host, port, handler)
    local s = socket('AF_INET', 'SOCK_DGRAM', 0)
    if not s then
        return nil -- проверить номер ошибки errno:strerror()
   end
    if not s:bind(host, port) then
        local e = s:errno() -- сохранить номер ошибки errno
        s:close()
        errno(e) -- восстановить номер ошибки errno
        return nil -- проверить номер ошибки errno:strerror()
    end

    fiber.create(udp_server_loop, s, handler) -- запустить новый файбер в фоновом режиме
    return s
end #!/usr/bin/env tarantool

local t = {}
t[1] = 1
t[4] = 4
t[10] = 10
print(#t)
local counter = 0
for k,v in pairs(t) do counter = counter + 1 end
print(counter)
local max = 0
for k,v in pairs(t) do if k > max then max = k end end
print(max) #!/usr/bin/env tarantool

local x = 1
local y = 2
x, y = y, x
print(x, y) #!/usr/bin/env tarantool
 
 print('Hello, World!') <html>
<body>
    <table border="1">
        % for i,v in pairs(fruits) do
        <tr>
            <td><%= i %></td>
            <td><%= v %></td>
        </tr>
        % end
    </table>
</body>
</html> Функция для клиента, который подключается к этому серверу, может выглядеть следующим образом: Запустите `сборщик мусора в Lua <https://www.lua.org/manual/5.1/manual.html#2.10>`_ с помощью `функции collectgarbage <https://www.lua.org/manual/5.1/manual.html#pdf- collectgarbage>`_. HTML-файл для этого сервера, включая Lua, может выглядеть следующим образом (он выведет "1 Apple | 2 Orange | 3 Grapefruit | 4 Banana"). Примеры и рекомендации по разработке Используйте, чтобы создать Lua-таблицы и вывести их. Следует отметить, что для таблицы типа массива (array) функция-итератор будет ipairs(), а для таблицы типа ассоциативного массива (map) функция-итератор -- pairs(). (`ipairs()` быстрее, чем `pairs()`, но pairs() рекомендуется для ассоциативных массивов или смешанных таблиц.) Результат будет выглядеть следующим образом: "1 Apple | 2 Orange | 3 Grapefruit | 4 Banana | k3 v3 | k1 v1 | k2  v2". Используется для создания класса, метатаблицы для класса, экземпляра класса. Другой пример можно найти в `http://lua-users.org/wiki/LuaClassesWithMetatable <http://lua-users.org/wiki/LuaClassesWithMetatable>`_. Программа используется для получения количества элементов в таблице типа ассоциативного массива. Ниже представлены дополнения в виде Lua-программ для часто встречающихся или сложных случаев. Отсутствующие элементы в массивах, которые Lua рассматривает как nil, заставляют простой оператор '#' выдавать неправильные результаты. Команда "print(#t)" выведет "4", команда "print(counter)" выведет "3", а команда "print(max)" -- "10". Другие табличные функции, такие как :ref:`table.sort() <table-sort>`, также сработают неправильно при наличии нулевых значений nil. Запустите один файбер для производителя и один файбер для потребителя. Используйте :ref:`fiber.channel() <fiber_ipc-channel>` для обмена данных и синхронизации. Можно настроить ширину канала (:code:`ch_size` в программном коде) для управления количеством одновременных задач к обработке. В данный момент в Tarantool нет функции `udp_server`, поэтому socket_udp_echo.lua -- более сложная программа, чем socket_tcp_echo.lua. Ее можно реализовать с помощью сокетов и файберов. Первая строка -- это шебанг: Стандартный пример простой программы. Он запускает сервер приложений Tarantool'а на языке Lua, который должен быть в пути выполнения. В этом разделе собраны следующие рецепты: Для инициализации базы данных (создания спейсов) используйте :ref:`box.once() <box-once>`, если сервер запускается впервые. Затем используйте :ref:`console.start() <console-start>`, чтобы запустить интерактивный режим. Используйте :ref:`socket.getaddrinfo() <socket-getaddrinfo>`, чтобы провести неблокирующее разрешение имен DNS, получая как AF_INET6, так и AF_INET информацию для 'google.com'. Данная техника не всегда необходима для TCP-соединений, поскольку :ref:`socket.tcp_connect() <socket-tcp_connect>` выполняет `socket.getaddrinfo` с точки зрения внутреннего устройства до попытки соединения с первым доступным адресом. Используйте :ref:`socket.tcp_connect() <socket-tcp_connect>` для подключения к удаленному серверу по TCP. Можно отобразить информацию о подключении и результат запроса GET. Используйте :ref:`socket.tcp_connect() <socket-tcp_connect>` для настройки простого TCP-сервера путем создания функции, которая обрабатывает запросы и отражает их, а затем передачи функции на :ref:`socket.tcp_server() <socket-tcp_server>`. Данная программа была протестирована на 100 000 клиентов, каждый из которых получил отдельный файбер. Программа использует особенность Lua менять местами две переменные без необходимости использования третьей переменной. Используйте явные значения``NULL``, чтобы избежать проблем, вызванных  nil в Lua == поведение с пропущенными значениями. Хотя :code:`json.NULL == nil` является :code:`true`, все команды вывода в данной программе выведут правильное значение: 10. Можно использовать свободно. Используйте оператор '#', чтобы получить количество элементов в Lua-таблице типа массива. У этой операции сложность O(log(N)). Используйте :ref:`Модуль fio <fio-module>`, чтобы открыть, прочитать и закрыть файл. Используйте :ref:`Модуль fio <fio-module>`, чтобы открыть, записать данные и закрыть файл. Используйте :ref:`Модуль HTTP <http-module>` для получения данных по HTTP. Используйте :ref:`Модуль HTTP <http-module>` для отправки данных по HTTP. Используйте `Библиотеку LuaJIT FFI <http://luajit.org/ext_ffi.html>`_, чтобы получить доступ к объекту в C с помощью метаметода (метод, который определен метатаблицей). Используйте `Библиотеку LuaJIT FFI <http://luajit.org/ext_ffi.html>`_, чтобы вызвать встроенную в C функцию: printf(). (Чтобы лучше понимать FFI, см. `Учебное пособие по FFI <http://luajit.org/ext_ffi_tutorial.html>`_.) Используйте `Библиотеку LuaJIT FFI <http://luajit.org/ext_ffi.html>`_, чтобы вызвать встроенную в C функцию: gettimeofday(). Она позволяет получить значение времени с точностью в миллисекундах, в отличие от функции времени в Tarantool'е :ref:`Модуль clock <clock-module>`. Используйте `Библиотеку LuaJIT FFI  <http://luajit.org/ext_ffi.html>`_, чтобы вызвать библиотечную функцию в C. (Чтобы лучше понимать FFI, см. `Учебное пособие по FFI <http://luajit.org/ext_ffi_tutorial.html>`_.) Используйте сторонний модуль `http`_ (который необходимо предварительно установить) для создания HTML-страниц из шаблонов. В `модуле <https://tarantool.io/ru/download/rocks>`_ `http`_ достаточно простой движок шаблонов, который позволяет выполнять регулярный код на Lua в текстовых блоках (как в PHP). Таким образом, нет необходимости в изучении новых языков, чтобы написать шаблоны. Используйте `сторонний модуль`_ `http`_  (который необходимо предварительно установить), чтобы превратить Tarantool в веб-сервер. Любую из этих программ можно выполнить, скопировав код в ``.lua-файл``, а затем выполнив в командной строке :samp:`chmod +x ./{имя-программы}.lua` и :samp :`./{имя-программы}.lua`. class.lua console_start.lua count_array.lua count_array_with_nils.lua count_array_with_nulls.lua count_map.lua ffi_gettimeofday.lua ffi_meta.lua ffi_printf.lua ffi_zlib.lua fiber_producer_and_consumer.lua fio_read.lua fio_write.lua garbage.lua getaddrinfo.lua hello_world.lua http_generate_html.lua http_get.lua http_send.lua http_server.lua local function handler(s, peer, msg)
    -- Необязательно ждать, пока сокет будет готов отправлять UDP
    -- s:writable()
    s:sendto(peer.host, peer.port, "Pong: " .. msg)
end

local server = udp_server('127.0.0.1', 3548, handler)
if not server then
    error('Failed to bind: ' .. errno.strerror())
end

print('Started')

require('console').start() print_arrays.lua socket_tcp_echo.lua socket_tcpconnect.lua socket_udp_echo.lua swap.lua 