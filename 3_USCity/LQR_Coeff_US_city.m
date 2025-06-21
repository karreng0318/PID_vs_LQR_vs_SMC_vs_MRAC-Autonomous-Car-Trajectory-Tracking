Iz = 4000; %kg*m^2
la = 1.4; %m
lb = 1.6; %4
h = 0.35; %m
m = 2000; %m
tw = 1.4; %m
Cf = 2*12000; % N/rad
Cr = 2*11000; %N/rad
v = 5;

temp1 = -(Cf + Cr)/(m);
temp2 = -(la*Cf - lb*Cr)/v;
temp3 = -(la^2*Cf + lb^2*Cr)/(Iz*v) ;

A = [0,1,0,0; 0, temp1/v, -temp1, temp2/m;0,0,0,1;0,temp2/Iz,-temp2*v/Iz,temp3 ];
B = [0;Cf/m;0;la*Cf/Iz];
C = [0;temp2/m - v;0;temp3];
Q = 2*[10,0,0,0;0,0,0,0;0,0,10000,0;0,0,0,0];
R = 10000;
K = lqr(A,B,Q,R);