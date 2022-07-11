# BaseMod Concept

*When using this concept, you can use a text editor and replace all instances of `MyModName` with the mod name you want. Also rename the directories accordingly.*

<br>

## What does it do?
- Define Global ModData from a config file.
- Define Custom Events from a config file.
- Send commands between client and server.
- Structure project using `Modules`.

<br>

---

<br>

# **Directory Structure**
The `lua` directory contain 3 subdirectories, each of them is optional dependently of your needs.
- **client** | lua script loaded on client only.
- **server** | lua script loaded on server only.
- **shared** | lua script loaded on both client & server.

Inside each of these directories, we have a directory with the same name as the mod.  
>*This will prevent script conflict/overwritting with other mods and make it easier to reload script using command or debug interface (F11).*

<br>

---

<br>

# Getting Started

Edit the mod config file at `lua/shared/MyModName/Config.lua`
1) Change `ModName = "MyModName"`.
2) Change the `ModInfo` to fit your own info.
3) Change `ClientModData` and `ServerModData` to suit your mod needs.
4) Add custom events into the `ClientEvents` and `ServerEvents` tables.
You can add any custom config **key:value** to the config object to access it into your mod.

<br>

# Commands

Network communication between the client and server are done using commands.

## Sending Commands

Both **Client** & **Server** object have a method `SendCommand`.

### To send a command from a client to the server:
```lua
Client.SendCommand("MyCommand", {})
```

### To send a command from the server to a client:
```lua
Server.SendCommand("MyCommand", {}, targetPlayer)
```

### To send a command from the server to all clients:
```lua
Server.SendCommand("MyCommand", {})
```

## Receiving Commands

Command handlers are functions defined into its own file. *This make it easier to reload a specific command for debugging.*

Server Command Handlers are inside `client/MyModName/ServerCommands/`.  
Client Command Handlers are inside `server/MyModName/ClientCommands/`.

>Check template commands **Ping** & **Pong** to see how it works. 

<br>

# Modules

**A module is a table of functions that can be used inside command handlers and other modules.**

This is where the main logic of your mod will be defined.
>I call theses `Module` because you can structure your mod into different parts and access each part from within an other.
Check the template module named `Test` to see how it's defined.

<br>

# Custom Events

Define your mod client & server Custom Events in your config file.  
>Both **Client** & **Server** object have the methods `AddEvent, RemoveEvent, TriggerEvent`.

## AddEvent

You can listen to a Custom Event and execute a callback everytime it's triggered.

```lua
local function myCustomEventCallback(arg1 ,arg2, ...)
    Client.Log("My custom client event has been triggered!");
end
Client.AddEvent("OnMyCustomClientEvent", myCustomEventCallback);
```
```lua
local function myCustomEventCallback(arg1 ,arg2, ...)
    Server.Log("My custom server event has been triggered!");
end
Server.AddEvent("OnMyCustomServerEvent", myCustomEventCallback);
```

## RemoveEvent

You can remove a callback so that it stop executing when then event triggers again.
```lua
Client.RemoveEvent("OnMyCustomClientEvent", myCustomEventCallback);
```
```lua
Server.RemoveEvent("OnMyCustomServerEvent", myCustomEventCallback);
```

## TriggerEvent

You can trigger and pass any parameter to your custom events when you need it.
```lua
Client.TriggerEvent("OnMyCustomClientEvent", "param1", "param2");
```
```lua
Server.TriggerEvent("OnMyCustomServerEvent", "param1", "param2", "param3");
```

<br>

# Global ModData

Info coming soon

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
>You can also enter those commands in the chat with `/reloadlua <filename>` if you are logged with an admin account

<br>

---

<br>

# Notes

>In **Singleplayer** `isClient()` and `isServer()` both return `false`.

>In **Multiplayer** `isClient()` return `true` on the game client only.

>In **Multiplayer** `isServer()` return `true` on the game server only.
