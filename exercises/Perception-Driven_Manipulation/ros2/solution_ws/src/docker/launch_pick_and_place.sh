#!/bin/bash

source /opt/pick_and_place/install/setup.bash
ros2 launch pick_and_place_application application_setup.launch.py use_sim_robot:=false robot_ip:=192.168.2.100

