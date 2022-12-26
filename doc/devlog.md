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
- [+] Added autoload current locale when translation file exists 

13.11.2022
=
- [+] Added manual locale selection from file and save selected locale in settings

20.11.2022
=
- [+] Implemented layers list draw content in grid
- [!] SIGSEGV error fixed

23.11.2022
=
- [!] Fixed memory leaks and SIGSEGV when app closed
- [!] Now works good both Linux and Windows (tested with latest Ubuntu x64 and Windows 11 x64)

26.11.2022
=
- [+] Added Import frame image from any image file
- [!] Fixed different frame sizes when new frame created
- [+] Added Line drawing tool
- [*] Changed docs (added 'How to get' section)

02.12.2022
=
- [!] Fixed Pipette tool
+ [+] Added Rectangle drawing tool

04.12.2022
=
- [!] Fixed Issue 'Tool windows disappear with fullscreen canvas'
- [+] Added Filled Rectangle drawing tool
- [+] Added posibilities for 'Layer Copy' and 'Rename Layer'
- [+] Extends layer with BASE64 encode/decode (used when copy or rename layer)
- [*] Updated docs
- [!] Fixed Delete Layer
- [!] Block drawing if layer locked
- [*] Update Ukrainian UI translation
- [*] Change Layers order (newest shows in top, older in bottom)
- [*] Now shows layers belongs to current frame only
- [+] Added Circle tool 
- [+] Last two button images was made with SPedit!

12.12.2022
=
- [*] Completly redesigned UI, a lot of code refactored (few days work between blackouts)
- [*] Changed SPEDit's Mascot (program icon and animation in 'About' screen) - thanks to @EddieMattos
- [+] Added Fullscreen mode
- [!] Fixed some flickering and freeze when modal windows shown
- [-] Cutted oldstyle DOS mode drawing with keys (very awkward way)

14.12.2022
=
- [+] Added Shift+arrows keys for moving drawing grid area
- [+] Added min. cell size in 'New frame' dialog

17.12.2022
=
- [+] Extended work with colors - added Stadard preset combobox (will be filled soon), Preset palette and Hex color picker
- [*] Changed Background color selection to Ctrl+Click instead Right click. Foreground color selection works with Left mose click

22.12.2022
=
- [+] Supported palette presest in PNG format
- [+] Added custom cursors while drawing

25.12.2022
=
- [+] Added 'Zen mode' in fullscreen
- [+] Added Frame resize feature

26.12.2022
=
- [!] Fixed GTK2 warning in Linux and it seems now works in Windows too 