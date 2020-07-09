# 要件定義
Dockerfileを実行するだけで、簡易な掲示板を作成可能  
|トップページ|スレッドページ|
|---|---|
|![toppage](https://user-images.githubusercontent.com/53789788/87001319-2417b000-c1f2-11ea-9dc2-ee4e031c0500.png)|![articlepage](https://user-images.githubusercontent.com/53789788/87001389-47425f80-c1f2-11ea-861c-a9a795f331ec.png)|

※Docker関連のコマンドは基本管理者権限で実行
# 手順
## 前書き

- https未対応
- クロスサイトスクリプティング未対応
- 改行未対応
## docker-composeをインストール
```
(無ければDockerも要インストール)
yum -y install docker
systemctl start docker

curl -L https://github.com/docker/compose/releases/download/1.6.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
SELinuxを無効化する。
setenfoce 0
chmod +x /usr/local/bin/docker-compose
/usr/local/bin/docker-compose up -d
```
## プロセス起動
docker-compose up -dを実行した後
```
【start.shのIPアドレスにWebサーバのIPアドレスを記入する】
/bin/bash start.sh
```

〜初期化スクリプ補足〜
- mysqlコンテナ
	- initスクリプトを実行し初期テーブルを作成する
	- initスクリプトを一部変更する(最初はdaatabaseが存在しないのでこけるのでそれを一時消す)
	- port=3000/tcp
- phpコンテナ
	- phpからdbに接続する際のホスト名をlocalhostではなくコンテナ名とする
	- GlobalIPを変数に代入
