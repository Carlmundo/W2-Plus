# Worms 2 Plus
An easy-to-install patch that makes the game run on modern computers with extra features.
This has been tested on both the CD and [GOG](https://www.gog.com/game/worms_2) versions of Worms 2.

## Install
[Download the latest version](https://github.com/Carlmundo/W2-Plus/releases/latest)

## How to Play
There is no need to set any Windows compatibility settings.
- Launch the game by running either:
	- start.exe or frontend.exe (to skip intro videos) from the game's installed folder
	- Desktop shortcuts if checked on install
- Network Play:
	- TCP - Play online without port forwarding
	- IPX - Play over LAN or VPN

## Features
- Compatible with modern versions of Windows and Wine ([WineHQ](https://gitlab.winehq.org/wine/wine/-/wikis/Download#wine-binary-packages) binary packages are recommended)
- No CD required
- Multi-language support: English, Czech, Dutch, French, German, Italian, Polish, Portuguese, Portuguese (Brazil), Russian, Spanish, Spanish (Latin America), Swedish.
- Re-enabled online multiplayer, play with modern networks (via [modified](https://github.com/Carlmundo/fkNetcode) [FkNetcode](https://worms2d.info/FkNetcode))
- LAN play restored with support for virtual private networks (via [IPXWrapper](https://github.com/solemnwarning/ipxwrapper) & [wkDNet](https://github.com/Dawid8plc/wkDNet))
- Backflip is now permanently enabled in-game and works online (double tap the Backspace key)
- Windowed mode and Borderless options (via [modified ReSolution](https://github.com/Carlmundo/wkReSolution) with [cnc-ddraw](https://github.com/FunkyFr3sh/cnc-ddraw) or wndmode) 
- Settings app for configuring advanced video options (found in game options)
	- You can press Ctrl+G in-game to unlock the cursor from the window
- New launcher to play the intro videos, upscaled and in higher quality
- Increased limits of options and weapons schemes
- Infinite rope swings (set repeat swings to -1 in Options)
- Improved soundtrack quality (vs GOG version) with FLAC audio in-game
- Mission select for single player to resume progress and play previously completed missions (via [fkMissions](https://github.com/Dawid8plc/fkMissions))
- In-game music volume can be set via the restored audio mixer button in Audio options
- Added soundbanks from other classic Worms releases:
	- Worms: The Directors Cut, named as "Classic - Director's Cut" (conversion by Squirminator2k, voiced by Andy Davidson)
	- Worms 2: Regional exclusives - Polish-2 (also from WWP Poland CD), Russian (also from W:A)
	- Online Worms: Japanese, Korean
	- Worms Armageddon: Brummie, Cad, Cyberworms, Czech (Czech Republic CD), Drill Sergeant, Finnish, Formula One, Geezer, Irish, Jock, Kidz, Polish, Rasta, Redneck, Rushki, Russian, Stooges, Team 17 Test, The Raj, Thespian, US Sports, Whoopsie
	- Worms World Party: Danish-2, Dutch-2, French-2, Italian-2, Spanish-2, Swedish-2, Korean-2 (South Korea CD)
	- Worms World Party Aqua - 6 Korean Soundbanks
- Added terrains from other classic Worms releases:
	- Worms (& Reinforcements/United) (originally ported to W:A by CarmineLynx)
	- Worms Armageddon
	- Worms Armageddon & Worms World Party (PlayStation & Dreamcast)
- New Water colour: Oil Black
- Ported over enhancements from [Des/S*natch patch](https://worms2d.info/Des_patch)
	- Frontend
		- Minimize or exit from anywhere
		- See your game password as you type it
		- Terrain editor doesn't lose focus when you click "Generate"
		- Demo won't autoplay when idle
		- Stop repositioning the window when going back to the main menu
		- Additional flags for online - Pirate & Team 17
		- Unlock classic Worms terrain options without using the "OSSETT" cheat
	- In-Game	
		- Ninja Rope Glitch Fixes 1-4
		- Remove Replay screen corners (to be compatible with borderless windowed mode)
- Discord Rich Presence to show whether you're in the menus or in-game
- Mutes the clicking sound when you type
- Changed the all weapons team name cheat back to "TEAM17MicroProse"
- Improved Frontend clarity and DPI scaling
- Support for more characters from other languages 
- Fixed the water selection in the frontend (via [fkWaterFix](https://github.com/Dawid8plc/fkWaterFix))
- Updated the Soundbank Editor with a working version
- Portuguese soundbank
- Automatically sets the graphics to their maximum level
- Includes changes from the last official patch (v1.05)
- Checks for updates when the game starts

## Join the Community
Join the [Worms 2 Discord](https://discord.gg/Tvs83972UD) to find players.

## Troubleshooting
 - Do **not** set any compatibility settings on any of the game's files
 - Make sure only one copy of the game is installed to avoid it launching the wrong application
 - If using an old version of Windows, make sure to install updates before the patch.
 - Wine users: make sure win-mono is installed. WineHQ binaries should prompt you for this when needed.
 - Modified Windows users: try enabling DirectPlay manually by running the following command as administrator.  
```dism /online /Enable-Feature /FeatureName:DirectPlay```

## Project Contributors
Carlmundo is the project lead but development was also actively worked on with the following people:
 - Dawid8 - Author of modules: fkMissions, fkSettings, fkWaterFix, fkWorm2NAT, wkBackflip, wkDLang, wkDNet. Implemented mod loader improvements, old weapon cheat code and real-time volume changing. Author of tools: DW2SMT, W2TerrainConvert, Worm2NAT Relay Server.
 - FunkyFr3sh - Updates and implementation for cnc-ddraw that improved game rendering and online stability
 - 333networks / Darkelarious, Dark1, Dr.Flay - Server hosting
 - Frag-Net / eukara - Server hosting
 - Rúben Fernandes (rubinho146) - Portuguese translation, Portuguese soundbank director
 - Ana Martins (GoRobotnikGo) - Portuguese soundbank voice actor
 - JPEXS - Czech translation

Open source software used is credited under "Features".
