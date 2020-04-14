# d435_orb_slam

ROS package for running [orb_slam_2_ros](https://github.com/appliedAI-Initiative/orb_slam_2_ros) with a Realsense D435 RGBD camera.

Consists of a launch file to start the camera driver and orb slam node, and the following instructions for how to set it up.

Launch files are provided for both stereo and rgbd slam modes. (`slam_stereo.launch` and `slam_rgbd.launch` respectively). 
Stereo mode is recommended as it seems to perform much better than rgbd mode - it looks like the depth estimates are too noisy in rgbd mode.

### Setup:
```{bash}
curl https://raw.githubusercontent.com/tim-fan/d435_orb_slam/master/setup.sh | bash
```

### Run:
```
source catkin_ws/devel/setup.bash
roslaunch d435_orb_slam slam_stereo.launch
```

Optional arguments allow for logging, playback, map loading and running in localisation only mode.
See `roslaunch d435_orb_slam slam_stereo.launch --ros-args` 