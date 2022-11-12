DEV.LOG
=======

#Description
- [*] Some changes
- [!] Some error or bugs fixes
- [+] Added something new
- [-] Removed unused features

2000-2001
=
- [+] First version for MSD-DOS (sources was lost)

2002
=
- [+] Second version with PCX file format support (in archive)

2004
=
- [+] Third version - ported to FPC for Windows, used 256 colors palette (in archive)

16.04.2021
=
- [*] Completly redesigned work process

- [+] Implemented Local Sprite Library to store imported images in PNG format separated by categories

26.04.2022
=

- [+] On tab 'Source Image' added work with frames (frames list, frame properties, deleting selected frames)

07.05.2022
=
- [*] Changed 'About' splash screen (optimized drawing, replaced animation)

22.05.2022
=
- [+] Implemented palette and colors selection

08.06.2022
=
- [+] Added interface to layers work
- [!] Fixed grid drawing bug
- [*] Changed preview (centered and with checkers as transparent BG)
- [*] Some other minor changes

09.06.2022
=
- [*] Some interface changes (Draw tools now has properties)
- [+] Started try draw (not work well now - needs to be fixed)

25.10.2022
=
- [*] A lot of changes for all the time (12.10-25.10):
- [+] Implemented cell highlitning while mouse moves over grid
- [+] Added arrow keys to move cell cursor
- [+] Added basic layer class and frame class
- [+] Added layers/frames mapped lists
- [!] Fixed memory leak
- [+] Added Export frame to PNG
- [!] Fixed cursor control by key
- [+] Added drawing by secondary color (Enter key), deleting pixel by Del key

27.10.2022
=
- [*] Created separate windows for preview, referense, layers
- [*] Code refactoring and optimization
- [*] Get rid of some unneedful components
- [*] Some changes in project organization
- [*] Updated this file

28.10.2022
=
- [+] Added template window for frames
- [*] Some minor fixes and changes

31.10.2022
=
- [+] Added pen size change
- [+] Added line draw tool
- [+] Added mouse draw (pen tool)
- [*] Changed logging through LazLogger instead of console WriteLN
- [!] Fixed transparent background while mouse draw

02.11.2022
=
- [*] Changed internal drawing tools work but app crush when close
- [+] Added template for Erase tool

04.11.2022
=
- [+] Added New frame dialog
- [!] Fixed memory leak

12.11.2022
=
- [+] Added Brazilian-Portuguese translation
- [+] Added Ukrainian translation
- [*] Fixed some typos in docs
- [*] Migrated whole projet to Lazarus
