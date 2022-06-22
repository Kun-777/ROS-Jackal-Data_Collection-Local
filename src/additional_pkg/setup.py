from distutils.core import setup
from catkin_pkg.python_setup import generate_distutils_setup

setup(
    version='0.0.0',
    scripts=['src/check_goal_node.py'],
    packages=['additional_pkg'],
    package_dir={'': 'src'}
)
