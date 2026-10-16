# Aayushkalikote Homebrew Tap

Homebrew formulae for my macOS tools.

## Formulae

| Formula | Description |
|---------|-------------|
| [`dropbridge`](Formula/dropbridge.rb) | Show Android phones in macOS AirDrop and receive Quick Share on your Mac. See [DropBridge](https://github.com/Aayushkalikote/DropBridge). |

## Install

```sh
brew install aayushkalikote/tap/dropbridge
```

This adds the tap and installs the formula in one step. To add the tap first and install by short name:

```sh
brew tap aayushkalikote/tap
brew install dropbridge
```

DropBridge runs as a background service. Start it now and at every login:

```sh
brew services start dropbridge
```

> [!IMPORTANT]
> Install DropBridge with Homebrew only. The files on the [Releases](https://github.com/Aayushkalikote/DropBridge/releases) page are for Homebrew to download. macOS blocks the `dropbridge` binary if you download it in a browser, because Apple has not signed it yet. If you already downloaded it, unblock it with `xattr -d com.apple.quarantine dropbridge`.

## Update

```sh
brew update
brew upgrade dropbridge
```

If the service is running, `brew services restart dropbridge` picks up the new version.

## Uninstall

```sh
brew services stop dropbridge
brew uninstall dropbridge
brew untap aayushkalikote/tap
```

## Problems

Report bugs in the tool on its own repo: [DropBridge issues](https://github.com/Aayushkalikote/DropBridge/issues). Open an issue here only if the formula itself fails to install.
