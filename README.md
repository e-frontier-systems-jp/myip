# マイIP

## 概要

- マイIPを監視するsystemdサービス
- VPN切断時に自動再接続
- 特定の相手にのみVPS経由で通信
- 特定の相手からのみSSH接続を許可


## インストール

1. ソースコードを入手

```bash
cd
git clone https://github.com/e-frontier-systems-jp/myip.git
cd myip
```

2. 設定ファイルを変更

```bash
vi myip.conf.sample
```

3. インストーラーを起動

```bash
chmod +x ./myip.setup.sh
sudo ./myip.setup.sh
```

4. サービスをスタート

```bash
systemctl start myip
```

