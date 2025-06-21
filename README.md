
# PID_vs_LQR_vs_SMC_vs_MRAC-Autonomous-Car-Trajectory-Tracking
Comparison of PID, LQR Linear Quadratic Regulator, SMC Sliding Mode Controller, MRAC-Model Reference Adaptive Controller for Autonomous Car Trajectory Tracking
This project compares four commonly used trajectory tracking controllers under different driving scenarios:
- PID – Proportional-Integral-Derivative Controller
- LQR – Linear Quadratic Regulator
- SMC – Sliding Mode Controller
- MRAC – Model Reference Adaptive Controller

The goal is to gain hands-on experience in implementing and tuning these controllers within a simulated autonomous vehicle environment using MATLAB/Simulink. The following toolboxes were utilized:
- Vehicle Dynamics Toolbox – to simulate realistic car behavior
- Automated Driving Toolbox – to visualize the tracking performance
Three different maneuvers have been picked for this project:
	Low Speed Curved trajectory
	High Speed Curved trajectory
	US City maneuver (varying vehicle speed)

The controller is divided into two parts:
- Longitudinal Controller – for acceleration and braking (reused)
- Lateral Controller – the focus of this project (custom-built)
 
The simulation setup, except the lateral controller, was adapted from a MathWorks repository: https://www.mathworks.com/matlabcentral/fileexchange/77798-vehicle-path-tracking-using-pure-pursuit-controller 
Key reused components include:
- Waypoint generator
- Target velocity profile
- 3DOF vehicle dynamics model
- Driveline and powertrain simulation
- Longitudinal driver (acceleration/brake logic)
- Visualization tools

The original Pure Pursuit controller was replaced with the custom controllers designed for this project. 
 
The main components of this block are:
	Lateral Error calculation: This function takes in the current ego vehicle pose, waypoints and the current vehicle speed to calculate the cross track and heading error of the vehicle. The error is calculated by looking at the nearest waypoint from the vehicle and determining the perpendicular distance from the vehicle to the nearest waypoint. Along with this, it calculates the heading error by taking the current vehicle yaw and the slope of the waypoint at the identified nearest waypoint. 

			
LQR Controller – Wrote a custom function from to execute the controller. The LQR gain is pre-computed offline using a custom written script for the given vehicle speed by setting up Infinite Horizon optimization problem and using Simulink’s library to solve the Riccati equation. The primary reason to pre-compute the LQR gain was to avoid solving the Riccati equation online as the existing MATLAB libraries did not support online simulation of the block. Linear Bicycle model has been used to set up this controller. 
 
Sliding Mode Controller – A custom defined Sliding Mode controller function has been written here. Linear Bicycle model has been used to set up this controller. Different sliding surfaces were chosen for the fixed speed case and the US City driving case. 

Model Reference Adaptive Controller – Custom defined Controller function has been written here using Linear Bicycle Model. 

 
#Project Results and Potential Opportunities

Key Challenges Encountered:
- LQR Controller: Solving the Riccati equation online was difficult, so ended up calculating the gain offline for a fixed vehicle speed. This led to a sub-optimal performance for US City driving which has a varying vehicle speed. 
- SMC: Defining effective sliding surfaces and tuning gains were difficult, especially for US City which has varying vehicle speed. 
- MRAC: Reference model selection for US City driving and the tuning was nontrivial.
- AI-Based Controllers: Due to time constraints, reinforcement learning or neural network controllers could not be implemented.

The tuning of US City driving was particularly challenging and had to come up with different sliding surface for SMC and had to use different Reference model for MRAC. The low speed and high speed was just a Model Reference Controller without any Adaptive laws whereas for the US City driving, the Adaptive part had to be added to improve performance. 

 # Tools Used
 - MATLAB 2024b
 - All controllers are written using MATLAB functions and can be converted to any language of choice if needed
 
