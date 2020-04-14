# d435_orb_slam

ROS package for running [orb_slam_2_ros](https://github.com/appliedAI-Initiative/orb_slam_2_ros) with a [Realsense D435 RGBD camera](https://www.intelrealsense.com/depth-camera-d435/s).

Launch files are provided for both stereo and rgbd slam modes. (`slam_stereo.launch` and `slam_rgbd.launch` respectively). 
Stereo mode is recommended as it seems to perform much better than rgbd mode - feature depth estimates in rgbd mode appear very noisy (at least with the current configuration).

![screenshot](./doc/slam_screenshot.png)

**Figure**: screenshot of orb slam in action.

### Setup:
```{bash}
curl https://raw.githubusercontent.com/tim-fan/d435_orb_slam/master/setup.sh | bash
```
This will create a catkin workspace with all dependent packages. See [setup.sh](setup.sh) for details.

### Run:
```
source catkin_ws/devel/setup.bash
roslaunch d435_orb_slam slam_stereo.launch
```

Optional arguments allow for logging, playback, map loading and running in localisation only mode.
See `roslaunch d435_orb_slam slam_stereo.launch --ros-args` 