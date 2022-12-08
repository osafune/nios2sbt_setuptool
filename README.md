NiosII EDS Setup Tool
=====================

NiosII EDS 19.1以降のセットアップをサポートするバッチファイルです。
以下の環境で確認しました。
- Windows 10 Pro 64bit 21H2
- QuartusPrime 20.1LE
- QuartusPrime 21.1LE
- QuartusPrime 22.1LE


使い方
-----
1. QuartusPrimeをインストールします。  
[IntelFPGAダウンロードセンター](https://www.intel.com/content/www/jp/ja/programmable/downloads/download-center.html)
  
2. WindowsのWSLを有効にして、Ubuntu 20.04TLSをインストールします。  
[ここの手順](https://www.macnica.co.jp/business/semiconductor/articles/intel/133717/) の1と2（Ubuntuのインストールとアカウント作成）までを行います。
  
3. 適当な場所にフォルダを作成し、このリポジトリの `nios2sbt_setup.bat` `nios2sbt_setup.sh` をコピーします。パス名に多バイト文字が含まれないようにしてください。

4. `nios2sbt_setup.bat` をダブルクリックしてセットアップを開始します。  
WSL側のセットアップでパスワード入力を求められます。2.で作成したパスワードを入力してください。インストール完了後は3.で作成したフォルダは削除してかまいません。


注意
----
- インストール先フォルダの取得にシステム環境変数 `SOPC_KIT_NIOS2` を参照しています。  
PCに複数のバージョンをインストールしている場合は、実行前に `SOPC_KIT_NIOS2` のパスがインストールしたQuartusPrimeのフォルダになっているか確認してください。


SBTの不具合
----------
**QuartusPrime 20.1.1で修正されました。** 以下の操作は20.1.1以降では不要です。  
19.1～20.1を2020年6月以降(?)のWindowsUpdateを適用した環境ではSBTのビルドが通らなくなる問題が確認されています。今のところ下記の修正で対策可能です。  

1. アプリケーションフォルダのMakefileの326行付近
```
APP_LDFLAGS += -msys-lib=$(call adjust-path-mixed,$(SYS_LIB))
　↓
APP_LDFLAGS += -msys-lib=$(SYS_LIB)
```
2. 同じく132行付近
```
BUILD_PRE_PROCESS :=
　↓
BUILD_PRE_PROCESS := touch $(ELF).srec
```
3. BSP生成を行った後は**必ずBSP側でビルドを実行すること**。  
アプリ側のビルド内でBSPビルドが走ると、パスの扱いの違いからリンカ時に-msys-crt0のオプションでエラーが出ます。


ドキュメント
-----------
- [Nios II Software Developer Handbook](https://www.intel.com/content/www/us/en/programmable/documentation/lro1419794938488.html)


ライセンス
---------
[The MIT License (MIT)](https://opensource.org/licenses/MIT)  
Copyright (c) 2020,2022 J-7SYSTEM WORKS LIMITED.
