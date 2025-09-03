# Melon Robot with Isaac Sim and ROS2 Humble

このリポジトリには、モバイルマニピュレータであるMelonをROS2 HumbleとIsaac Sim5.0.0環境でシミュレーションするためのROS2パッケージとUSDファイルが含まれています。
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

Coming Soon... 🚧


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
