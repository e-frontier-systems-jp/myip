#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then
    echo "このスクリプトはsudoで実行する必要があります。"
    exit 0
fi


PWD=`echo $(cd $(dirname $0) && pwd)`

echo セットアップを開始します。
echo 
echo あらかじめ、myip.conf.sampleファイルを開き設定を行う事をお勧めします。
echo
read -p "続行するにはエンターキーを押してください"
echo

echo
echo "実行ファイルをコピーしています..."
cp ${PWD}/myip /usr/local/sbin/myip
chmod 755 /usr/local/sbin/myip

echo
echo "設定ファイルをコピーしています..."
cp ${PWD}/myip.conf.sample /usr/local/etc/myip.conf
chmod 600 /usr/local/etc/myip.conf

echo
echo "systemdサービスファイルをコピーしています..."
cp ${PWD}/myip.service /etc/systemd/system/myip.service
chmod 644 /etc/systemd/system/myip.service


echo
echo "systemdサービスとして登録しています。"
systemctl daemon-reload
systemctl enable myip

echo
echo "以下のコマンドでサービスを起動出来るようになりました！"
echo "sudo systemctl start myip"
echo 
echo "また、このフォルダは削除することが可能です。"
echo
