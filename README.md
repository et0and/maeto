maeto is a clean, easy-to-use time manager based on Pomodoro technique. It is a fork of the Tomato pomodoro app by [Tomatoers](https://github.com/tomatoers/tomato), with modifications to make it build and run on the latest version of elementary.

maeto is designed and developed on and for [elementary OS](https://elementary.io). However, any GNU/Linux distribution with GTK 3 and the required dependencies installed can run maeto. Note: the app will be buggy and there are still things that need fixing as I have only begun a rudimentary port across to Hera - software considered alpha.

If you want to hack on and build maeto yourself, you'll need the following dependencies:

- gtk3
- granite
- libcanberra
- libunity

Create a `build` directory

```shell
mkdir build
cd build
```

Use `cmake` to configure the build environment and run `make` to build

```shell
cmake -DCMAKE_INSTALL_PREFIX=/usr ../
make
```

To install, use `make install`, then execute with `com.github.et0and.maeto`

```shell
sudo make install
com.github.et0and.maeto
```
