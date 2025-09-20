# Melon Robot with Isaac Sim and ROS2 Humble

このリポジトリには、モバイルマニピュレータであるMelonをROS2 HumbleとIsaac Sim5.0.0環境でシミュレーションするためのROS2パッケージとUSDファイルが含まれています。<br>
Isaac Simは、[こちらのリポジトリ](https://github.com/momoiorg-repository/sim-common)を使用して環境構築してください。

## インストール

### Isaac Simコンテナ内でのUSDファイルのDL
- sim-commonを使用している場合は以下の処理は自動化されています。

```shell
git clone https://github.com/SSatoya/melon_ros2.git
cd melon_ros2
```

USDファイルをダウンロードするには以下を実行してください:

```shell
./install.sh
```

これにより、`/robot/assets/melon`内に`Collected_melon_v?`が作成されます

### ROS2 Dockerコンテナの作成

Melonのnavigationやmoveitを起動するROS2環境のコンテナを作成します。<br>

ROS_DOMAIN_IDとコンテナ名を指定するには、`.env`ファイルの中身を編集してください。

```shell
# .envファイルの例
ROS_DOMAIN_ID=80                      # ROSドメインID（デフォルト: 80）

CONTAINER_NAME=melon_ros2             # コンテナ名（デフォルト: melon_ros2）
```

以下のコマンドを実行することでコンテナを作成することができます。

```shell
git clone https://github.com/SSatoya/melon_ros2.git
cd melon_ros2
./build.sh
```

- 以下の点に注意してください：
  - GPU：必須

コンテナが作成されたら以下のコマンドで入り、colcon buildしてください

```shell
docker exec -it melon_ros2 bash
```
```shell
# コンテナ内
colcon build
source install/setup.bash
```
  
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
