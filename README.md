# EasyRestrict

[![N|Discord](https://img.shields.io/discord/223070469148901376?color=0869A4&label=DISCORD.GG%2FGCA&logo=discord&logoColor=white&style=flat-square)](https://discord.gg/gca)

### Functionalities
  - Enable or disable whitelist ingame
  - Change kick message
  - Add custom names when whitelisting

### Installing

```
1: Download the addon from the sources below
2: Place it in your /garrysmod/addons/ folder
3. Restart your server
4. Type "/restrict" in chat to open the interface.
```

### How to

> Delete a whitelisted player

When you are in the menu, right click on row and click "Remove"

> Toggle the whitelist on/off

On the top-right corner you have a checkbox called "Restrict status"

> Change addon permissions

On your group permissions management system (ULX, ServerGuard & others), if you have a category named **"CAMI"**, you'll find a tickbox to toggle permission for a given group.

> I have accidently removed the permission to the superadmin group

Don't panic, on ulx you can type `ulx groupallow superadmin "er use"` on your server console to solve this.

> I've forgot to add my SteamID64 to the whitelist and now I cannot join my server.

Stay calm, you can add someone to the whitelist with the server console using `er_add <name> <steamid64>`

```fix
Note: This command is only available using the server console
```

### Download

| Platform | Link |
| ------ | ------ |
| GitHUB | [Repository][repo] |
| WorkShop | [Addon][workshop] |
| MTX | [Resource][mtx] |

License
----

AGPL-3.0 License


   [repo]: <https://github.com/Lexa013/easyrestrict>
   [workshop]: <#>
   [mtx]: <#>
