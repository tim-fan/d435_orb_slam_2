# d435_orb_slam

ROS package for running [orb_slam_2_ros](https://github.com/appliedAI-Initiative/orb_slam_2_ros) with a Realsense D435 RGBD camera.

Consists of a launch file to start the camera driver and orb slam node, and the following instructions for how to set it up.


```{bash}
WS_DIR="./catkin_ws"
ROS_VERSION="kinetic"
SRC_DIR=${WS_DIR}/src

mkdir -p ${SRC_DIR}
catkin init -w ${WS_DIR}
catkin config --extend /opt/ros/${ROS_VERSION} -w ${WS_DIR}

git clone https://github.com/tim-fan/d435_orb_slam.git
wstool init ${SRC_DIR}
wstool set orb_slam_2_ros --git https://github.com/appliedAI-Initiative/orb_slam_2_ros.git -y -t ${SRC_DIR}
wstool set realsense-ros --git https://github.com/IntelRealSense/realsense-ros.git -y -t ${SRC_DIR}
wstool update -t ${SRC_DIR}

```