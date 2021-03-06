# Electron port for FreeBSD

## Now It's Official
Electron is officially available in the FreeBSD ports tree. For more information, please see the following URLs:

- https://www.freshports.org/devel/electron4/
- https://www.freshports.org/devel/electron5/ (to appear)

This repository will continue to serve as a pre-official development repository.

---

This repository contains an experimental port of electron for FreeBSD. The port is largely based on:

- chromium patch files from [www/chromium port](https://www.freshports.org/www/chromium/)
- electron patch files by [@prash-wghats](https://github.com/prash-wghats/)

## Get
A package file is available at the releases page. To install, download the file (with .txz extension) and run the command (for example):

``` shell
pkg install electron-4.1.4-freebsd12-amd64.txz
```

## Run

``` shell
electron
```

## Build
If you would like to build artifacts for yourself, be sure you have the ports tree on your machine. If not, run the following commands:

``` shell
portsnap fetch
portsnap extract
```

Clone this repository with git command and build/install electron (an external working directory is currently needed, defined with the WRKDIR enviroment variable):

``` shell
git clone https://github.com/tagattie/FreeBSD-Electron
cd FreeBSD-Electron/devel/electron4
export WKRDIR=~/wrkdir
make install clean
```

## Platform
- Built on FreeBSD 11 and 12 amd64.

## Credits
- Chromium patches by [FreeBSD/Chromium Team](https://wiki.freebsd.org/Chromium)
- Electron patches by @prash-wghats at [Electron-VSCode-Atom-For-FreeBSD](https://github.com/prash-wghats/Electron-VSCode-Atom-For-FreeBSD)
- Porting works by @freebsd-electron at [electron-port](https://github.com/freebsd-electron/electron-port)
