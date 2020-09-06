![Screenshot](data/screenshots/pomodoro.png?raw=true)

## Keep focused on your work

maeto is a clean, easy-to-use time manager based on Pomodoro technique. It breaks down work into intervals to keep you focused and allows you to rest during strategic periods to reward your progress. It is a must-have app if you need to avoid procrastination.

## Made for [elementary OS](https://elementary.io)

maeto is designed and developed on and for [elementary OS](https://elementary.io). However, any GNU/Linux distribution with GTK 3 and the required dependencies installed can run maeto.

## Developing and Building

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

To install, use `make install`, then execute with `com.github.tomatoers.tomato`

```shell
sudo make install
com.github.tomatoers.tomato
```