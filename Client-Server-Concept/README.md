# Client/Server Concept

## Robust **Client/Server** communication concept with Global ModData.

*When using this concept, you can use a text editor and replace all instances of "MyModName" with the mod name you want. Also rename the directories accordingly.*

> ## In this concept you will learn:
> - How to handle Global ModData.
> - How to send commands between client and server.
> - How to structure your project.
> - How to manage load order of your scripts.
> - How to make your mod work in **Singleplayer**, **Host** & **Dedicated** server without extra work.

---

## **Directory Structure**
Your `lua` directory can contain 3 subdirectories, each of them is optional depending your needs.
> - **client** | lua script loaded on client only.
> - **server** | lua script loaded on server only.
> - **shared** | lua script loaded on both client & server.

Inside each of these directories, we have a directory named after your mod name in which we have all scripts for the mod.  
>*This will prevent script conflict/overwritting with other mods and make it easier to reload script using command or debug interface (F11).*

---

## **Reload Scripts**

### Reloading **client** & **shared** script on the client

> Press F11 and search for your mod name, you will get a list of all your mod files then click the reload button next to the file you want to reload.

### Reloading **server** & **shared** script on the server

> Enter this command in your server console:
> > reloadlua server/MyModName/MyScript.lua
>
> > reloadlua shared/MyModName/MyScript.lua
>
> You can also enter those commands in the chat with `/reloadlua <filename>` if you are logged with an admin account
---

## **isClient()** & **isServer()** methods

> In **Singleplayer** `isClient()` and `isServer()` both return `false`.

> In **Multiplayer** `isClient()` return `true` on the game client only.
>
> In **Multiplayer** `isServer()` return `true` on the game server only.

---
