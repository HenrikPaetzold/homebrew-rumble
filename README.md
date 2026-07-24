# homebrew-rumble

Experimental brew installer for [RumbleDB](https://github.com/RumbleDB/rumble) on MacOS

### Installation

```
brew tap rumbledb/rumble
brew install --build-from-source rumbledb
```

### Usage

```
rumbledb serve -p 9090
rumbledb run -q '1+1'
rumbledb repl
```
