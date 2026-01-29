#!/bin/bash

source /opt/pick_and_place/install/setup.bash
ros2 launch pick_and_place_application application_setup.launch.py use_sim_robot:=${SNP_SIM_ROBOT:-false} robot_ip:=192.168.1.2
# ros2 launch pick_and_place_application application_setup.launch.py use_sim_robot:=${SNP_SIM_ROBOT:-true}

