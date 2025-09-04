# Melon Robot with Isaac Sim and ROS2 Humble

このリポジトリには、モバイルマニピュレータであるMelonをROS2 HumbleとIsaac Sim5.0.0環境でシミュレーションするためのROS2パッケージとUSDファイルが含まれています。<br>
Isaac Simは、[こちらのリポジトリ]を使用して環境構築してください。

## インストール

### Isaac Simコンテナ内でのセットアップ

```shell
git clone https://github.com/SSatoya/melon_ros2.git
cd melon_ros2
```

USDファイルをダウンロードするには以下を実行してください:

```shell
./install.sh
```

### ROS2 Dockerコンテナの作成

Melonのnavigationやmoveitを起動するROS2環境のコンテナを作成します。<br>
以下のコマンドを実行することでコンテナを作成することができます。

```shell
git clone https://github.com/SSatoya/melon_ros2.git
cd melon_ros2
./build.sh
```
- 以下の点に注意してください：
  - GPU：必須
  - ROS_DOMAIN_ID：(default)80
    - 変更したい場合は、`Docker`ファイル内の該当箇所を書き換えてbuildするか、コンテナ内の`.bashrc`を書き換えてください。
  

## 使用方法

### ロボットビジュアライゼーション

```bash
# RViz2でロボットモデルを表示
ros2 launch melon_description display.launch.py
```

### MoveIt!による動作計画

```bash
# MoveIt!の起動
ros2 launch melon_moveit_config melon_moveit.launch.py
```

### Navigation2による自律移動

```bash
# Navigation2スタックの起動
ros2 launch melon_navigation2 navigation.launch.py
```
