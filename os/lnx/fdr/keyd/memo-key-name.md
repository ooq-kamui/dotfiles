
# keyd  -  key-name


## 特殊キー

| keyd での名前 | キー        |
|---------------|-------------|
| `enter`       | Enter       |
| `space`       | Space       |
| `tab`         | Tab         |
| `backspace`   | Backspace   |
| `delete`      | Delete      |
| `insert`      | Insert      |
| `esc`         | Escape      |
| `capslock`    | CapsLock    |
| `numlock`     | NumLock     |
| `scrolllock`  | ScrollLock  |
| `pause`       | Pause       |
| `sysrq`       | PrintScreen |


## 修飾キー

| keyd での名前                  | key              |
|--------------------------------|------------------|
| `leftshift`   / `rightshift`   | Shift            |
| `leftcontrol` / `rightcontrol` | Ctrl             |
| `leftalt`     / `rightalt`     | Alt              |
| `leftmeta`    / `rightmeta`    | Super (Win キー) |
| `compose`                      | Compose          |


## 矢印キー

| keyd での名前 | key  |
|---------------|------|
| `up`          | ↑    |
| `down`        | ↓    |
| `left`        | ←    |
| `right`       | →    |


## ナビゲーション

| keyd での名前 | key      |
|---------------|----------|
| `home`        | Home     |
| `end`         | End      |
| `pageup`      | PageUp   |
| `pagedown`    | PageDown |


## ファンクションキー

| keyd での名前 | key      |
|---------------|----------|
| `f1`          | f1       |
|  :            | :        |
| `f9`          | f9       |
| `f10`         | f10      |
|  :            | :        |
| `f23`         | f23      |


## 記号 / 句読点

| keyd での名前 | キー               |
|---------------|--------------------|
| `-`           | - (ハイフン)       |
| `=`           | =                  |
| `[`           | [                  |
| `]`           | ]                  |
| `;`           | ;                  |
| `'`           | ' (アポストロフィ) |
| `` ` ``       | ` (バッククォート) |
| `\`           | \                  |
| `,`           | ,                  |
| `.`           | .                  |
| `/`           | /                  |


## 数字

| keyd での名前 | key      |
|---------------|----------|
| `0`           | 0        |
|  :            | :        |
| `9`           | 9        |


## アルファベット

| keyd での名前 | key      |
|---------------|----------|
| `a`           | a        |
|  :            | :        |
| `z`           | z        |


## テンキー (Numpad)

| keyd での名前 | キー           |
|---------------|----------------|
| `kp0` ~ `kp9` | テンキー 0-9   |
| `kpenter`     | テンキー Enter |
| `kpplus`      | テンキー +     |
| `kpminus`     | テンキー -     |
| `kpasterisk`  | テンキー *     |
| `kpslash`     | テンキー /     |
| `kpdot`       | テンキー .     |
| `kpequal`     | テンキー =     |
| `kpcomma`     | テンキー ,     |


## メディア / システム

| keyd での名前                                        | キー     |
|------------------------------------------------------|----------|
| `volumeup` / `volumedown` / `mute`                   | 音量     |
| `playpause` / `nextsong` / `previoussong` / `stopcd` | 再生制御 |
| `brightnessup` / `brightnessdown`                    | 画面輝度 |
| `sleep` / `wakeup` / `power`                         | 電源系   |

---


## 使用例

```ini
[main]
capslock = esc
enter = backspace
leftalt = leftcontrol
```

なお, 自分のキーボードのキー名がわからない場合は:

```bash
sudo keyd monitor
```

を実行してキーを押すと, keyd が認識しているキー名がリアルタイムで表示されます.

また `keyd list-keys` で有効なキー名の一覧も確認できます.

出典:
- [keyd key names gist (rvaiya)](https://gist.github.com/rvaiya/be31f42049a4b5ad46666a8e120d9843 )
- [keyd(1) man page](https://man.archlinux.org/man/keyd.1.en )


