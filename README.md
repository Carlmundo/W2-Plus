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
- Multi-language support: English, Czech, Dutch, French, German, Icelandic, Italian, Polish, Portuguese, Portuguese (Brazil), Russian, Spanish, Spanish (Latin America), Swedish. Chinese (Simplified) is also supported for the frontend.
- Re-enabled online multiplayer, play on modern networks without port forwarding (via Worm2NAT & [modified](https://github.com/Carlmundo/fkNetcode) [FkNetcode](https://worms2d.info/FkNetcode))
- LAN play restored with support for virtual private networks (via [IPXWrapper](https://github.com/solemnwarning/ipxwrapper) & [wkDNet](https://github.com/Dawid8plc/wkDNet))
- Higher resolutions, Windowed and Borderless modes (via [modified ReSolution](https://github.com/Carlmundo/wkReSolution) with [cnc-ddraw](https://github.com/FunkyFr3sh/cnc-ddraw)) 
- Play with up to 48 worms (increased from 18)
- Increased limits of options and weapons schemes
- New Scheme Options:
	- God Mode - all worms have unlimited health
	- High Jump
	- Sheep Heaven - all crates contain Sheep weapons, Super Sheep flight time increased
	- Super Shopper - secret weapon crate shower
	- Extended Fuses/Herds - Increased to 9
	- Utilities don't end turns (Blow Torch, Drill, Girder, Teleport)
	- Weapons don't end turn
	- Loss of control doesn't end turn
	- Worm selection after movement
	- Low Gravity
	- Persistent Rope - stay on your rope or bungee at the end of your turn
	- Rapid Play - less downtime between turns and no damage/death queue
	- Indestructible Terrain
	- Invisible Terrain
	- Fast Crates - crates fall faster
	- Crate Spy - see the contents of crates
	- Crate Limit - increase the maximum crates on screen
	- Crate Rate - spawn multiple crates at once
	- Suicide Bomber - replaces Kamikaze
	- Aqua Sheep - Super Sheep no longer drown in water on-screen
	- Instant Mines - including those placed by players
	- New Herd Weapons - Dynamite, Mine, Ming Vase, Sheep (also sets Super Sheep, Old Woman, Salvation Army)
- Rope repeat swings can be set to Unlimited
- Secret Weapon stocks in Weapon editor and schemes
- Backflip enabled, double tap the Backspace key
- Unlocked Aim when firing or using the Blow Torch
- Camera Lock
	- Scroll Lock to stop the camera moving by itself
	- Ctrl + Scroll Lock to also disable mouse movement affecting the camera
- CPU players can be added to Internet/LAN games by the host
- Settings app for configuring more video and game options (found in game options or settings.exe)
	- Video options
	- Blood Mode
	- Faster CPU turns
	- Extended chat always on (permits use of navigational keys)
- Intro videos upscaled and in higher quality
- Improved soundtrack quality (vs GOG version) with FLAC audio in-game (via [W2-DSound](https://github.com/Dawid8plc/W2-DSound), [ZPlayMM-FLAC](https://github.com/Carlmundo/ZPlayMM-FLAC) & [ogg-winmm-w2](https://github.com/Carlmundo/ogg-winmm-w2))
- Mission select for single player to resume progress and play previously completed missions (via [fkMissions](https://github.com/Dawid8plc/fkMissions))
- In-game music and sound effect volume can be set via the restored audio mixer button in Audio options (via [Worms2-Volume](https://github.com/Carlmundo/Worms2-Volume))
- Rebind keys on the keyboard (rebind.exe)
- Speedrun toggle app (speedrun.exe)
- Added soundbanks from other classic Worms releases:
	- Worms: The Director's Cut, named as "Classic - Director's Cut" (conversion by Squirminator2k, voiced by Andy Davidson)
	- Worms 2: Regional exclusives - Polish-2 (also from WWP Poland CD), Russian (also from W:A)
	- Online Worms: Japanese, Korean
	- Worms Armageddon: Brummie, Cad, Cyberworms, Czech (Czech Republic CD), Drill Sergeant, Finnish, Formula One, Geezer, Irish, Jock, Kidz, Polish, Rasta, Redneck, Rushki, Russian, Stooges, Team 17 Test, The Raj, Thespian, US Sports, Whoopsie
	- Worms World Party: Danish-2, Dutch-2, French-2, Italian-2, Spanish-2, Swedish-2, Korean-2 (South Korea CD)
	- Worms World Party Aqua - 6 Korean Soundbanks
- New soundbanks: Icelandic & Portuguese
- Added terrains from other classic Worms releases:
	- Worms (& Reinforcements/United) (originally ported to W:A by CarmineLynx)
	- Worms Online
	- Worms Armageddon
	- Worms Armageddon & Worms World Party (PlayStation & Dreamcast)
- Added colour maps from Online Worms, Worms Armageddon & Worms World Party
	- or create your own with [W2ColormapGen](https://github.com/Dawid8plc/W2ColormapGen) (all players require the same files installed in Levels\Import)
- Added Water colour: Oil Black
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
- Game can now handle intense explosions caused by extended weapon options (via wkHighMem)
- Preview soundbanks when creating/editing a team
- Discord Rich Presence to show whether you're in menus or in-game
- Muted clicking sound when you type
- Changed the all weapons team name cheat back to "TEAM17MicroProse"
- Improved Frontend clarity and DPI scaling
- Supports more text input from other languages
- Fixed broken in-game sounds and restored their intended behaviour: Amazing, Brilliant, Excellent, Perfect
- Fixed herd duplication glitch
- Fixed the water selection in the frontend
- Updated the Soundbank Editor with a working version, new translations and added the missing sound (Hurry.wav)
- Includes changes from the last official patches (v1.05 & v1.07)
- Detects and fixes issues with DirectPlay (via [DirectPlayRegSetup](https://github.com/Carlmundo/DirectPlayRegSetup))

## Join the Community
Join the [Worms 2 Discord](https://discord.gg/Tvs83972UD) to find players.

## Troubleshooting
 - Do **not** set any compatibility settings on any of the game's files
 - Make sure only one copy of the game is installed to avoid it launching the wrong application
 - If using an old version of Windows, make sure to install updates before the patch.
 - Wine users: make sure wine-mono is installed. WineHQ binaries should prompt you for this when needed.

## Project Contributors
Carlmundo is the project lead but development was also actively worked on with the following people:
 - Dawid8 - Author of modules: fkMissions, fkSettings (frontend fixes), Water frontend fix, fkWorm2NAT, wkBackflip, wkDLang, wkDNet, wkHighMem. Implemented mod loader improvements, old weapon cheat code and real-time volume changing. Author of tools: DW2SMT, W2TerrainConvert, Worm2NAT Relay Server.
 - FunkyFr3sh - Updates and implementation for cnc-ddraw that improved game rendering and online stability
 - 333networks / Darkelarious, Dark1, Dr.Flay - Server hosting
 - Frag-Net / eukara - Server hosting
 - Toby Ellis - Consultant, Discord Community Manager
 - Rúben Fernandes (rubinho146) - Translation and soundbank director for Icelandic & Portuguese
 - Ana Martins (GoRobotnikGo) - Portuguese soundbank voice actress
 - JPEXS - Czech translation
 - 萌の少年@Bilibili - Chinese (Simplified) translation
 - Dariusz Olszewski (darekols) - Additional Polish translation
 - Ida Marie Sørensen - Icelandic soundbank voice actress

Open source software used is credited under "Features".

## Related Projects
- [W2ColormapGen](https://github.com/Dawid8plc/W2ColormapGen) - Create your own colour maps
- [DW2SMT](https://github.com/Dawid8plc/DW2SMT) - Create your own translation (get in touch if you do!)
