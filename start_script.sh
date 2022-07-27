#!/bin/bash

apt update && apt install -y curl
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
apt update
apt install -y ros-melodic-desktop-full
source /opt/ros/melodic/setup.bash
apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
rosdep init
rosdep update
rosdep install --from-paths . --ignore-src --rosdistro=melodic
catkin_make; source devel/setup.bash
WORLD_FILES=${PWD}/src/jackal_simulator/jackal_gazebo/worlds

varrun=true

while [ $varrun ]
do
    echo "Please select a BARN environment to test: 1. Static 2. Dynamic"
    read barnEnv
    if [ $barnEnv == "1" ]
    then
        printf "*****Static BARN*****\nFrom 0 - 299, choose a map to test: "
        read varmap
        world=world_files/world_${varmap}.world
        roslaunch jackal_gazebo jackal_world.launch config:=front_laser gui:=true world_name:=$WORLD_FILES/${world}
    else
        printf "*****Dynamic BARN*****\nFrom 0 - 59, choose a map to test: "
        read varmap
        world=dyna_world_files/world_${varmap}.world
        export GAZEBO_PLUGIN_PATH=${PWD}/src/jackal_simulator/jackal_gazebo/worlds/all_cylinder_plugins/
        roslaunch jackal_gazebo dyna.launch config:=front_laser gui:=true world_name:=$WORLD_FILES/${world}
    fi
    echo "Do you want to test another one (Y/N): "
    read testagain

    if [ $testagain == "N" -o $testagain == 'n' ]
    then
        break
    fi
done




