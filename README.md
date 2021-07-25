# Oh my Linux!
Setting up your linux is easy!

# Getting Started

## Prerequisites

- A Unix-like operating system: macOS, Linux, BSD. On Windows: WSL2 is preferred, but cygwin or msys also mostly work.
- BASH v4 and newer
- git should be installed (recommended v2.4.11 or higher)

## Basic Installation


## Manual Installation

Clone repo:

```bash

   git clone https://github.com/dodo325/ohmylinux.git

```

Start script:

```bash

   bash ohmylinux/oh-my-linux

```

# Command Line Interface:

```bash

   $ ./oh-my-linux
      oh-my-linux - Oh My Linux

   Usage:
   oh-my-linux [command]
   oh-my-linux [command] --help | -h
   oh-my-linux --version | -v

   Commands:
   build   Build script

   Options:
   --help, -h
      Show this help

   --version, -v
      Show version number

   Environment Variables:
   DEBUG
      Enable debug mode
```

Build

```bash

   $ ./oh-my-linux build

   oh-my-linux build - Build script

   Shortcut: b

   Usage:
   oh-my-linux build [SELECT] [options]
   oh-my-linux build --help | -h

   Options:
   --help, -h
      Show this help

   --debug, -d
      Enable debug mode

   --no-logo
      Not print logo

   --run, -r
      Run scripn after building

   --sysinfo
      Print System info

   Arguments:
   SELECT
      Selecte some scripts

   Examples:
   cli build
   cli build -d -r
   cli build "vlc GUI"
   cli build --sysinfo "vlc GUI"

```