# BaseMod Concept

*When using this concept, you can use a text editor and replace all instances of `MyModName` with the mod name you want. Also rename the directories accordingly.*

> ## What does it do?
> - Define Global ModData from a config file.
> - Define custom events from a config file.
> - Send commands between client and server.
> - Structured project using require.
> - Make mods work in **Singleplayer**, **Host** & **Dedicated Server** without extra work.

---

# **Directory Structure**
Your `lua` directory can contain 3 subdirectories, each of them is optional depending your needs.
> - **client** | lua script loaded on client only.
> - **server** | lua script loaded on server only.
> - **shared** | lua script loaded on both client & server.

Inside each of these directories, we have a directory named after your mod name in which we have all scripts for the mod.  
>*This will prevent script conflict/overwritting with other mods and make it easier to reload script using command or debug interface (F11).*

---

# **How to use**

Edit the mod config file at ```lua/shared/MyModName/Config.lua```
> 1) Change `ModName = "MyModName"`.
> 2) Change the `ModInfo` to suit your own info.
> 3) Change `ClientModData` and `ServerModData` to suit your mod needs.
> 4) Add custom events into `ClientEvents` and `ServerEvents` when you need.
> > And add any custom configs that you need access in your client and server scripts.



---

# **Reload Scripts**

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

# **Notes**

## **isClient()** & **isServer()** methods

> In **Singleplayer** `isClient()` and `isServer()` both return `false`.
>
> In **Multiplayer** `isClient()` return `true` on the game client only.
>
> In **Multiplayer** `isServer()` return `true` on the game server only.

---
