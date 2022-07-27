# ROS-Jackal-Data_Collection-Local


## Description
The purpose of the project is to collect human demonstration data for the simulated BARN dataset. **User is required to run the simulation on Ubuntu 18.04.**


## Instruction
> Download the setup script
- Git clone this repository to your computer
- `cd` into the directory on your local machine and run `./start_script.sh` in the terminal. `sudo` might be required if dependencies are not installed
- After setting up, it will prompt the user to choose a world map to run

> Drive the Jackal Bot
- Connect your Xbox One controller. Use jstest to find your device. Change `joy_dev` path in `src/jackal/jackal_control/launch/teleop.launch` if needed, default is `/dev/input/js4`. 
- When the Gazebo is opened by the script, user should see a goal (green spot) on the oppsite side of the Jackal bot
    - User can press `Shift` and hold left click and drag to adjust the camera angle
- Drive the Jackal Bot to the goal using the controller. For Xbox controllers, press A while pushing the left joystick to drive in low speed. Press B while pushing the left joystick to drive faster.
    - When Jackal reaches the goal, Gazebo will stop and exit by itself in a few seconds.
- In the local directory, go to `src/jackal_simulator/jackal_gazebo/bagfile` and you will see a bagfile. 
