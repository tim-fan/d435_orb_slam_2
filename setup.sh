#!/bin/bash

#script to setup and build catkin workspace
#containing this package, realsense driver and 
#orb_slam_2_ros

set -o errexit

WS_DIR="./catkin_ws"
ROS_DISTRO="kinetic"
SRC_DIR=${WS_DIR}/src
mkdir -p ${SRC_DIR}

#system deps
sudo apt install python-wstool python-catkin-tools ros-kinetic-cmake-modules protobuf-compiler autoconf

#create catkin workspace
catkin init -w ${WS_DIR}
catkin config --extend /opt/ros/${ROS_DISTRO} -w ${WS_DIR}
catkin config --cmake-args -DCMAKE_BUILD_TYPE=Release -- -w ${WS_DIR}
catkin config --merge-devel -w ${WS_DIR}

#use wstool to clone source packages
wstool init ${SRC_DIR}
wstool set d435_orb_slam_2 --git https://github.com/tim-fan/d435_orb_slam_2.git -y -t ${SRC_DIR}
wstool update -t ${SRC_DIR}
wstool merge ${SRC_DIR}/d435_orb_slam_2/dependencies.rosinstall -t ${SRC_DIR}
wstool merge ${SRC_DIR}/d435_orb_slam_2/dependencies_voxblox.rosinstall -t ${SRC_DIR}
wstool update -t ${SRC_DIR}

#install ros deps
rosdep install --from-paths ${SRC_DIR} --ignore-src -y --rosdistro ${ROS_DISTRO}

#build
catkin build -w ${WS_DIR}
