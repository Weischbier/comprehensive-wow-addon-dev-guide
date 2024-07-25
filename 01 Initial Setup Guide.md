# Initial Setup Guide for WoW Addon Development

## 1. Install Required Software

1.1. Download and install Visual Studio Code (VS Code):
   - Go to [https://code.visualstudio.com/](https://code.visualstudio.com/)
   - Click the download button for your operating system (Windows, macOS, or Linux)
   - Once downloaded, run the installer and follow the on-screen instructions

1.2. Install Git:
   - Visit [https://git-scm.com/](https://git-scm.com/)
   - Download the version for your operating system
   - Run the installer, using the default options if you're unsure

1.3. Create accounts (if you haven't already):
   - GitHub: Go to [https://github.com/](https://github.com/) and click "Sign up"
   - CurseForge: Visit [https://www.curseforge.com/](https://www.curseforge.com/) and click "Register" in the top right

## 2. Set Up VS Code for Lua and WoW Development

2.1. Install the Lua extension:
   - Open VS Code
   - Click on the square icon on the left sidebar or press Ctrl+Shift+X (Cmd+Shift+X on Mac)
   - In the search bar, type "Lua"
   - Find "Lua" by sumneko and click "Install"

2.2. Install WoW API Autocomplete extension:
   - In the same Extensions view, search for "WoW API"
   - Find "World of Warcraft API" by Ketho and click "Install"

2.3. Configure Lua settings:
   - Click on the gear icon in the bottom left of VS Code and select "Settings"
   - In the search bar at the top, type "Lua"
   - Find "Lua: Runtime Version" and set it to "Lua 5.1" from the dropdown
   - Find "Lua: Check Syntax" and make sure it's checked

## 3. Create Your Addon Project

3.1. Create a new folder for your addon:
   - Open File Explorer (Windows) or Finder (Mac)
   - Navigate to where you want to create your addon
   - Create a new folder and name it (e.g., "MyWoWAddon")

3.2. Set up Git for your project:
   - Open VS Code
   - Go to File > Open Folder and select your newly created addon folder
   - In VS Code, go to View > Terminal
   - In the terminal, type: `git init` and press Enter

3.3. Create basic addon files:
   - Right-click in the file explorer on the left side of VS Code
   - Select "New File" and create these files:
     - MyWoWAddon.toc (replace "MyWoWAddon" with your addon name)
     - MyWoWAddon.lua
     - README.md

## 4. Set Up .gitignore

4.1. Create a .gitignore file:
   - In VS Code, right-click in the file explorer and select "New File"
   - Name it ".gitignore" (including the dot)

4.2. Add WoW-specific ignores:
   - Open the .gitignore file and add these lines:
     ```
     # WoW generated files
     Thumbs.db
     WTF/
     Interface/AddOns/Blizzard_*

     # OS generated files
     .DS_Store
     .DS_Store?
     ._*
     .Spotlight-V100
     .Trashes
     ehthumbs.db
     Thumbs.db
     ```

This concludes the initial setup guide for WoW addon development.
