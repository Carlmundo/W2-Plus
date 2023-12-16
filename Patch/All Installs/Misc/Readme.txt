# Worms 2 Plus Fixes
## Fix the broken water palette in the frontend
You can fix the broken colours in the Terrain Editor, but this fix does not seem to work for everyone.
 - Run "Hotfix - FWP.exe" to apply the hotfix.
 - Run "Remove Hotfix - FWP.reg" to revert the change.

## Troubleshoot LAN connection via VPN
- In the game folder, run "ipxconfig.exe".
- Try setting the "Primary interface" to your VPN adapter.
- You can also try selecting other adapters in the list of Network adapters and unchecking "Enable interface".
- You can reset the LAN settings by running "Reset IPX Config.reg".