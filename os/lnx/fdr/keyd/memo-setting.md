
## setting dir

```
/etc/keyd/
```


## config file

```bash
sudo vim /etc/keyd/default.conf
```


### ex.1 : capslock を ctrl / esc にする ( 定番 )

押しっぱなし -> ctrl, 単押し -> esc

```ini
[ids]
*


[main]
# CapsLock を 押しっぱなし=Ctrl, 単押し=Esc にする
capslock = overload(control, esc)


# 元の Esc を CapsLock にする ( 不要なら削除 )
esc = capslock
```


### ex.2 : 左 Ctrl と CapsLock を入れ替える ( シンプル )

```ini
[ids]

*

[main]

capslock = leftcontrol
leftcontrol = capslock
```


### ex.3 : レイヤーを使ってシンボル入力を便利にする

```ini
[ids]
*

[main]
capslock = overload(symbols, esc)

[symbols]
d = ~
f = /
j = (
k = )
l = _
s = -
```


## 設定の反映

設定ファイルを保存したら, 以下で再読み込みします ( 再起動不要 )

```bash
sudo keyd reload
```


## 動作確認

### キー名を調べる

リマップしたいキーの名前を確認するには

```bash
sudo keyd monitor
```

キーを押すと, keyd がリマップした後の出力が表示されます  
元の入力イベントを見たい場合は, 先に `sudo systemctl stop keyd` してから実行してください


### ログの確認

設定ファイルにエラーがある場合はログに出ます

```bash
sudo journalctl -eu keyd
```


## 緊急時の復旧 ( 重要 )

設定を間違えてキーボードが使えなくなった場合, 以下の特殊キーシーケンスで keyd を強制終了できます

```
Backspace + Escape + Enter ( 3 キー同時押し )
```

これで keyd が終了し, 元のキーマップに戻ります


## アプリごとのリマップ ( 応用, 実験的機能 )

kde wayland でアプリごとに異なるリマップをしたい場合

```bash
# keyd グループに自分を追加
sudo usermod -aG keyd $(whoami)

# ログアウト・ログインで反映


# 設定ファイルを作成
mkdir -p ~/.config/keyd
vim ~/.config/keyd/app.conf
```

```ini
# ~/.config/keyd/app.conf の例
[firefox]
alt.l = C-l
alt.t = C-t
alt.w = C-w
```

ただしこの機能は実験的で, KDE Wayland での動作は `dbus-python` に依存します  
必要に応じて `sudo dnf install python3-dbus` を入れてください


## まとめ

```bash
# 全体の流れ ( コピペ用 )
sudo dnf copr enable alternateved/keyd
sudo dnf install keyd
sudo systemctl enable --now keyd
sudo vim /etc/keyd/default.conf   # 設定を書く
sudo keyd reload                  # 反映
```


