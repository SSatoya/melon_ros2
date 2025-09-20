FROM osrf/ros:humble-desktop-full
SHELL ["/bin/bash", "-c"]

# pkg install
RUN apt-get update && apt-get install -y --no-install-recommends \
    git python3-pip vim xterm less wget python3-colcon-common-extensions python3-rosdep x11-apps \
    # Install ROS2 related packages
    ros-humble-rmw-fastrtps-cpp \
    # For Intel Realsense
    ros-humble-librealsense2* \
    ros-humble-realsense2-* \
    # For navigation2
    ros-humble-nav2-bringup \
    # For moveit!
    ros-humble-moveit-ros-visualization \
    ros-humble-moveit-resources-panda-moveit-config \
    ros-humble-topic-based-ros2-control

# dds_config (For Fast DDS)
COPY ./dds_config/fastdds.xml /root/fastdds.xml

WORKDIR /root/melon_ws
COPY ./melon_ws/src ./src

# rosdep
RUN rosdep update --rosdistro=humble && \
    rosdep install --from-paths src --ignore-src -r -y

# Build workspace
RUN source /opt/ros/humble/setup.sh && colcon build --symlink-install

# Build arguments (default values)
ARG ROS_DOMAIN_ID=80
ENV ROS_DOMAIN_ID=${ROS_DOMAIN_ID}


RUN echo '# ROS2 setup' >> ~/.bashrc && \
    echo 'source /opt/ros/humble/setup.bash' >> ~/.bashrc && \
    echo 'export ROS_DOMAIN_ID=${ROS_DOMAIN_ID}' >> ~/.bashrc && \
    echo 'export RMW_IMPLEMENTATION=rmw_fastrtps_cpp' >> ~/.bashrc && \
    echo 'export FASTRTPS_DEFAULT_PROFILES_FILE=/root/fastdds.xml' >> ~/.bashrc && \
    echo 'source /root/melon_ws/install/setup.bash' >> ~/.bashrc

