#!/usr/bin/env python3

from logging.config import listen
from operator import truediv
import sys
import rospy 
import geometry_msgs.msg 
from geometry_msgs.msg import *
from std_msgs.msg import String
from nav_msgs.msg import Odometry
from gazebo_msgs.srv import GetModelState
from gazebo_msgs.srv import SetModelState
from gazebo_msgs.msg import ModelState

import random

my_jackal = (0,0)

def random_goal():
    x_pose = random.uniform(-4.0,0.0)
    y_pose = random.uniform(9.0,10.0)
    print(x_pose)
    print(y_pose)
    state_msg = ModelState()
    state_msg.model_name = 'goal'
    state_msg.pose.position.x = x_pose
    state_msg.pose.position.y = y_pose
    rospy.wait_for_service('/gazebo/set_model_state')
    try:
        set_state = rospy.ServiceProxy('/gazebo/set_model_state', SetModelState)
        resp = set_state( state_msg )

    except rospy.ServiceException as e:
        print ("setup failed")


def get_goal():
  try:
      model_coordinates = rospy.ServiceProxy('/gazebo/get_model_state', GetModelState)
      resp_coordinates = model_coordinates('goal','')
      print(resp_coordinates.pose.position.x)
      print(resp_coordinates.pose.position.y)
      current_goal_x = 0;
      current_goal_y = 0
      current_goal_x = resp_coordinates.pose.position.x
      current_goal_y = resp_coordinates.pose.position.y
      return [current_goal_x, current_goal_y]
  except rospy.ServiceException as e:
      rospy.loginfo("Get Model State service call failed:  {0}".format(e))
    


def arrival_gaol(jackal_x, jackal_y, goal_x, goal_y):
    if abs(jackal_x - goal_x) < 0.3 and abs(jackal_y - goal_y) < 0.3 :
        return True
    else:
        return False

def callback(data):
    global my_jackal
    
    #rospy.loginfo(rospy.get_caller_id() + "I heard %s", data.data)
    
    current_pose = data.pose.pose

    current_x = current_pose.position.x
    current_y = current_pose.position.y
    my_jackal = (current_x, current_y)
    # print(f"current x and y coordinate: %0.4f , %0.4f" %(current_x, current_y))

def listener():
    random_goal()
    goal_x, goal_y = get_goal()
    print(f"current x and y coordinate: %0.4f , %0.4f" %(goal_x, goal_y))
    arrived = False
    
    while not rospy.is_shutdown() and not arrived:
        rospy.sleep(0.1)
        rospy.init_node('listener',anonymous=True)
        rospy.Subscriber('/ground_truth/state', Odometry, callback)
    
        if arrival_gaol(my_jackal[0], my_jackal[1], goal_x, goal_y):
            arrived = True
        # print(type(my_data))

    print("reach goal")
    exit(1)
    
  



if __name__ == '__main__':
    listener()
    

