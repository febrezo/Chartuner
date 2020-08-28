# Chartuner

This is a template repository to ease the process of creating GUI with Vala based on GTK and Granite.

## Manually install the Chartuner

You'll need the following dependencies:

* granite >= 0.5
* meson >= 0.43.0
* valac

Then, you SHOULD clone the repository:

```
git clone https://github.com/febrezo/Chartuner.git
cd Chartuner
```

Run `meson build` to configure the build environment. Change to the build directory and run `ninja test` to build and run automated tests.

```
meson build --prefix=/usr
cd build
ninja test
```

The application found under the build folder can now be launched:

```
./com.felixbrezo.Chartuner
```

To optionally install, use `ninja install`, then execute with `com.felixbrezo.Chartuner`.

```
ninja install
com.felixbrezo.Chartuner
```

Tou SHOULD be able to explore the capabilities of the default application.

## How to use this repo

To learn about the features of this repository check [`USE_ME.md`](./doc/USE_ME.md) file for a detailed explanation.
