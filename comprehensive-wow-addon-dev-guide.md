# Comprehensive Guide: WoW Addon Development with VS Code

## Table of Contents
1. [Install Required Software](#1-install-required-software)
2. [Set Up VS Code for Lua and WoW Development](#2-set-up-vs-code-for-lua-and-wow-development)
3. [Create Your Addon Project](#3-create-your-addon-project)
4. [Set Up .gitignore](#4-set-up-gitignore)
5. [Set Up GitHub Integration](#5-set-up-github-integration)
6. [Set Up CurseForge Integration](#6-set-up-curseforge-integration)
7. [Set Up Task Automation in VS Code](#7-set-up-task-automation-in-vs-code)
8. [Common Git Commands and Troubleshooting](#8-common-git-commands-and-troubleshooting)
9. [Final Steps and Best Practices](#9-final-steps-and-best-practices)
10. [Basic Addon Example](#10-basic-addon-example)

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

## 5. Set Up GitHub Integration

5.1. Create a new repository on GitHub:
   - Go to [https://github.com/](https://github.com/) and log in
   - Click the "+" icon in the top right and select "New repository"
   - Name your repository (e.g., "MyWoWAddon")
   - Leave it public unless you want to pay for a private repository
   - Don't initialize with a README, .gitignore, or license
   - Click "Create repository"

5.2. Link your local project to GitHub:
   - In VS Code's terminal, type these commands (replace YOUR_USERNAME with your GitHub username):
     ```
     git remote add origin https://github.com/YOUR_USERNAME/MyWoWAddon.git
     git add .
     git commit -m "Initial commit"
     git push -u origin main
     ```

5.3. Install GitHub extension in VS Code:
   - Go to the Extensions view again
   - Search for "GitHub Pull Requests and Issues"
   - Click "Install"

## 6. Set Up CurseForge Integration

6.1. Install CurseForge CLI:
   - Go to [https://authors.curseforge.com/knowledge-base/projects/529-curseforge-cli](https://authors.curseforge.com/knowledge-base/projects/529-curseforge-cli)
   - Download the CLI for your operating system
   - Follow the installation instructions on the page

6.2. Create a CurseForge API token:
   - Go to [https://authors.curseforge.com/account/api-tokens](https://authors.curseforge.com/account/api-tokens)
   - Click "Generate Token"

6.3. Set up CurseForge CLI:
   - In VS Code's terminal, type:
     ```
     curseforge config set api-token YOUR_API_TOKEN
     ```
   - Replace YOUR_API_TOKEN with the token you just generated

6.4. Create a .curseforge folder:
   - In VS Code, right-click in the file explorer and select "New Folder"
   - Name it ".curseforge" (including the dot)

6.5. Create a project-metadata.json file:
   - In the .curseforge folder, create a new file named "project-metadata.json"
   - Add this content (replace YOUR_PROJECT_ID and other placeholders):
     ```json
     {
       "projectId": YOUR_PROJECT_ID,
       "projectSlug": "your-project-slug",
       "fileId": null,
       "gameVersions": [90205],
       "releaseType": "release",
       "relations": {
         "projects": []
       }
     }
     ```

## 7. Set Up Task Automation in VS Code

7.1. Create a tasks.json file:
   - In VS Code, press Ctrl+Shift+P (Cmd+Shift+P on Mac)
   - Type "Tasks: Configure Task" and select it
   - Choose "Create tasks.json file from template"
   - Select "Others"

7.2. Replace the content of tasks.json with:
   ```json
   {
     "version": "2.0.0",
     "tasks": [
       {
         "type": "shell",
         "label": "Deploy Addon",
         "command": "cp -R ${workspaceFolder} PATH_TO_WOW_ADDON_FOLDER",
         "group": "build",
         "problemMatcher": []
       },
       {
         "type": "shell",
         "label": "Package for CurseForge",
         "command": "curseforge upload ${workspaceFolder}",
         "group": "build",
         "problemMatcher": []
       }
     ]
   }
   ```

7.3. Replace PATH_TO_WOW_ADDON_FOLDER with the actual path to your WoW addons folder

## 8. Common Git Commands and Troubleshooting

### 8.1 Basic Git Commands

1. `git status`: Shows the current state of your repository
2. `git add <file>` or `git add .`: Stages changes for commit
3. `git commit -m "Your message"`: Commits staged changes
4. `git push`: Uploads your local commits to GitHub
5. `git pull`: Downloads changes from GitHub to your local repository
6. `git log`: Shows a history of commits

### 8.2 Common Git Errors and Solutions

1. Error: "fatal: not a git repository"
   - Solution: Ensure you're in the correct directory. Use `cd` to navigate to your project folder, then run `git init`

2. Error: "fatal: remote origin already exists"
   - Solution: Use `git remote set-url origin <URL>` to update the existing remote

3. Error: "failed to push some refs"
   - Solution: Run `git pull origin main` first, resolve any conflicts, then try pushing again

4. Error: "Please tell me who you are" when committing
   - Solution: Set up your Git identity:
     ```
     git config --global user.email "you@example.com"
     git config --global user.name "Your Name"
     ```

5. Error: "fatal: refusing to merge unrelated histories"
   - Solution: Use `git pull origin main --allow-unrelated-histories`

### 8.3 Resolving Merge Conflicts

1. Open conflicting file(s) in VS Code
2. Look for sections marked with `<<<<<<< HEAD`, `=======`, and `>>>>>>> [branch name]`
3. Manually edit the file to resolve the conflict, removing the marker lines
4. Stage the changes with `git add .`
5. Complete the merge by running `git commit`

### 8.4 Useful Git Tips

1. Create a new branch: `git checkout -b new-feature-name`
2. Switch between branches: `git checkout branch-name`
3. Discard local changes to a file: `git checkout -- filename`
4. Undo the last commit (keeping the changes): `git reset HEAD~1`
5. View changes before committing: `git diff`

## 9. Final Steps and Best Practices

9.1. Test your setup:
   - Write some basic addon code in your .lua file
   - Use the "Deploy Addon" task to copy your addon to your WoW folder
   - Launch WoW and check if your addon works
   - Use the "Package for CurseForge" task to upload to CurseForge

9.2. Regular updates:
   - Keep your addon's TOC file updated with the correct WoW version
   - Update your README.md file with information about your addon
   - Maintain a changelog to track your addon's development

9.3. Best practices:
   - Commit often with clear messages
   - Test thoroughly before pushing to GitHub or CurseForge
   - Keep learning about Git and addon development
   - Engage with the WoW addon development community

## 10. Basic Addon Example

Let's create a simple addon named "SillySpeaker" that uses Ace3 and creates a button to make your character say something silly.

### 10.1 File Structure

Create the following files in your addon folder:

1. SillySpeaker.toc
2. SillySpeaker.lua
3. SillySpeaker.xml
4. embeds.xml
5. libs Folder

### 10.2 SillySpeaker.toc

```plaintext
## Interface: 90205
## Title: SillySpeaker
## Notes: Makes your character say silly things!
## Author: Your Name
## Version: 1.0
## SavedVariables: SillySpeakerDB
## OptionalDeps: Ace3

embeds.xml
SillySpeaker.xml
SillySpeaker.lua
```

### 10.3 embeds.xml

```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/
..\FrameXML\UI.xsd">
    <Script file="Libs\LibStub\LibStub.lua"/>
    <Include file="Libs\CallbackHandler-1.0\CallbackHandler-1.0.xml"/>
    <Include file="Libs\AceAddon-3.0\AceAddon-3.0.xml"/>
    <Include file="Libs\AceEvent-3.0\AceEvent-3.0.xml"/>
    <Include file="Libs\AceDB-3.0\AceDB-3.0.xml"/>
    <Include file="Libs\AceConsole-3.0\AceConsole-3.0.xml"/>
</Ui>
```

Note: Download Ace3 and its components separately and place them in a "Libs" folder in your addon directory.

### 10.4 SillySpeaker.xml

```xml
<Ui xmlns="http://www.blizzard.com/wow/ui/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.blizzard.com/wow/ui/
..\FrameXML\UI.xsd">
    <Frame name="SillySpeakerFrame" parent="UIParent" movable="true" enableMouse="true">
        <Size>
            <AbsDimension x="200" y="100"/>
        </Size>
        <Anchors>
            <Anchor point="CENTER"/>
        </Anchors>
        <Backdrop bgFile="Interface\DialogFrame\UI-DialogBox-Background" edgeFile="Interface\DialogFrame\UI-DialogBox-Border" tile="true">
            <BackgroundInsets>
                <AbsInset left="11" right="12" top="12" bottom="11"/>
            </BackgroundInsets>
            <TileSize>
                <AbsValue val="32"/>
            </TileSize>
            <EdgeSize>
                <AbsValue val="32"/>
            </EdgeSize>
        </Backdrop>
        <Layers>
            <Layer level="ARTWORK">
                <FontString name="$parentTitle" text="SillySpeaker" inherits="GameFontNormal">
                    <Anchors>
                        <Anchor point="TOP">
                            <Offset>
                                <AbsDimension x="0" y="-10"/>
                            </Offset>
                        </Anchor>
                    </Anchors>
                </FontString>
            </Layer>
        </Layers>
        <Frames>
            <Button name="$parentButton" inherits="UIPanelButtonTemplate" text="Say Something Silly!">
                <Size>
                    <AbsDimension x="160" y="30"/>
                </Size>
                <Anchors>
                    <Anchor point="CENTER">
                        <Offset>
                            <AbsDimension x="0" y="0"/>
                        </Offset>
                    </Anchor>
                </Anchors>
                <Scripts>
                    <OnClick>
                        SillySpeaker:SaySilly()
                    </OnClick>
                </Scripts>
            </Button>
        </Frames>
        <Scripts>
            <OnMouseDown>
                self:StartMoving()
            </OnMouseDown>
            <OnMouseUp>
                self:StopMovingOrSizing()
            </OnMouseUp>
        </Scripts>
    </Frame>
```

### 10.4 SillyTalker.lua

```lua
SillySpeaker = LibStub("AceAddon-3.0"):NewAddon("SillySpeaker", "AceConsole-3.0", "AceEvent-3.0")

local defaults = {
    profile = {
        minimap = {
            hide = false,
        },
    },
}

local sillyPhrases = {
    "I'm not saying I'm Batman, but have you ever seen me and Batman in the same room?",
    "I put my root beer in a square glass. Now it's just beer.",
    "Why don't scientists trust atoms? Because they make up everything!",
    "I'm on a seafood diet. I see food, and I eat it.",
    "Why did the scarecrow win an award? He was outstanding in his field.",
}

function SillySpeaker:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("SillySpeakerDB", defaults, true)
    self:RegisterChatCommand("sillyspeaker", "ChatCommand")
    self:RegisterChatCommand("ss", "ChatCommand")
end

function SillySpeaker:OnEnable()
    SillySpeakerFrame:Show()
end

function SillySpeaker:OnDisable()
    SillySpeakerFrame:Hide()
end

function SillySpeaker:ChatCommand(input)
    if input == "toggle" then
        if SillySpeakerFrame:IsVisible() then
            SillySpeakerFrame:Hide()
        else
            SillySpeakerFrame:Show()
        end
    else
        self:SaySilly()
    end
end

function SillySpeaker:SaySilly()
    local phrase = sillyPhrases[math.random(#sillyPhrases)]
    SendChatMessage(phrase, "SAY")
end
```