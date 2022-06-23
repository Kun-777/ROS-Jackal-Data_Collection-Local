#!/bin/bash

apt update && sudo apt install -y curl
sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
apt update
apt install -y ros-melodic-desktop-full
source /opt/ros/melodic/setup.bash
apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
rosdep init
rosdep update
rosdep install --from-paths . --ignore-src --rosdistro=melodic
catkin_make; source devel/setup.bash
WORLD_FILES=${PWD}/src/jackal_simulator/jackal_gazebo/worlds/world_files

varrun=true

while [ $varrun ]
do
    echo "From 0 - 299, choose a map to test: "
    read varmap
    world=world_${varmap}.world
    roslaunch jackal_gazebo jackal_world.launch config:=front_laser gui:=true world_name:=$WORLD_FILES/${world}
    echo "Do you want to test another one (Y/N): "
    read userchoice 

    if [ $userchoice == "N" -o $userchoice == 'n' ]
    then
        break
    fi
done




