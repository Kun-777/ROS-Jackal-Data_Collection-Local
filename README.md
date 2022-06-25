# ROS-Jackal-Data_Collection-Local


## Description
The purpose of the project is to collect the user Jackal Bot driving data. **User is required to use a Linux system base computer** to run the setup script.


## Instruction
> Download the setup script
- Git clone this repository to your computer 
- `cd` into the directory on your local machine and run `.\start_script.sh` in the terminal
- After setting up, you will see prompt in the terminal asking user to input a number between 0 - 299 for choosing a world map to run

> Drive the Jackal Bot
- When the Gazebo is opened by the script, user should see a goal (green spot) on the oppsite side of the Jackal bot (The goal is randomly generated so it will be different everytime)
    - User can press `Shift` and left click to adjust the camera angle inside Gazebo
- Drive the Jackal Bot to the goal
    - When Jackal reach goal, Gazebo will stop and exit by itself in a few seconds.
- In the local directory, go to `src\jackal_simulator\jackal_gazebo\bagfile` and you will see a bagfile. Rename the bagfile to the world number that you entered and put it this spread sheet  

