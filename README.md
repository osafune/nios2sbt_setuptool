NiosII SBT Setup Tool
=====================

NiosII SBT 19.1以降のセットアップをサポートするバッチファイルです。
以下の環境で確認しました。
- Windows 10 64bit
- QuartusPrime 20.1LE


使い方
-----
1. WindowsのWSLを有効にして、Ubuntu 18.04TLSをインストールします。  
[ここの手順](https://www.macnica.co.jp/business/semiconductor/articles/intel/133717/) の1と2（Ubuntuのインストールとアカウント作成）までを行います。
  
2. Eclipse C/C++ IDE for Mars.2を以下からダウンロードします。  
[eclipse-cpp-mars-2-win32-x86_64.zip](https://www.eclipse.org/downloads/download.php?file=/technology/epp/downloads/release/mars/2/eclipse-cpp-mars-2-win32-x86_64.zip)
  
3. Cドライブの適当な場所にフォルダを作成し、このリポジトリの `nios2sbt_setup.bat` `nios2sbt_setup.sh` および、ダウンロードした `eclipse-cpp-mars-2-win32-x86_64.zip` をコピーします。
  
4. `nios2sbt_setup.bat` をダブルクリックしてセットアップを開始します。  
WSL側のセットアップでパスワード入力を求められます。1.で作成したパスワードを入力してください。


注意
----
- インストール先フォルダの取得にシステム環境変数 `SOPC_KIT_NIOS2` を参照しています。  
PCに複数のバージョンをインストールしている場合は、実行前に `SOPC_KIT_NIOS2` のパスがインストールしたQuartusPrimeのフォルダになっているか確認してください。


ドキュメント
-----------
- [Nios II Software Developer Handbook](https://www.intel.com/content/www/us/en/programmable/documentation/lro1419794938488.html)


ライセンス
---------
[The MIT License (MIT)](https://opensource.org/licenses/MIT)  
Copyright (c) 2020 J-7SYSTEM WORKS LIMITED.