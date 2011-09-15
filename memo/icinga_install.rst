=====================
Icingaの導入
=====================

http://www.icinga.org/

最新版 1.5.0 （2011.9.2時点）をソースからインストール。

インストール
===================

付属ドキュメントの「Icinga with IDOUtils Quickstart」の通りに進める。

ドキュメントではApacheが前提になっているが導入先ではCherokeeを使った。OSはUbuntu 10.10。

必須パッケージのインストール
----------------------------

ビルド関連::

 #> apt-get install build-essential libgd2-xpm-dev
 #> apt-get install libjpeg62 libjpeg62-dev libpng12-0 libpng12-dev


MySQL::

 #> apt-get install mysql-server mysql-client

LibDBi関連::

 #> apt-get install libdbi0 libdbi0-dev libdbd-mysql


icinga用アカウントの作成
------------------------

ユーザ作成::

  #> useradd -m -s /usr/sbin/nologin icinga
  #> groupadd icinga-cmd
  #> usermod -a -G icinga-cmd icinga
  #> usermod -a -G www-data icinga


ソースファイルからインストール
------------------------------

http://www.icinga.org/ から icinga-1.5.0.tar.gz を、
Nagios Plugins - http://nagiosplugins.org からnagios-plugins-1.4.15.tar.gz を取得。

/usr/src/に上記のファイルを格納してインストール::

 #> tar xvzf icinga-1.5.tar.gz 
 #> cd icinga-1.5
 #> ./configure --with-command-group=icinga-cmd --enable-idoutils 
 #> make all
 #> make fullinstall
 #> make install-config


通知先を設定（contacts.cfg）::

 #> vi /usr/local/icinga/etc/objects/contacts.cfg

IDOUtils関連の設定ファイルを作成（というかリネーム）::

 #> cd /usr/local/icinga/etc/
 #> mv idomod.cfg-sample idomod.cfg
 #> mv ido2db.cfg-sample ido2db.cfg

idomod event broker moduleを有効にする::

 #> vi /usr/local/icinga/etc/icinga.cfg

 broker_module=/usr/local/icinga/bin/idomod.o config_file=/usr/local/icinga/etc/idomod.cfg

上記の行の先頭"#"を削除する。

インストールディレクトリのオーナーを変更する::

  #> cd /usr/local/
  #> chown -R icinga:www-data icinga


データベースの設定
------------------

データベース起動（起動してないなら）::

  #>  /etc/init.d/mysqld start


データベースとユーザ作成::

 #> mysql -u root -p
 mysql> CREATE DATABASE icinga;
 GRANT USAGE ON *.* TO 'icinga'@'localhost'
   IDENTIFIED BY 'icinga'
   WITH MAX_QUERIES_PER_HOUR 0
   MAX_CONNECTIONS_PER_HOUR 0
   MAX_UPDATES_PER_HOUR 0;
 GRANT SELECT , INSERT , UPDATE , DELETE
   ON icinga.* TO 'icinga'@'localhost';
 FLUSH PRIVILEGES ;
 quit

MySQL用のテーブルを作成する::

 #> cd /usr/src/icinga-1.5.0/module/idoutils/db/mysql
 #> mysql -u root -p icinga < mysql.sql

必要ならIDOUtilsのデータベース設定を変更する::

 #> vi /usr/local/icinga/etc/ido2db.cfg

 db_servertype=mysql
 db_port=3306
 db_user=icinga
 db_pass=icinga

HTTPサーバの設定
----------------

Basic認証用パスワードファイル作成::

 #> htpasswd -c /usr/local/icinga/etc/htpasswd.users icingaadmin

Apache2の場合は、/etc/apache2/conf.d/icinga.conf に設定サンプルがインストールされるので、それを参考に設定する。

Cherokeeの場合、上記の設定サンプルを参考に設定する。 -- 手抜き

HTTPを起動。または再起動する。


Nagios Pluginsのコンパイルとインストール
----------------------------------------

ソースファイルは/usr/src/にあるものとして::

 #> cd /usr/src
 #> tar xvzf nagios-plugins-1.4.15.tar.gz
 #> cd nagios-plugins-1.4.15
 #> ./configure --prefix=/usr/local/icinga \
    --with-cgiurl=/icinga/cgi-bin --with-htmurl=/icinga \
    --with-nagios-user=icinga --with-nagios-group=icinga
 #> make
 #> make install


IcingaとIDOUtilsを起動する
--------------------------

::

 #> service ido2db start
 #> service icinga start


自動起動の設定::

 #> update-rc.d icinga defaults


Icingaの管理画面を開く
======================

http://<host-address>/icinga/index.html
