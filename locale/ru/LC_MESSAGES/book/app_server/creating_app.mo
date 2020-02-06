��    {      �              �  *   �  �   �  �  z  �     T   �  �   2  �  �  ;  �  �   �     ]  �   ~  u    �   �    �  f  �  �      �   D   �"  �   +#  �   '$     �$  `   �$    M%     c&  �   |&  ?  0'  {  p(  �   �)     �*  �  �*     [,  �   b,  >   R-    �-  b   �.  #  �.  �   0  �   �0  +   �1  r   �1  f  e2     �4  �   �4  �   n5  R   C6  �   �6     P7  x   d7  3  �7  �   :  x  �:     =  �  *=  V  �?     
A      A     3A  -   SA  Y  �A     �B  "  �B  L   D  R   [D    �D  �  �E  �   tG  �   SH  4   �H  W  /I  �   �K  ?   BL  9   �L  �   �L  �   =M  �   N  �   
O  j   �O  u   cP  �  �P  9  �R  �   �T  i   �U  �   IV  �   �V  "   uW  P   �W  �   �W  �   kX  �   ]Y  �  +Z  i  \  8   }]    �]  �   �^  �   B_  �   �_  E   �`     �`  [   �a  �   Nb     *c  	  �c  �   �d  &   [e    �e     �g  >   �g  >   �g  l   4h  �  �h  �  xj  2  l  t  Oq     �u  /   �u  �  �u  �  �w    ey  �  �z  �  l|  `   �}  !   R~  �  t~  *   �  �   B�  �  Ā  m  e�  |   Ӆ  T  P�  �  ��  �  ��  �   7�  w  Ӑ  �   K�    �    ��  '  �  �  ,�    Ý  �  ۠     ��  �  )�  �  ʥ     n�  �   ~�  h  �  (   �  5  ��    ޫ  y  �  .  [�  %   ��  �  ��     ;�  o  J�  a   ��  �  �  �   ��  �  9�  l  ֹ  i  C�  E   ��  �   �  �  Ͻ     j�  �   q�  7  b�  �   ��  �  $�     ��    ��  I  ��  �  !�  C  ��  $   ��  �   �    ��     ��  5   �  $   9�  E   ^�  �  ��  .   -�  �  \�  �   S�  �   ��  �  f�  �  X�  h  .�  �   ��  _   ��  :  ��  i  0�  f   ��  a   �  
  c�  |  n�  x  ��  �  d�  �   ��  �   ��  A  ��  �  ��  `  M�  �   ��  4  `�    ��  N   ��  �       �  �  � D  X 5  � �  � ~   �
    �   * �   � �  � �   B �  � �   � �  � �   U �  S �   � 9   � w      � �   � u   W l   � �  : *   C  :! t  ~&    �* /   �* �  )+ �  �,   �.   �/ �  �1 `   �3 !   H4  $ docker-compose build
$ docker-compose up $ ls
game.lua  pokemon.lua
$ sudo apt-get install tarantool-gis
$ sudo apt-get install tarantool-avro-schema
$ tarantool game.lua $ tarantool game.lua
2017-01-09 20:19:24.605 [6282] main/101/game.lua C> version 1.7.3-43-gf5fa1e1
2017-01-09 20:19:24.605 [6282] main/101/game.lua C> log level 5
2017-01-09 20:19:24.605 [6282] main/101/game.lua I> mapping 1073741824 bytes for tuple arena...
2017-01-09 20:19:24.609 [6282] main/101/game.lua I> initializing an empty data directory
2017-01-09 20:19:24.634 [6282] snapshot/101/main I> saving snapshot `./00000000000000000000.snap.inprogress'
2017-01-09 20:19:24.635 [6282] snapshot/101/main I> done
2017-01-09 20:19:24.641 [6282] main/101/game.lua I> ready to accept requests
2017-01-09 20:19:24.786 [6282] main/101/game.lua I> Started
---
- {'id': 1, 'status': 'active', 'location': {'y': 2, 'x': 1}, 'name': 'Pikachu', 'chance': 99.1}
...

2017-01-09 20:19:24.789 [6282] main/101/game.lua I> Player 'Player1' caught 'Pikachu'
true
false
--- []
...

2017-01-09 20:19:24.789 [6282] main C> entering the event loop **map**, which is an array of pokémons with coordinates of respawn locations; in this version of the game, let a location be a rectangle identified with two points, upper-left and lower-right; **player**, which has an ID, a name, and coordinates of the player's location point; **pokémon**, which has the same fields as the player, plus a status (active/inactive, that is present on the map or not) and a catch probability (well, let's give our pokémons a chance to escape :-) ) -- create game object
start = function(self)
    -- create spaces and indexes
    box.once('init', function()
        box.schema.create_space('pokemons')
        box.space.pokemons:create_index(
            "primary", {type = 'hash', parts = {1, 'unsigned'}}
        )
        box.space.pokemons:create_index(
            "status", {type = "tree", parts = {2, 'str'}}
        )
    end)

    -- create models
    local ok_m, pokemon = avro.create(schema.pokemon)
    local ok_p, player = avro.create(schema.player)
    if ok_m and ok_p then
        -- compile models
        local ok_cm, compiled_pokemon = avro.compile(pokemon)
        local ok_cp, compiled_player = avro.compile(player)
        if ok_cm and ok_cp then
            -- start the game
            <...>
        else
            log.error('Schema compilation failed')
        end
    else
        log.info('Schema creation failed')
    end
    return false
end -- create game object
start = function(self)
    -- create spaces and indexes
    box.once('init', function()
       box.schema.create_space('pokemons')
       box.space.pokemons:create_index(
           "primary", {type = 'hash', parts = {1, 'unsigned'}}
       )
       box.space.pokemons:create_index(
           "status", {type = "tree", parts = {2, 'str'}}
       )
    end)

    -- create models
    local ok_m, pokemon = avro.create(schema.pokemon)
    local ok_p, player = avro.create(schema.player)
    if ok_m and ok_p then
        -- compile models
        local ok_cm, compiled_pokemon = avro.compile(pokemon)
        local ok_cp, compiled_player = avro.compile(player)
        if ok_cm and ok_cp then
            -- start the game
            self.pokemon_model = compiled_pokemon
            self.player_model = compiled_player
            self.respawn()
            log.info('Started')
            return true
         else
            log.error('Schema compilation failed')
         end
    else
        log.info('Schema creation failed')
    end
    return false
end -- event notification
notify = function(self, player, pokemon)
    log.info("Player '%s' caught '%s'", player.name, pokemon.name)
end -- load avro-schema module with require()
local avro = require('avro_schema')

-- create models
local ok_m, pokemon = avro.create(schema.pokemon)
local ok_p, player = avro.create(schema.player)
if ok_m and ok_p then
    -- compile models
    local ok_cm, compiled_pokemon = avro.compile(pokemon)
    local ok_cp, compiled_player = avro.compile(player)
    if ok_cm and ok_cp then
        -- start the game
        <...>
    else
        log.error('Schema compilation failed')
    end
else
    log.info('Schema creation failed')
end
return false -- loading the module
local mymodule = require('mymodule')

-- calling myfun() from within test() function
local test = function()
  mymodule.myfun()
end -- project locations
local m_pos = gis.Point(
    {pokemon.location.x, pokemon.location.y}, self.wgs84
):transform(self.nationalmap)
local p_pos = gis.Point(
    {player.location.x, player.location.y}, self.wgs84
):transform(self.nationalmap)

-- check catch distance condition
if p_pos:distance(m_pos) > self.catch_distance then
    return false
end
-- try to catch pokemon
local caught = math.random(100) >= 100 - pokemon.chance
if caught then
    -- update and notify on success
    box.space.pokemons:update(
        pokemon_id, {{'=', self.STATUS, self.state.CAUGHT}}
    )
    self:notify(player, pokemon)
end
return caught A **fiber** exists for executing instruction sequences but it is not a thread. The key difference is that threads use preemptive multitasking, while fibers use cooperative multitasking. This gives fibers the following two advantages over threads: A **module** (called "rock" in Lua) is an optional library which enhances Tarantool functionality. So, we can install our logic as a module in Tarantool and use it from any Tarantool application or module. Like applications, modules in Tarantool can be written in Lua (rocks), C or C++. A fiber has all the features of a Lua `coroutine <http://www.lua.org/pil/contents.html#9>`_ and all programming concepts that apply for Lua coroutines will apply for fibers as well. However, Tarantool has made some enhancements for fibers and has used fibers internally. So, although use of coroutines is possible and supported, use of fibers is recommended. A thing to remember here is that the ``require()`` directive takes load paths to Lua modules from the ``package.path`` variable. This is a semicolon-separated string, where a question mark is used to interpolate the module name. By default, this variable contains system-wide Lua paths and the working directory. But if we put our modules inside a specific folder (e.g. ``scripts/``), we need to add this folder to ``package.path`` before any calls to ``require()``: An easy way to configure and launch nginx would be to create a Docker container based on a `Docker image <https://hub.docker.com/r/tarantool/tarantool-nginx/>`_ with nginx and the upstream module already installed (see `http/Dockerfile <https://github.com/tarantool/pokemon/blob/1.9/http/Dockerfile>`_). We take a standard `nginx.conf <https://github.com/tarantool/pokemon/blob/1.9/http/nginx.conf>`_, where we define an upstream with our Tarantool backend running (this is another Docker container, see details below): And here's how we create and compile our entities at initialization: As for the map entity, it would be an overkill to introduce a schema for it, because we have only one map in the game, it has very few fields, and -- which is most important -- we use the map only inside our logic, never exposing it to external users. At initialization, we call ``avro-schema.create()`` that creates objects in memory for all schema entities, and ``compile()`` that generates flatten/unflatten methods for each entity. Avro schemas Besides, it would be convenient to have methods for working with Tarantool storage. For example: Better controllability. Threads often depend on the kernel's thread scheduler to preempt a busy thread and resume another thread, so preemption may occur unpredictably. Fibers yield themselves to run another fiber while executing, so yields are controlled by application logic. Bootstrapping a database Both these systems are listed in the EPSG Geodetic Parameter Registry, where each system has a unique number. In our code, we assign these listing numbers to respective variables: But wait! If we launch it as shown above -- ``self.respawn()`` -- the function will be executed only once, just like all the other methods. But we need to execute ``respawn()`` every 60 seconds. Creating a :ref:`fiber <fiber-module>` is the Tarantool way of making application logic work in the background at all times. By our gameplay, all caught pokémons are returned back to the map. We do this for all pokémons on the map every 60 seconds using ``respawn()`` method. We iterate through pokémons by status using Tarantool index iterator function :ref:`index:pairs <box_index-index_pairs>` and reset the statuses of all "caught" pokémons back to "active" using ``box.space.pokemons:update()``. Congratulations! Here's the end point of our walk-through. As further reading, see more about :ref:`installing <app_server-installing_module>` and :ref:`contributing <app_server-contributing_module>` a module. Creating an application Docker Compose builds and runs all the three containers: ``pserver`` (Tarantool backend), ``phttp`` (nginx) and ``pclient`` (demo client). You can see log messages from all these containers in the console, pclient saying that it made an HTTP request to create a pokémon, made two catch requests, requested the map (empty since the pokémon is caught and temporarily inactive) and exited: Fibers First thing, we validate the received player data against its :ref:`Avro schema <app_server-avro_schemas>`. And we check whether such a pokémon exists in our database and is displayed on the map (the pokémon must have the active status): First, what would be the best way to deliver our microservice? For each entity, we need to define a schema in `Apache Avro schema <https://en.wikipedia.org/wiki/Apache_Avro>`_ syntax, where we list the entity's fields with their names and `Avro data types <http://avro.apache.org/docs/current/spec.html#schema_primitive>`_. For example, here's a Lua application that uses ``myfun()`` function from ``mymodule.lua`` module: For our HTTP test, we create a third container based on the `official Tarantool 1.9 image <https://github.com/tarantool/docker>`_ (see `client/Dockerfile <https://github.com/tarantool/pokemon/blob/1.9/client/Dockerfile>`_) and set the container's default command to ``tarantool client.lua``. For our game logic, we need one more variable, ``catch_distance``, which defines how close a player must get to a pokémon before trying to catch it. Let's set the distance to 100 meters. For our microservice, a simple and convenient solution would be to put all methods in a Lua module (say ``pokemon.lua``) and to write a Lua application (say ``game.lua``) that initializes the gaming environment and starts the game loop. For readability, we introduce named fields: Further on, we just call flatten/unflatten methods for a respective entity on receiving/sending the entity's data. Further we walk you through key programming practices that will give you a good start in writing Lua applications for Tarantool. For an adventure, this is a story of implementing... a real microservice based on Tarantool! We implement a backend for a simplified version of `Pokémon Go <https://en.wikipedia.org/wiki/Pokémon_Go>`_, a location-based augmented reality game released in mid-2016. In this game, players use a mobile device's GPS capability to locate, capture, battle and train virtual monsters called "pokémon", who appear on the screen as if they were in the same real-world location as the player. GIS Great! We've discussed all programming practices used in our Lua module (see `pokemon.lua <https://github.com/tarantool/pokemon/blob/1.9/src/pokemon.lua>`_). Here we receive the player's coordinates and the target pokémon's ID number, and we need to answer whether the player has actually caught the pokémon or not (remember that each pokémon has a chance to escape). Here's what our schema definitions for the player and pokémon entities look like: Higher performance. Threads require more resources to preempt as they need to address the system kernel. Fibers are lighter and faster as they don't need to address the kernel to yield. ID = 1, STATUS = 2, In OOP terms, we can now regard local variables inside ``game`` as object fields, and local functions as object methods. In the real life, this microservice would work over HTTP. Let's add `nginx <https://nginx.org/en/>`_ web server to our environment and make a similar demo. But how do we make Tarantool methods callable via REST API? We use nginx with `Tarantool nginx upstream <https://github.com/tarantool/nginx_upstream_module>`_ module and create one more Lua script (`app.lua <https://github.com/tarantool/pokemon/blob/1.9/src/app.lua>`_) that exports three of our game methods -- ``add_pokemon()``, ``map()`` and ``catch()`` -- as REST endpoints of the nginx upstream module: In this manual, Lua examples use **local** variables. Use **global** variables with caution, since the module’s users may be unaware of them. Indeed, when Player1 makes its first REST call, the script doesn’t block. The fiber running ``catch()`` function on behalf of Player1 issues a non-blocking call to the operating system and yields control to the next fiber, which happens to be the fiber of Player2. Player2’s fiber does the same. When the network response is received, Player1's fiber is activated by Tarantool cooperative scheduler, and resumes its work. All Tarantool :ref:`modules <built_in_modules>` use non-blocking I/O and are integrated with Tarantool cooperative scheduler. For module developers, Tarantool provides an :ref:`API <index-c_api_reference>`. Index iterators Let's discuss game initialization. In ``start()`` method, we need to populate Tarantool spaces with pokémon data. Why not keep all game data in memory? Why use a database? The answer is: :ref:`persistence <index-box_persistence>`. Without a database, we risk losing data on power outage, for example. But if we store our data in an in-memory database, Tarantool takes care to persist it on disk whenever it's changed. This gives us one more benefit: quick startup in case of failure. Tarantool has a :ref:`smart algorithm <internals-recovery_process>` that quickly loads all data from disk into memory on startup, so the warm-up takes little time. Likewise, we put Tarantool server and all our game logic in a second Docker container based on the `official Tarantool 1.9 image <https://github.com/tarantool/docker>`_ (see `src/Dockerfile <https://github.com/tarantool/pokemon/blob/1.9/src/Dockerfile>`_) and set the container's default command to ``tarantool app.lua``. This is the backend. Logging Modules are good for two things: Modules, rocks and applications Next, we calculate the answer: caught or not. Next, we need methods to implement the game logic. To simulate object-oriented programming in our Lua code, let's store all Lua functions and shared variables in a single local variable (let's name it as ``game``). This will allow us to address functions or variables from within our module as ``self.func_name`` or ``self.var_name``. Like this: Non-blocking IO Notice the ``parts =`` argument in the index specification. The pokémon ID is the first field in a Tarantool tuple since it’s the first member of the respective Avro type. So does the pokémon status. The actual JSON document may have ID or status fields at any position of the JSON map. Now let's discuss ``catch()``, which is the main method in our gaming logic. Now let's get down to implementation details. In our game, we need three entities: Now let's prepare the test environment. As planned, we write a Lua application (see `game.lua <https://github.com/tarantool/pokemon/blob/1.9/game.lua>`_) to initialize Tarantool's database module, initialize our game, call the game loop and simulate a couple of player requests. Now we're ready to calculate the answer. We need to project the current location of both player (``p_pos``) and pokémon (``m_pos``) on the map, check whether the player is close enough to the pokémon (using ``catch_distance``), and calculate whether the player has caught the pokémon (here we generate some random value and let the pokémon escape if the random value happens to be less than 100 minus pokémon's chance value): One more helpful function that we used in ``start()`` was ``log.infо()`` from Tarantool :ref:`log <log-module>` module. We also need this function in ``notify()`` to add a record to the log file on every successful catch: See also reference on :ref:`Tarantool modules <built_in_modules>` and :ref:`C API <index-c_api_reference>`, and don't miss our :ref:`Lua cookbook recipes <cookbook>`. So, our game module will have the following methods: Tarantool starts and initializes the database. Then Tarantool executes the demo logic from ``game.lua``: adds a pokémon named Pikachu (its chance to be caught is very high, 99.1), displays the current map (it contains one active pokémon, Pikachu) and processes catch requests from two players. Player1 is located just near the lonely Pikachu pokémon and Player2 is located far away from it. As expected, the catch results in this output are "true" for Player1 and "false" for Player2. Finally, Tarantool displays the current map which is empty, because Pikachu is caught and temporarily inactive: Technically, a module is a file with source code that exports its functions in an API. For example, here is a Lua module named ``mymodule.lua`` that exports one function named ``myfun``: The complete implementation of ``start()`` now looks like this: The implementation of ``start()`` method looks like this: To enable/disable the use of undeclared global variables in your Lua code, use Tarantool's :ref:`strict <strict-module>` module. To keep things simple, we don't load any specific map, assuming that we deal with a world map. And we do not validate incoming coordinates, assuming again that all received locations are within the planet Earth. To launch our microservice, we put both ``pokemon.lua`` module and ``game.lua`` application in the current directory, install all external modules, and launch the Tarantool instance running our ``game.lua`` application (this example is for Ubuntu): To launch the function ``myfun()`` -- from another module, from a Lua application, or from Tarantool itself, -- we need to save this module as a file, then load this module with the ``require()`` directive and call the exported function. To make our game logic available to other developers and Lua applications, let's put it into a Lua module. To run this test locally, download our `pokemon <https://github.com/tarantool/pokemon>`_ project from GitHub and say: To stay within the walk-through format, let's narrow the original gameplay as follows. We have a map with pokémon spawn locations. Next, we have multiple players who can send catch-a-pokémon requests to the server (which runs our Tarantool microservice). The server replies whether the pokémon is caught or not, increases the player's pokémon counter if yes, and triggers the respawn-a-pokémon method that spawns a new pokémon at the same location in a while. To store JSON data as tuples, we will apply a savvy practice which reduces data footprint and ensures all stored documents are valid. We will use Tarantool module `avro-schema <https://github.com/tarantool/avro-schema>`_ which checks the schema of a JSON document and converts it to a Tarantool tuple. The tuple will contain only field values, and thus take a lot less space than the original document. In avro-schema terms, converting JSON documents to tuples is "flattening", and restoring the original documents is "unflattening". The usage is quite straightforward: To test the REST API, we create a new script (`client.lua <https://github.com/tarantool/pokemon/blob/1.9/client/client.lua>`_), which is similar to our ``game.lua`` application, but makes HTTP POST and GET requests rather than calling Lua functions: To work with geographical coordinates, we use Tarantool `gis <https://github.com/tarantool/gis>`_ module. We leave client-side applications outside the scope of this story. Yet we promise a mini-demo in the end to simulate real users and give us some fun. :-) We use default Tarantool :ref:`log settings <cfg_logging>`, so we'll see the log output in console when we launch our application in script mode. We use two geo-specific variables: We'll be using functions from Tarantool built-in :ref:`box <box-module>` module: We'll need these two methods primarily when initializing our game, but we can also call them later, for example to test our code. We'll store these entities as tuples in Tarantool spaces. But to deliver our backend application as a microservice, the good practice would be to send/receive our data in the universal JSON format, thus using Tarantool as a document storage. Well, performance or controllability are of little importance in our case. We'll launch ``respawn()`` in a fiber to make it work in the background all the time. To do so, we'll need to amend ``respawn()``: When you run this script, you’ll notice that both players have equal chances to make the first attempt at catching the pokémon. In a classical Lua script, a networked call blocks the script until it’s finished, so the first catch attempt can only be done by the player who entered the game first. In Tarantool, both players play concurrently, since all modules are integrated with Tarantool :ref:`cooperative multitasking <atomic-cooperative_multitasking>` and use non-blocking I/O. Yet fibers have some limitations as compared with threads, the main limitation being no multi-core mode. All fibers in an application belong to a single thread, so they all use the same CPU core as the parent thread. Meanwhile, this limitation is not really serious for Tarantool applications, because a typical bottleneck for Tarantool is the HDD, not the CPU. ``add_pokemon()`` to add a pokémon to the database, and ``box.schema.create_space('pokemons')`` to create a space named ``pokemon`` for storing information about pokémons (we don't create a similar space for players, because we intend to only send/receive player information via API calls, so we needn't store it); ``box.space.pokemons:create_index('primary', {type = 'hash', parts = {1, 'unsigned'}})`` to create a primary HASH index by pokémon ID; ``box.space.pokemons:create_index('status', {type = 'tree', parts = {2, 'str'}})`` to create a secondary TREE index by pokémon status. ``catch()`` to calculate whether the pokémon was caught (besides the coordinates of both the player and pokémon, this method will apply a probability factor, so not every pokémon within the player's reach will be caught); ``map()`` to populate the map with all pokémons stored in Tarantool. ``nationalmap``, which stands for the `US National Atlas Equal Area <https://epsg.io/2163>`_. This is a projected coordinates system based on WGS84. It gives us a zero base for location projection and allows positioning our players and pokémons in meters. ``notify()`` to log information about caught pokémons (like "Player 1 caught pokémon A"); ``respawn()`` to add missing pokémons to the map, say, every 60 seconds (we assume that a frightened pokémon runs away, so we remove a pokémon from the map on any catch attempt and add it back to the map in a while); ``start()`` to initialize the game (it will create database spaces, create and compile avro schemas, and launch ``respawn()``). ``wgs84``, which stands for the latest revision of the World Geodetic System standard, `WGS84 <https://en.wikipedia.org/wiki/World_Geodetic_System#WGS84>`_. Basically, it comprises a standard coordinate system for the Earth and represents the Earth as an ellipsoid. and add some Tarantool-specific parameters (see descriptions in the upstream module's `README <https://github.com/tarantool/nginx_upstream_module#directives>`_ file): and call it as a fiber in ``start()``: catch = function(self, pokemon_id, player)
    -- check player data
    local ok, tuple = self.player_model.flatten(player)
    if not ok then
        return false
    end
    -- get pokemon data
    local p_tuple = box.space.pokemons:get(pokemon_id)
    if p_tuple == nil then
        return false
    end
    local ok, pokemon = self.pokemon_model.unflatten(p_tuple)
    if not ok then
        return false
    end
    if pokemon.status ~= self.state.ACTIVE then
        return false
    end
    -- more catch logic to follow
    <...>
end catch_distance = 100, easier **code management** (reuse, packaging, versioning), and hot **code reload** without restarting the Tarantool instance. local exports = {}
exports.myfun = function(input_string)
   print('Hello', input_string)
end
return exports local game = require('pokemon')
box.cfg{listen=3301}
game:start()

-- add, map and catch functions exposed to REST API
function add(request, pokemon)
    return {
        result=game:add_pokemon(pokemon)
    }
end

function map(request)
    return {
        map=game:map()
    }
end

function catch(request, pid, player)
    local id = tonumber(pid)
    if id == nil then
        return {result=false}
    end
    return {
        result=game:catch(id, player)
    }
end local game = {
    -- a local variable
    num_players = 0,

    -- a method that prints a local variable
    hello = function(self)
      print('Hello! Your player number is ' .. self.num_players .. '.')
    end,

    -- a method that calls another method and returns a local variable
    sign_in = function(self)
      self.num_players = self.num_players + 1
      self:hello()
      return self.num_players
    end
} local http = require('curl').http()
local json = require('json')
local URI = os.getenv('SERVER_URI')
local fiber = require('fiber')

local player1 = {
    name="Player1",
    id=1,
    location = {
        x=1.0001,
        y=2.0003
    }
}
local player2 = {
    name="Player2",
    id=2,
    location = {
        x=30.123,
        y=40.456
    }
}

local pokemon = {
    name="Pikachu",
    chance=99.1,
    id=1,
    status="active",
    location = {
        x=1,
        y=2
    }
}

function request(method, body, id)
    local resp = http:request(
        method, URI, body
    )
    if id ~= nil then
        print(string.format('Player %d result: %s',
            id, resp.body))
    else
        print(resp.body)
    end
end

local players = {}
function catch(player)
    fiber.sleep(math.random(5))
    print('Catch pokemon by player ' .. tostring(player.id))
    request(
        'POST', '{"method": "catch",
        "params": [1, '..json.encode(player)..']}',
        tostring(player.id)
    )
    table.insert(players, player.id)
end

print('Create pokemon')
request('POST', '{"method": "add",
    "params": ['..json.encode(pokemon)..']}')
request('GET', '')

fiber.create(catch, player1)
fiber.create(catch, player2)

-- wait for players
while #players ~= 2 do
    fiber.sleep(0.001)
end

request('GET', '')
os.exit() local schema = {
    player = {
        type="record",
        name="player_schema",
        fields={
            {name="id", type="long"},
            {name="name", type="string"},
            {
                name="location",
                type= {
                    type="record",
                    name="player_location",
                    fields={
                        {name="x", type="double"},
                        {name="y", type="double"}
                    }
                }
            }
        }
    },
    pokemon = {
        type="record",
        name="pokemon_schema",
        fields={
            {name="id", type="long"},
            {name="status", type="string"},
            {name="name", type="string"},
            {name="chance", type="double"},
            {
                name="location",
                type= {
                    type="record",
                    name="pokemon_location",
                    fields={
                        {name="x", type="double"},
                        {name="y", type="double"}
                    }
                }
            }
        }
    }
} nginx package.path = 'scripts/?.lua;' .. package.path pclient_1  | Create pokemon
<...>
pclient_1  | {"result":true}
pclient_1  | {"map":[{"id":1,"status":"active","location":{"y":2,"x":1},"name":"Pikachu","chance":99.100000}]}
pclient_1  | Catch pokemon by player 2
pclient_1  | Catch pokemon by player 1
pclient_1  | Player 1 result: {"result":true}
pclient_1  | Player 2 result: {"result":false}
pclient_1  | {"map":[]}
pokemon_pclient_1 exited with code 0 respawn = function(self)
    -- let's give our fiber a name;
    -- this will produce neat output in fiber.info()
    fiber.name('Respawn fiber')
    while true do
        for _, tuple in box.space.pokemons.index.status:pairs(
                self.state.CAUGHT) do
            box.space.pokemons:update(
                tuple[self.ID],
                {{'=', self.STATUS, self.state.ACTIVE}}
            )
        end
        fiber.sleep(self.respawn_time)
    end
end respawn = function(self)
    fiber.name('Respawn fiber')
    for _, tuple in box.space.pokemons.index.status:pairs(
           self.state.CAUGHT) do
        box.space.pokemons:update(
            tuple[self.ID],
            {{'=', self.STATUS, self.state.ACTIVE}}
        )
    end
 end server {
  server_name tnt_test;

  listen 80 default deferred reuseport so_keepalive=on backlog=65535;

  location = / {
      root /usr/local/nginx/html;
  }

  location /api {
    # answers check infinity timeout
    tnt_read_timeout 60m;
    if ( $request_method = GET ) {
       tnt_method "map";
    }
    tnt_http_rest_methods get;
    tnt_http_methods all;
    tnt_multireturn_skip_count 2;
    tnt_pure_result on;
    tnt_pass_http_request on parse_args;
    tnt_pass tnt;
  }
} start = function(self)
    -- create spaces and indexes
        <...>
    -- create models
        <...>
    -- compile models
        <...>
    -- start the game
       self.pokemon_model = compiled_pokemon
       self.player_model = compiled_player
       fiber.create(self.respawn, self)
       log.info('Started')
    -- errors if schema creation or compilation fails
       <...>
end upstream tnt {
      server pserver:3301 max_fails=1 fail_timeout=60s;
      keepalive 250000;
} wgs84 = 4326,
nationalmap = 2163, Project-Id-Version: Tarantool 1.10
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
 $ docker-compose build
$ docker-compose up $ ls
game.lua  pokemon.lua
$ sudo apt-get install tarantool-gis
$ sudo apt-get install tarantool-avro-schema
$ tarantool game.lua $ tarantool game.lua
2017-01-09 20:19:24.605 [6282] main/101/game.lua C> version 1.7.3-43-gf5fa1e1
2017-01-09 20:19:24.605 [6282] main/101/game.lua C> log level 5
2017-01-09 20:19:24.605 [6282] main/101/game.lua I> mapping 1073741824 bytes for tuple arena...
2017-01-09 20:19:24.609 [6282] main/101/game.lua I> initializing an empty data directory
2017-01-09 20:19:24.634 [6282] snapshot/101/main I> saving snapshot `./00000000000000000000.snap.inprogress'
2017-01-09 20:19:24.635 [6282] snapshot/101/main I> done
2017-01-09 20:19:24.641 [6282] main/101/game.lua I> ready to accept requests
2017-01-09 20:19:24.786 [6282] main/101/game.lua I> Started
---
- {'id': 1, 'status': 'active', 'location': {'y': 2, 'x': 1}, 'name': 'Pikachu', 'chance': 99.1}
...

2017-01-09 20:19:24.789 [6282] main/101/game.lua I> Player 'Player1' caught 'Pikachu'
true
false
--- []
...

2017-01-09 20:19:24.789 [6282] main C> entering the event loop **карта**, которая представляет собой массив покемонов с координатами мест респауна; в данной версии игры пусть местом будет прямоугольник, установленный по двум точкам, верхней левой и нижней правой; **игрок**, у которого есть ID, имя и координаты местонахождения игрока; **покемон**, у которого такие же поля, как и у игрока, плюс статус (активный/неактивный, то есть находится ли на карте) и возможность поимки (давайте уж дадим нашим покемонам шанс сбежать :-) ) -- создать игровой объект
start = function(self)
    -- создать спейсы и индексы
    box.once('init', function()
        box.schema.create_space('pokemons')
        box.space.pokemons:create_index(
            "primary", {type = 'hash', parts = {1, 'unsigned'}}
        )
        box.space.pokemons:create_index(
            "status", {type = "tree", parts = {2, 'str'}}
        )
    end)

    -- создать модели
    local ok_m, pokemon = avro.create(schema.pokemon)
    local ok_p, player = avro.create(schema.player)
    if ok_m and ok_p then
        -- скомпилировать модели
        local ok_cm, compiled_pokemon = avro.compile(pokemon)
        local ok_cp, compiled_player = avro.compile(player)
        if ok_cm and ok_cp then
            -- начать игру
            <...>
        else
            log.error('Schema compilation failed')
        end
    else
        log.info('Schema creation failed')
    end
    return false
end -- создать игровой объект
start = function(self)
    -- создать спейсы и индексы
    box.once('init', function()
       box.schema.create_space('pokemons')
       box.space.pokemons:create_index(
           "primary", {type = 'hash', parts = {1, 'unsigned'}}
       )
       box.space.pokemons:create_index(
           "status", {type = "tree", parts = {2, 'str'}}
       )
    end)

    -- создать модели
    local ok_m, pokemon = avro.create(schema.pokemon)
    local ok_p, player = avro.create(schema.player)
    if ok_m and ok_p then
        -- скомпилировать модели
        local ok_cm, compiled_pokemon = avro.compile(pokemon)
        local ok_cp, compiled_player = avro.compile(player)
        if ok_cm and ok_cp then
            -- начать игру
            self.pokemon_model = compiled_pokemon
            self.player_model = compiled_player
            self.respawn()
            log.info('Started')
            return true
         else
            log.error('Schema compilation failed')
         end
    else
        log.info('Schema creation failed')
    end
    return false
end -- уведомление о событии
notify = function(self, player, pokemon)
    log.info("Player '%s' caught '%s'", player.name, pokemon.name)
end -- загрузить модуль avro-schema с директивой require()
local avro = require('avro_schema')

-- создать модели
local ok_m, pokemon = avro.create(schema.pokemon)
local ok_p, player = avro.create(schema.player)
if ok_m and ok_p then
    -- скомпилировать модели
    local ok_cm, compiled_pokemon = avro.compile(pokemon)
    local ok_cp, compiled_player = avro.compile(player)
    if ok_cm and ok_cp then
        -- начать игру
        <...>
    else
        log.error('Schema compilation failed')
    end
else
    log.info('Schema creation failed')
end
return false -- загрузка модуля
local mymodule = require('mymodule')

-- вызов myfun() из функции test
local test = function()
  mymodule.myfun()
end -- спроецировать местоположение
 local m_pos = gis.Point(
     {pokemon.location.x, pokemon.location.y}, self.wgs84
 ):transform(self.nationalmap)
 local p_pos = gis.Point(
     {player.location.x, player.location.y}, self.wgs84
 ):transform(self.nationalmap)
 
 -- проверить условие близости игрока
 if p_pos:distance(m_pos) > self.catch_distance then
     return false
 end
 -- попытаться поймать покемона
 local caught = math.random(100) >= 100 - pokemon.chance
 if caught then
     -- обновить и сообщить об успехе
     box.space.pokemons:update(
         pokemon_id, {{'=', self.STATUS, self.state.CAUGHT}}
     )
     self:notify(player, pokemon)
 end
 return caught **Файбер** предназначен для выполнения последовательностей команд, но это не поток. Ключевое отличие в том, что потоки используют многозадачность с реализацией приоритетов, тогда как файберы используют кооперативную многозадачность. Это дает файберам два преимущества над потоками: **Модуль** (который называется "rock" в Lua) -- это дополнительная библиотека, которая расширяет функции Tarantool'а. Поэтому можно установить нашу логическую схему в виде модуля в Tarantool и использовать ее из любого Tarantool-приложения или модуля. Как и приложения, модули в Tarantool'е могут быть написаны на Lua (rocks), C или C++. У файбера есть все возможности `сопрограммы <http://www.lua.org/pil/contents.html#9>`_ на языке Lua, и все принципы программирования, которые применяются к сопрограммам на Lua, применимы и к файберам. Однако Tarantool расширил возможности файберов для внутреннего использования. Поэтому, несмотря на возможность и поддержку использования сопрограмм, рекомендуется использовать файберы. Здесь важно запомнить, что директива ``require()`` берет пути загрузки к Lua-модулям из переменной ``package.path``. Она представляет собой строку с разделителями в виде точки с запятой, где знак вопроса используется для вставки имени модуля. По умолчанию, эта переменная содержит пути в системе и рабочую директорию. Но если мы поместим наши модули в особую папку (например, ``scripts/``), необходимо будет добавить эту папку в ``package.path`` до вызова ``require()``: Чтобы с легкостью настроить и запустить nginx, необходимо создать Docker-контейнер на основе `Docker-образа <https://hub.docker.com/r/tarantool /tarantool-nginx/>`_ с уже установленными nginx и модулем upstream (см. `http/Dockerfile <https://github.com/tarantool/pokemon/blob/1.9/http/Dockerfile>`_). Берем стандартный `nginx.conf <https://github.com/tarantool/pokemon/blob/1.9/http/nginx.conf>`_, где определяем upstream с работающим бэкендом Tarantool'а (это еще один Docker-контейнер, см. нижеприведенную информацию): А вот как мы создадим и скомпилируем наши сущности при инициализации: Что касается сущности карты, вводить для нее схему будет перебор, потому что в игре всего одна карта, у нее мало полей, и -- что самое главное -- мы используем карту только внутри нашей логики, не показывая ее внешним пользователям. При инициализации мы вызываем функцию ``avro-schema.create()``, которая создает объекты в памяти для всех сущностей схемы, а также функцию ``compile()``, которая создает методы flatten/unflatten (конвертация в плоские файлы и обратно) для каждой сущности. Avro-схемы Кроме того, было бы удобно завести методы для работы с хранилищем Tarantool'а. Например: Улучшенная управляемость. Потоки часто зависят от планировщика потока ядра в вопросе вытеснения занятого потока и возобновления другого потока, поэтому вытеснение может быть непредвиденным. Файберы передают управление самостоятельно другому файберу во время работы, поэтому управление файберами осуществляется логикой приложения. Настройка базы данных Обе системы указаны в Реестре геодезических параметров EPSG, где каждой системе присвоен уникальный номер. Мы назначим эти числа соответствующим переменным в нашем коде: Но подождите! Если мы запустим функцию ``self.respawn()``, как показано выше, то она запустится только один раз, как и остальные методы. А нам необходимо запускать ``respawn()`` каждые 60 секунд. Tarantool заставляет логику приложения непрерывно работать в фоновом режиме с помощью :ref:`файбера <fiber-module>`. По сюжету игры все пойманные покемоны возвращаются на карту. Метод ``respawn()`` обеспечивает это для всех покемонов на карте каждые 60 секунд. Мы выполняем перебор покемонов по статусу с помощью функции Tarantool'а итератора с индексом :ref:`index:pairs <box_index-index_pairs>` и сбрасываем статусы всех "пойманных" покемонов обратно на "активный" с помощью ``box.space.pokemons:update()``. Поздравляем! Вот мы и закончили наш пошаговый пример. Для дальнейшего изучения рекомендуем :ref:`установку <app_server-installing_module>` и :ref:`добавление <app_server-contributing_module>` модуля. Создание приложения Docker Compose собирает и запускает все три контейнера: ``pserver`` (бэкенд Tarantool'а), ``phttp`` (nginx) и``pclient`` (демо-клиент). ВЫ можете увидеть все сообщения журнала из всех этих контейнеров в консоли. pclient выведет, что сделал HTTP-запрос на создание покемона, два запроса на поимку покемона, запросил карту (пустая, поскольку покемон пойман и временно неактивен) и завершил работу: Файберы Для начала проверим полученные данные об игроке по :ref:`Avro-схеме <app_server-avro_schemas>`. Также проверим, есть ли такой покемон в базе данных, и отображается ли он на карте (у покемона должен быть активный статус): Для начала как лучше всего предоставить микросервис? Для каждой сущности необходимо определить схему в синтаксисе `схемы Apache Avro <https://en.wikipedia.org/wiki/Apache_Avro>`_, где мы перечисляем поля сущности с их наименованиями и `типами данных по Avro <http://avro.apache.org/docs/current/spec.html#schema_primitive>`_. Например, вот Lua-приложение, которое использует функцию ``myfun()`` из модуля ``mymodule.lua``: Для HTTP-теста создадим третий контейнер на основе `официального образа Tarantool'а 1.9 <https://github.com/tarantool/docker>`_ (см. `client/Dockerfile <https://github.com/tarantool/pokemon/blob/1.9/client/Dockerfile>`_)  установим ``tarantool client.lua`` в качестве стандартной команды для контейнера. Для игровой логики необходима еще одна переменная ``catch_distance``, которая определяет, насколько близко игрок должен подойти к покемону, чтобы попытаться поймать его. Определим это расстояние в 100 метров. Для нашего микросервиса простым и удобным решением будет разместить все методы в Lua-модуле (скажем, ``pokemon.lua``) и написать Lua-приложение (скажем, ``game.lua``), которое запустит игровое окружение и цикл игры. Для удобства введем именованные поля: Далее мы просто вызываем методы flatten/unflatten для соответствующей сущности при получении/отправке данных об этой сущности. Далее мы пошагово разберем ключевые методики программирования, что послужит хорошим началом для написания Lua-приложений для Tarantool'а. Для интереса возьмем историю реализации... настоящего микросервиса на основе Tarantool'а! Мы реализуем бэкенд для упрощенной версии `Pokémon Go  <https://ru.wikipedia.org/wiki/Pok%C3%A9mon_Go>`_, игры на основе определения местоположения дополненной реальности, выпущенной в середине 2016 года. В этой игре игроки используют GPS-возможности мобильных устройств, чтобы находить, захватывать, сражаться и тренировать виртуальных существ, или покемонов, которые появляются на экране, как если бы они находились в том же реальном месте, как и игрок. ГИС Отлично! Мы обсудили все методики программирования, используемые в нашем  Lua-модуле (см. `pokemon.lua <https://github.com/tarantool/pokemon/blob/1.9/src/pokemon.lua>`_). Здесь мы получаем координаты игрока и номер ID искомого покемона, а нужен нам ответ на вопрос, поймали ли игрок покемона (помните, что у каждого покемона есть шанс убежать). Вот как будут выглядеть определения схемы для сущностей игрока и покемона: Повышенная производительность. Потокам необходимо больше ресурсов для вытеснения, поскольку они обращаются к ядру системы. Файберы легче и быстрее, поскольку для передачи управления им не нужно обращаться к ядру. ID = 1, STATUS = 2, В терминах ООП сейчас мы можем рассматривать внутренние переменные внутри переменной ``game`` как поля объекта, а внутренние функции -- как методы объекта. В реальной жизни такой микросервис работал бы по HTTP. Добавим веб-сервер `nginx <https://nginx.org/en/>`_ в нашу среду и сделаем аналогичный пример. Но как вызывать методы Tarantool'а с помощью REST API? Мы используем nginx с модулем `Tarantool nginx upstream <https://github.com/tarantool/nginx_upstream_module>`_ и создадим еще один скрипт на Lua (`app.lua <https://github.com/tarantool/pokemon/blob/1.9/src/app.lua>`_), который экспортирует три наших игровых метода -- ``add_pokemon()``, ``map()`` и ``catch()`` -- в качестве конечных точек обработки запросов REST модуля nginx upstream: Обратите внимание, что в текущей документации в примерах Lua-кода используются *локальные* переменные. Используйте *глобальные* переменные аккуратно, поскольку пользователи ваших модулей могут не знать об этих переменных. Действительно, когда Player1 посылает первый REST-вызов, скрипт не блокируется. Файбер, выполняющий функцию ``catch()`` от Player1, посылает неблокирующий вызов в операционную систему и передает управление на следующий файбер, которым оказывается файбер от Player2. Файбер от Player2 делает то же самое. Когда получен сетевой ответ, файбер от Player1 активируется  с помощью кооперативного планировщика Tarantool'а и возобновляет работу. Все :ref:`модули <built_in_modules>` Tarantool'а используют неблокирующий ввод-вывод и интегрированы с кооперативным планировщиком Tarantool'а. Разработчикам модулей Tarantool предоставляет :ref:`API <index-c_api_reference>`. Итератор с индексом Обсудим инициализацию игры. В методе ``start()`` нам нужно заполнить спейсы Tarantool'а данными о покемонах. Почему бы не хранить все игровые данные в памяти? Зачем нужна база данных? Ответ на это: :ref:`персистентность <index-box_persistence>`. Без базы данных мы рискуем потерять данные при отключении электроэнергии, например. Но если мы храним данные в in-memory базе данных, Tarantool позаботится о том, чтобы обеспечить постоянное хранение данных при их изменении. Это дает дополнительное преимущество: быстрая загрузка в случае отказа. :ref:`Умный алгоритм <internals-recovery_process>` Tarantool'а быстро загружает все данные с диска в память при начале работы, так что подготовка к работе не займет много времени. Аналогичным образом, поместим Tarantool-сервер и всю игровую логику в другой Docker-контейнер на основе `официального образа Tarantool'а 1.9 <https://github.com/tarantool/docker>`_ (см. `src/Dockerfile <https://github.com/tarantool/pokemon/blob/1.9/src/Dockerfile>`_) и установим ``tarantool app.lua`` в качестве стандартной команды для контейнера. Это бэкенд. Запись в журнал Модули хороши для двух целей: Модули и приложения Далее вычисляем ответ: пойман или нет. Далее нам нужны методы для реализации игровой логики. Чтобы смоделировать объектно-ориентированное программирование в нашем Lua-коде, будем хранить все Lua-функции и общие переменные в одной внутренней переменной (назовем ее ``game``). Это позволит нам обращаться к функциям или переменным из нашего модуля с помощью ``self.func_name`` или ``self.var_name`` следующим образом: Неблокирующий ввод-вывод Обратите внимание на аргумент ``parts =`` в спецификации индекса. ID покемона -- это первое поле в кортеже Tarantool'а, потому что это первый элемент соответствующего типа Avro. То же относится к статусу покемона. В самом JSON-файле поля ID или статуса могут быть в любом положении на JSON-карте. Теперь обсудим метод ``catch()``, который является основным в логике нашей игры. Теперь приступим к деталям реализации. В игре нам необходимы три сущности: Теперь подготовим среду тестирования. Как и планировалось, напишем приложение на языке Lua (см. `game.lua <https://github.com/tarantool/pokemon/blob/1.9/game.lua>`_), чтобы инициализировать модуль базы данных Tarantool'а, инициализировать нашу игру, вызвать цикл игры и смоделировать пару запросов от игроков. Теперь можно рассчитать ответ. Необходимо спроецировать текущее местоположение как игрока (``p_pos``), так и покемона (``m_pos``) на карте, проверить, достаточно ли близко к покемону находится игрок (с помощью ``catch_distance``), и рассчитать, поймал ли игрок покемона (здесь мы генерируем случайное значение, и покемон убегает, если случайное значение оказывается меньше, чем 100 минус случайная величина покемона): В  ``start()`` мы использовали еще одну полезную функцию -- ``log.infо()`` из :ref:`модуля log <log-module>` Tarantool'а . Эта функция также понадобится в ``notify()`` для добавления записи в файл журнала при каждой успешной поимке: См. также справочник по :ref:`модулям Tarantool'а <built_in_modules>` и :ref:`C API <index-c_api_reference>` и не пропустите наши :ref:`рекомендации по разработке на Lua <cookbook>`. Таким образом, в модуле игры будут следующие методы: Tarantool запускает и инициализирует базу данных. Затем Tarantool выполняет демо-логику из ``game.lua``: добавляет покемона под названием Пикачу (Pikachu) (шанс его поимки очень высок -- 99,1), отображает текущую карту (на ней расположен один активный покемон, Пикачу) и обрабатывает запросы поимки от двух игроков. Player1 (Игрок 1) находится очень близко к одинокому покемону Пикачу, а Player2 (Игрок 2) находится очень далеко от него. Как предполагается, результаты поимки в таком выводе будут "true" для Player1 и "false" для Player2. Наконец, Tarantool отображает текущую карту, которая пуста, потому что Пикачу пойман и временно неактивен: В техническом смысле, модуль - это файл с исходным кодом, который экспортирует свои функции в API. Например, вот Lua-модуль под названием ``mymodule.lua``, который экспортирует одну функцию под названием ``myfun``: Реализация метода ``start()`` полностью теперь выглядит так: Реализация метода ``start()`` выглядит следующим образом: Чтобы включить/отключить использование необъявленных глобальных переменных в вашем коде на языке Lua, используйте модуль Tarantool'а :ref:`strict <strict-module>`. Чтобы не усложнять, не будем загружать какую-то особую карту, допуская, что рассматриваем карту мира. Также не будет проверять поступающие координаты, снова допуская, что все места находятся на планете Земля. Чтобы запустить микросервис, поместим модуль ``pokemon.lua`` и приложение  ``game.lua`` в текущую директорию, установим все внешние модули и запустим экземпляр Tarantool'а с работают приложением ``game.lua`` (это пример для Ubuntu): Чтобы запустить функцию ``myfun()`` -- из другого модуля, из Lua-приложения или из самого Tarantool'а -- необходимо сохранить этот модуль в виде файла, а затем загрузить этот модуль с директивой ``require()`` и вызвать экспортированную функцию. Чтобы наша логическая схема игры была доступна другим разработчикам и Lua-приложениям, поместим ее в Lua-модуль. Чтобы запустить тест локально, скачайте наш проект `покемон <https://github.com/tarantool/pokemon>`_ из GitHub и вызовите: Чтобы не выходить за рамки пошагового примера, ограничим оригинальный сюжет игры. У нас есть карта с местами появления покемонов. Далее у нас есть несколько игроков, которые могут отправлять запросы на поимку покемона на сервер (где работает микросервис Tarantool'а). Сервер отвечает, пойман ли покемон, увеличивает счетчик покемонов, если пойман, и вызывает метод респауна покемона, который через некоторое время создает нового покемона на том же самом месте. Чтобы хранить JSON-данные в виде кортежей, используем продвинутую методику, которая уменьшит отпечаток данных и обеспечит пригодность всех сохраняемых документов. Будем использовать Tarantool-модуль `avro-schema <https://github.com/tarantool/avro-schema>`_, который проверяет схему JSON-документа и конвертирует его в кортеж Tarantool'а. Кортеж будет содержать только значения полей, таким образом, занимая меньше места, чем оригинальный документ. С точки зрения avro-схемы, конвертация JSON-документов в кортежи -- "flattening" (конвертация в плоские файлы), а восстановление оригинальных документов -- "unflattening" (конвертация из плоских файлов). Использовать модуль достаточно просто: Чтобы протестировать REST API, создадим новый скрипт (`client.lua <https://github.com/tarantool/pokemon/blob/1.9/client/client.lua>`_), который похож на наше приложение ``game.lua``, но отправляет запросы HTTP POST и GET, а не вызывает Lua-функции: Чтобы работать с географическими координатами, используем модуль Tarantool'а `gis <https://github.com/tarantool/gis>`_. Мы вынесем клиентские приложения за рамки рассказа. Но в конце обещаем небольшую демонстрацию с моделированием настоящих пользователей, чтобы немного поразвлечься. :-) Мы используем стандартные :ref:`настройки журнала <cfg_logging>` Tarantool'а, поэтому увидим вывод записей журнала в консоли, когда запустим приложение в режиме скрипта. Используем две географические переменные: Мы будем использовать функции из встроенного модуля Tarantool'а :ref:`box <box-module>`: Эти два метода будут главным образом использоваться во время инициализации нашей игры, но их также можно вызывать позднее, например для тестирования кода. Эти данные будем хранить как кортежи в спейсах Tarantool'а. Но чтобы бэкенд-приложение работало как микросервис, правильно будет отправлять/получать данные в универсальном формате JSON, используя Tarantool в качестве системы хранения документов. Производительность или управляемость не слишком важны в нашем случае. Запустим ``respawn()`` в файбере для непрерывной работы в фоновом режиме. Для этого необходимо изменить ``respawn()``: При запуске этого скрипта вы заметите, что у обоих игроков одинаковые шансы сделать первую попытку поимки покемона. В классическом Lua-скрипте сетевой вызов блокирует скрипт, пока он не будет выполнен, поэтому первым попытаться поймать может тот игрок, который раньше зашел в игру. В Tarantool'е оба игрока играют одновременно, поскольку все модули объединены в :ref:`кооперативной многозадачности <atomic-cooperative_multitasking>` и используют неблокирующий ввод-вывод. Однако у файберов есть определенные ограничения, по сравнению с потоками, основное из которых -- отсутствие режима работы с многоядерной системой. Все файберы в приложении относятся к одному потоку, поэтому они используют то же ядро процессора, что и родительский поток. В то же время, это ограничение незначительно для приложений Tarantool'а, поскольку узкое место Tarantool'а -- жесткий диск, а не ЦП. ``add_pokemon()`` (добавить покемона) для добавления покемона в базу данных и ``box.schema.create_space('pokemons')`` для создания спейса под названием ``pokemon`` (покемон), чтобы хранить информацию о покемонах (мы не создаем аналогичный спейс по игрокам, потому что планируем только отправлять и получать информацию об игроках с помощью вызовов API, так что нет необходимости хранить ее); ``box.space.pokemons:create_index('primary', {type = 'hash', parts = {1, 'unsigned'}})`` для создания первичного HASH-индекса по ID покемона; ``box.space.pokemons:create_index('status', {type = 'tree', parts = {2, 'str'}})`` для создания вторичного TREE-индекса по статусу покемона. ``catch()`` (поймать) для расчета, когда был пойман покемон (помимо координат как игрока, так и покемона, этот метод будет использовать коэффициент вероятности, чтобы в пределах досягаемости игрока можно было поймать не каждого покемона); ``map()`` (карта) для заполнения карты всеми покемонами, которые хранятся в Tarantool'е. ``nationalmap``, что означает `Государственный атлас США в равновеликой проекции (US National Atlas Equal Area) <https://epsg.io/2163>`_. Это система спроецированных координат на основании WGS84. Она дает основу для проецирования мест и позволяет определить местоположение наших игроков и покемонов в метрах. ``notify()`` (уведомить) для записи информации о пойманных покемонах (например, "Игрок 1 поймал покемона A"); ``respawn()`` (респаун) для добавления отсутствующих покемонов на карту, скажем, каждые 60 секунд (предположим, что испуганный покемон убегает, поэтому мы убираем покемона с карты при любой попытке поймать его и через некоторое время добавляем обратно на карту); ``start()`` (начать) для инициализации игры (метод создаст спейсы в базе данных, создаст и скомпилирует avro-схемы, а также запустит метод ``respawn()``). ``wgs84``, что означает последнюю редакцию стандарта Мировой геодезической системы координат, `WGS84 <https://en.wikipedia.org/wiki/World_Geodetic_System#WGS84>`_. В целом, она представляет собой стандартную систему координат Земли и изображает Землю как эллипсоид. и добавляем специальные параметры для Tarantool'а (см. описание в файле `README <https://github.com/tarantool/nginx_upstream_module#directives>`_ модуля upstream): и назвать его файбером в ``start()``: catch = function(self, pokemon_id, player)
    -- проверить данные игрока
    local ok, tuple = self.player_model.flatten(player)
    if not ok then
        return false
    end
    -- получить данные покемона
    local p_tuple = box.space.pokemons:get(pokemon_id)
    if p_tuple == nil then
        return false
    end
    local ok, pokemon = self.pokemon_model.unflatten(p_tuple)
    if not ok then
        return false
    end
    if pokemon.status ~= self.state.ACTIVE then
        return false
    end
    -- логика поимки будет дополняться
    <...>
end catch_distance = 100, облегченное **управление кодом** (переиспользование, подготовка к развертыванию, версионирование) и горячая **перезагрузка кода** без перезапуска экземпляра Tarantool'а. local exports = {}
exports.myfun = function(input_string)
   print('Hello', input_string)
end
return exports local game = require('pokemon')
box.cfg{listen=3301}
game:start()

-- функции add, map и catch по REST API
function add(request, pokemon)
    return {
        result=game:add_pokemon(pokemon)
    }
end

function map(request)
    return {
        map=game:map()
    }
end

function catch(request, pid, player)
    local id = tonumber(pid)
    if id == nil then
        return {result=false}
    end
    return {
        result=game:catch(id, player)
    }
end local game = {
    -- локальная переменная
    num_players = 0,

    -- метод, который выводит локальную переменную
    hello = function(self)
      print('Hello! Your player number is ' .. self.num_players .. '.')
    end,

    -- метод, который вызывает другой метод и возвращает локальную переменную
    sign_in = function(self)
      self.num_players = self.num_players + 1
      self:hello()
      return self.num_players
    end
} local http = require('curl').http()
local json = require('json')
local URI = os.getenv('SERVER_URI')
local fiber = require('fiber')

local player1 = {
    name="Player1",
    id=1,
    location = {
        x=1.0001,
        y=2.0003
    }
}
local player2 = {
    name="Player2",
    id=2,
    location = {
        x=30.123,
        y=40.456
    }
}

local pokemon = {
    name="Pikachu",
    chance=99.1,
    id=1,
    status="active",
    location = {
        x=1,
        y=2
    }
}

function request(method, body, id)
    local resp = http:request(
        method, URI, body
    )
    if id ~= nil then
        print(string.format('Player %d result: %s',
            id, resp.body))
    else
        print(resp.body)
    end
end

local players = {}
function catch(player)
    fiber.sleep(math.random(5))
    print('Catch pokemon by player ' .. tostring(player.id))
    request(
        'POST', '{"method": "catch",
        "params": [1, '..json.encode(player)..']}',
        tostring(player.id)
    )
    table.insert(players, player.id)
end

print('Create pokemon')
request('POST', '{"method": "add",
    "params": ['..json.encode(pokemon)..']}')
request('GET', '')

fiber.create(catch, player1)
fiber.create(catch, player2)

-- подождать игроков
while #players ~= 2 do
    fiber.sleep(0.001)
end

request('GET', '')
os.exit() local schema = {
    player = {
        type="record",
        name="player_schema",
        fields={
            {name="id", type="long"},
            {name="name", type="string"},
            {
                name="location",
                type= {
                    type="record",
                    name="player_location",
                    fields={
                        {name="x", type="double"},
                        {name="y", type="double"}
                    }
                }
            }
        }
    },
    pokemon = {
        type="record",
        name="pokemon_schema",
        fields={
            {name="id", type="long"},
            {name="status", type="string"},
            {name="name", type="string"},
            {name="chance", type="double"},
            {
                name="location",
                type= {
                    type="record",
                    name="pokemon_location",
                    fields={
                        {name="x", type="double"},
                        {name="y", type="double"}
                    }
                }
            }
        }
    }
} nginx package.path = 'scripts/?.lua;' .. package.path pclient_1  | Create pokemon
<...>
pclient_1  | {"result":true}
pclient_1  | {"map":[{"id":1,"status":"active","location":{"y":2,"x":1},"name":"Pikachu","chance":99.100000}]}
pclient_1  | Catch pokemon by player 2
pclient_1  | Catch pokemon by player 1
pclient_1  | Player 1 result: {"result":true}
pclient_1  | Player 2 result: {"result":false}
pclient_1  | {"map":[]}
pokemon_pclient_1 exited with code 0 respawn = function(self)
    -- назовем наш файбер;
    -- это выполнит чистый вывод в fiber.info()
    fiber.name('Respawn fiber')
    while true do
        for _, tuple in box.space.pokemons.index.status:pairs(
                self.state.CAUGHT) do
            box.space.pokemons:update(
                tuple[self.ID],
                {{'=', self.STATUS, self.state.ACTIVE}}
            )
        end
        fiber.sleep(self.respawn_time)
    end
end respawn = function(self)
    fiber.name('Respawn fiber')
    for _, tuple in box.space.pokemons.index.status:pairs(
           self.state.CAUGHT) do
        box.space.pokemons:update(
            tuple[self.ID],
            {{'=', self.STATUS, self.state.ACTIVE}}
        )
    end
 end server {
  server_name tnt_test;

  listen 80 default deferred reuseport so_keepalive=on backlog=65535;

  location = / {
      root /usr/local/nginx/html;
  }

  location /api {
    # ответы проверяют бесконечное время ожидания
    tnt_read_timeout 60m;
    if ( $request_method = GET ) {
       tnt_method "map";
    }
    tnt_http_rest_methods get;
    tnt_http_methods all;
    tnt_multireturn_skip_count 2;
    tnt_pure_result on;
    tnt_pass_http_request on parse_args;
    tnt_pass tnt;
  }
} start = function(self)
    -- создать спейсы и индексы
        <...>
    -- создать модели
        <...>
    -- скомпилировать модели
        <...>
    -- начать игру
       self.pokemon_model = compiled_pokemon
       self.player_model = compiled_player
       fiber.create(self.respawn, self)
       log.info('Started')
    -- ошибки, если создание схемы или компиляция не работает
       <...>
end upstream tnt {
      server pserver:3301 max_fails=1 fail_timeout=60s;
      keepalive 250000;
} wgs84 = 4326,
nationalmap = 2163, 