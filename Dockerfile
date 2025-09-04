FROM osrf/ros:humble-desktop-full
SHELL ["/bin/bash", "-c"]

# pkg install
RUN apt-get update && apt-get install -y --no-install-recommends \
    git python3-pip vim xterm less wget python3-colcon-common-extensions python3-rosdep x11-apps \
    # Install ROS2 related packages
    ros-humble-rmw-cyclonedds-cpp \
    # For Intel Realsense
    ros-humble-librealsense2* \
    ros-humble-realsense2-* \
    # For navigation2
    ros-humble-nav2-bringup \
    # For moveit!
    ros-humble-moveit-ros-visualization \
    ros-humble-moveit-resources-panda-moveit-config \
    ros-humble-topic-based-ros2-control

RUN rosdep update

WORKDIR /root/melon_ws
COPY ./melon_ws/src ./src
RUN rosdep install --from-paths src --ignore-src -r -y
RUN . /opt/ros/humble/setup.sh && colcon build --symlink-install

RUN echo "# ROS2 setup" >> ~/.bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc
RUN echo "export ROS_DOMAIN_ID=80" >> ~/.bashrc
RUN echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc
RUN echo "source /root/melon_ws/install/setup.bash" >> ~/.bashrc
