# BaseMod Concept

BaseMod Concept can be used as an example or template to structure a Project Zomboid LUA mod. It show how to use the famous `require` function to define load order of your scripts.

>*Use a text editor like VSCode to find and replace all instances of `MyModName` with the mod name you want. Also rename the directories accordingly.*

<br>

## What does it do?
- Offer a base to quick start a new project.
- Quickly define Custom Events from your config file.
- Quickly define global ModData and easily access it anywhere.
- Handling of receiving Global ModData is already done for you.
- Offer a clean & easy way to structure your project as it grow bigger.

<br>

---

<br>

# **Directory Structure**
The `lua` directory contain 3 subdirectories.
- **client** | lua script loaded on client only.
- **server** | lua script loaded on server only.
- **shared** | lua script loaded on both client & server.

Inside each of these 3 directories, we have a directory with the same name as the mod.

>*This will prevent script conflict/overwritting with other mods and make it easier to reload script using command or debug interface (F11).*

<br>

---

<br>

# Getting Started

Edit the mod config file at `lua/shared/MyModName/Config.lua`
1) Change the `ModName`.
2) Change the `ModInfo` with your own.
3) Define the Global ModData needed for your mod.
4) Add custom events into the `ClientEvents` and `ServerEvents` tables.
>*If you need to, add new fields to the config object and access it using `Client.Config.MyField` and `Server.Config.MyField`.*

<br>

# Commands

Communication between the client & server is done using commands.

## Sending Commands

Send a command from a **client** to the **server**
```lua
Client.SendCommand("MyCommand", {})
```

Send a command from the **server** to a **client**
```lua
Server.SendCommand("MyCommand", {}, targetPlayer)
```

Send a command from the **server** to **all clients**
```lua
Server.SendCommand("MyCommand", {})
```

<br>

## Receiving Commands

To make it easier to reload a specific command, each command handler is defined into its own file.

>*Check template commands **Ping** & **Pong** to see how it works.* 

<br>

# Modules

**A module is a table of functions that can be used inside command handlers and other modules.**

This is where the main logic of your mod will be defined.
>*I call theses `Module` because you can structure your mod into different parts and access each part from within an other.*  

>*Check the template module named `Test` to see how it's defined.*

<br>

# Custom Events

Add any custom event name you need into your config file.
```lua
ClientEvents = {
    "MyCustomClientEvent",
},

ServerEvents = {
    "MyCustomServerEvent",
},
```
>*All custom events are internally prefixed with your ModName so there is no conflict between mods.*

<br>

## AddEvent

Add a callback to a custom event so that it is executed when triggered.

```lua
local function myCustomEventCallback(arg1, ...)
    Client.Log("My custom client event has been triggered!");
end
Client.AddEvent("OnMyCustomClientEvent", myCustomEventCallback);
```
```lua
local function myCustomEventCallback(arg1, arg2, arg3)
    Server.Log("My custom server event has been triggered!");
end
Server.AddEvent("OnMyCustomServerEvent", myCustomEventCallback);
```

<br>

## RemoveEvent

Remove a callback from a custom event so that it is no longer executed.

```lua
Client.RemoveEvent("OnMyCustomClientEvent", myCustomEventCallback);
```
```lua
Server.RemoveEvent("OnMyCustomServerEvent", myCustomEventCallback);
```

<br>

## TriggerEvent

Trigger a custom event and pass any parameters that you need.

```lua
Client.TriggerEvent("OnMyCustomClientEvent", "param1", "param2", "param3");
```
```lua
Server.TriggerEvent("OnMyCustomServerEvent", "param1", "param2", "param3", "param4", "param5", "param6", "param7", "param8");
```

> The game engine limits us to a maximum of 8 parameters.

<br>

# Global ModData

**Global ModData can be useful to store information into the World.**  
Both client and server can have their own Global ModData but clients can request that ModData to the server to get the latest version of it.

For example if you wanted to have a **Price List** synchronized between everybody you would create the same table on both client and server.
When the player connect it would request the latest snapshot of that table and using commands you would keep it up-to-date.
```lua
ClientModData = {
    PriceList = true, -- true mean we request to the server on connect
},

ServerModData = {
    "PriceList", -- server table names are just a string
},
```

Some Global ModData table don't need to be networked, they are only relevant to the server or to the client itself.
```lua
ClientModData = {
    LocalPlayer = false, -- false mean we do not request the server ever and is only available to this client
},
```

>*To have a client and server Global ModData table synchronized it must have the exact same name.*

## Access Global ModData

All loaded Global ModData will be accessible into the **Client.Data** & **Server.Data** object.

```lua
Client.Data.LocalPlayer.Cash = 9999;
local baseballBatPrice = Client.Data.PriceList.BaseballBat
```
```lua
local baseballBatPrice = Server.Data.PriceList.BaseballBat
```
>*Never set the table itself, eg: `Client.Data.LocalPlayer = {}` or it will not point to the ModData reference anymore.*

<br>

---

<br>

# Reload Scripts

### Reloading **client** & **shared** script on the client

Press F11 and search for your mod name, you will get a list of all your mod files then click the reload button next to the file you want to reload.

### Reloading **server** & **shared** script on the server

Enter this command in your server console:
```
reloadlua server/MyModName/MyScript.lua
```
```
reloadlua shared/MyModName/MyScript.lua
```
>*You can also enter those commands in the chat using `/reloadlua <filename>`, must be logged in with an admin account.*
