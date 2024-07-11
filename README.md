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
- Online Play:
	- TCP - all players need to set up [Port Forwarding](https://portforward.com/router.htm) on their router with the following ports:
		- 47624 (TCP)
		- 2300-2400 (TCP and UDP)
	- IPX - works without port forwarding by playing over LAN or Virtual Private Networks such as Hamachi, Radmin and others. You can also join an IPX server if you have server details.

## Features
- Compatible with modern versions of Windows and Wine
- No CD required
- Multi-language support: English, Dutch, French, German, Italian, Polish, Portuguese (Brazil), Spanish, Spanish (Latin America), Swedish & Russian (English in-game)
- Re-enabled online multiplayer, play with modern networks (via [modified](https://github.com/Carlmundo/fkNetcode) [FkNetcode](https://worms2d.info/FkNetcode))
- LAN play restored with support for virtual private networks (via [IPXWrapper](https://github.com/Carlmundo/ipxwrapper-w2) & [wkDNet](https://github.com/Dawid8plc/wkDNet))
- Backflip is now permanently enabled in-game and works online (double tap the Backspace key)
- Windowed mode and Borderless options (via [modified ReSolution](https://github.com/Carlmundo/wkReSolution) with [cnc-ddraw](https://github.com/FunkyFr3sh/cnc-ddraw) or wndmode) 
- Settings app for configuring advanced video options (found in game options)
	- You can press Ctrl+G in-game to unlock the cursor from the window
- New launcher to play the intro videos, upscaled and in higher quality
- Improved soundtrack quality (vs GOG version) with FLAC audio in-game
- In-game music volume can be set via the restored audio mixer button in Audio options
- Added soundbanks from other classic Worms releases:
	- Worms: The Directors Cut, named as "Classic - Director's Cut" (conversion by Squirminator2k, voiced by Andy Davidson)
	- Online Worms: Japanese, Korean
	- Worms Armageddon: Brummie, Cad, Cyberworms, Drill Sergeant, Finnish, Formula One, Geezer, Irish, Jock, Kidz, Rasta, Redneck, Rushki, Russian, Stooges, Team 17 Test, The Raj, Thespian, US Sports, Whoopsie
	- Worms World Party: Danish-2, Dutch-2, French-2, Italian-2, Spanish-2, Swedish-2, Polish-2 (Poland CD exclusive for WWP & Worms 2)
- Ported over enhancements from [Des patch](https://worms2d.info/Des_patch)
	- Frontend
		- Minimize or exit from anywhere
		- See your game password as you type it
		- Terrain editor doesn't lose focus when you click "Generate"
		- Demo won't autoplay when idle
		- Stop repositioning the window when going back to the main menu
		- Additional flags for online - Pirate & Team 17
		- Unlock classic Worms terrain options without using the "OSSETT" cheat
		- Enable ability to kick teams
		- Flexible weapon editor
		- Flexible option editor
	- In-Game	
		- Ninja Rope Glitch Fixes 1, 3 & 4
		- Remove Replay screen corners (to be compatible with borderless windowed mode)
- Discord Rich Presence to show whether you're in the menus or in-game
- Mutes the clicking sound when you type
- Changed the all weapons team name cheat back to "TEAM17MicroProse"
- Improved Frontend clarity and DPI scaling
- Updated the Soundbank Editor with a working version
- Automatically sets the graphics to their maximum level
- Includes changes from the last official patch (v1.05)
- Checks for updates when the game starts

## Join the Community
Join the [Worms 2 Discord](https://discord.gg/Tvs83972UD) to find players.

## Troubleshooting
 - Do **not** set any compatibility settings on any of the game's files
 - Make sure only one copy of the game is installed to avoid it launching the wrong application
 - Check the Misc\Readme.txt file for any additional known fixes
 - If using an old version of Windows, make sure to install updates before the patch.
