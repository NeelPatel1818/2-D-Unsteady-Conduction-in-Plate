%CASE STUDY on 2-D Unsteady Heat Conduction in Square Copper Plate.
clear all
clc

%% Defining the Variables 
L = input('L = ') ; %Length of Plate 
n = input('n = '); %Nodes
dx = input('dx = ');%L/(n-1); %Grid spacing in x    %Assuming that our plate is square.
dt = input('dt = ');
x = linspace(0,L,n); %Grid points in x
y = linspace(0,L,n); %Grid points in y 
alpha = 113/1000000; %Thermal Diffusivity of Copper

%% Maximum Time to be Iterated
T_max = input('T_max = ');

%% Initial Temperature Matrix Values
T = zeros(n,n);

%% Boundary Conditions
T(:,1) = input(' Left Side Node Temp Value = ');
T(:,n) = input(' Right Side Node Temp Value = ');
T(1,:) = input(' Upper Side Node Temp Value = ');
T(n,:) = input(' Bottom Side Node Temp Value = ');

%% Y;X;Time Looping 
for t = 0:T_max
  for i = 2:n-1
      for j = 2:n-1
    T_w = T(i-1,j);
    T_p = T(i,j);
    T_e = T(i+1,j);
    T_n = T(i,j-1);
    T_s = T(i,j+1);
    T(i,j) = T_p+(alpha*dt/(dx^2))*(T_e-4*T_p+T_w+T_s+T_n);   
      end     
  end
end

%% Plotting
contourf(T,1000,'edgecolor','none')
colormap jet
colorbar
xlabel('Distance in X')
ylabel('Distance in Y')
title('Temperature Profile of a Square Plate')