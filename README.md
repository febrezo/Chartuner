# Chartuner

Copyright (C) 2020  Félix Brezo (@febrezo)

[![License](https://img.shields.io/badge/license-GNU%20Affero%20General%20Public%20License%20Version%203%20or%20Later-blue.svg)]()

Chartuner is a stupid application written in Vala and deployed using Flatpak that simply reencodes the string provided in the GUI using unicode characters for bold or italic text. Really. It doesn't do anything else. :D

![Welcome view](data/welcome.png)
![Transforms view](data/transform.png)
![Bold result](data/bold.png)
![About](data/about.png)

## 1. License: GNU GPLv3+


This is free software, and you are welcome to redistribute it under certain conditions.

	Copyright (c) 2020 Félix Brezo (https://felixbrezo.com)
	
	This program is free software; you can redistribute it and/or
	modify it under the terms of the GNU General Public
	License as published by the Free Software Foundation; either
	version 2 of the License, or (at your option) any later version.
	
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
	General Public License for more details.

For more details on the license, check the [COPYING](COPYING) file.


## 2. Installation

The application is stored in my own Flatpak Repository but has some dependencies linked to the Gnome and Elementary environment which can be downloaded from Flathub.

Thus, you need to install the application in your own OS following the official instructions you will find [here](https://flatpak.org/setup/). Debian, Ubuntu, PureOS, Fedora, RedHat,  ArchLinux, elementaryOS, Gentoo, OpenSuse , Zorin or Raspberry Pi, amongst many others are currently supported.

Then, you need to add the two remotes required by Facefy. The `flathub` one to download some of the dependencies from and the `febrehub` which stores the application itself. This can be done using the following commands. 

```
flatpak remote-add --if-not-exists febrehub https://felixbrezo.com/febrehub.flatpakrepo
```

The aforementioned commands will require `root` permissions to add the remotes, but they can also be installed for the current system using `--user`.

Once the repo has been added, use the following to install:

```
flatpak install com.felixbrezo.Chartuner
```

Note that if you didn't have the Flathub repository installed it will require you to enter the root password. The Flathub repository is used to grab some dependencies which are easily reachable from there.

## 3. Usage

To run the application simply type the following command:

```
flatpak run com.felixbrezo.Chartuner
```

## 4. More questions?

There is a Frequent Asked Section available in this respository in several languages:

- [English](doc/support/en/README.md)
- [Spanish](doc/support/es/README.md)
- [Catalan](doc/support/ca/README.md)

The application is fully localized in the aforementioned languages. More to come.
