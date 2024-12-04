wkReSolution - v0.4 (3 October 2014)
Project page and source: https://github.com/StepS-/wkReSolution/

*** INSTRUCTIONS ***

Unpack me to the WWP or Worms 2 directory :)

After unpacking all the files, just start the game and play a match: your desktop resolution will be detected automatically (by default the screen size is set to 0;0 in ReSolution.ini, so this will be overridden by your desktop resolution on first launch). You may also change it using ReSolution.ini.

Worms World Party: must be either 1.01 or 1.00, European.
Worms 2: must be patched to 1.05 in order for this to work. GOG version is supported and doesn't need patching (it's already 1.05).

* NEW in version v0.2: resize the window in real-time! In conjunction with windowed mode, you can now stretch or shrink the window in a way that the actual screen estate will now be resized (not just a simple bitmap stretch!). This can be enabled via the "Enable" setting of [Resizing] in ReSolution.ini file. Press Ctrl+G to show and move the mouse cursor around. Another option, "ProgressiveUpdate" (experimental) will also make the window apply its changes live as you resize.

* NEW in version v0.3: zooming support! When windowed mode module is on, simply use your mouse wheel or the keyboard num +/- buttons to zoom the game! Press middle button (if using wheel) or End (if using keyboard) to restore zoom back to 100%.
Alt+Enter implemented! You can now switch from/to borderless windowed fullscreen with windowed mode. Note that this will only work properly with windowed mode.

* NEW in version v0.4: WWP support! European versions of 1.01 and 1.00 are supported. Zooming/resizing features are supported for WWP, but the "ProgressiveUpdate" option is not available at this time. Added "UseTouchscreenZoom" to zooming. This option allows to utilize the touch pinch zoom gesture in order to zoom the game in and out, when Zooming is enabled. Water rises will now dynamically letterbox the camera (something that was the main issue with caverns), removing the old workaround. The settings file is now ReSolution.ini instead of W2.ini, to fit both games.

NOTE: In order for the game to be windowed, set the game's width and height to values lower than your primary screen resolution. Then, ensure that the windowed mode is enabled ("wkWndMode.dll" is present), and optionally, that the Border and SizingBorder settings are set to 1, to be able to resize the window.
The wndmode library is a d3dhook component from menopem's D3DWindower, modified by VEG. Thank you!
