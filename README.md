# PoC child applications

This is a PoC of an angulardart application which loads separate applications (entry points).

### Run

First start the `build_runner`.

```
pub run build_runner serve
```

There's a simple proxy with really basic rewrite rules available, therefore `dart tool/server.dart`
in another terminal window.

Now open `http://localhost:8082`.


### Build

To test the compiled version, stop the `build_runner` process and run:

```
pub serve
```