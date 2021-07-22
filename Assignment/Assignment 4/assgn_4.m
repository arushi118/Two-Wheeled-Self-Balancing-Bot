mc= 1.5;
mp= 0.5;
g = 9.82;
L = 1;
d1= 0.01;
d2= 0.01;
A = [0,0,1,0;0,0,0,1;0,(g*mp)/mc,-d1/mc,-d2/(L*mc);0,(g*(mc+mp))/(L*mc),-d1/(L*mc),-(d2*(mc+mp))/(L*L*mc*mp)];
B = [0;0;1/mc;1/(L*mc)];
%C = [0,1,0,0];        %having q2 as output makes the sys non-observable as
%                       obs comes out to be 3 but having q1 as output
%                       makes the sys observable i.e obs comes out to be 4.
C= [1,0,0,0];
D = 0;
x0=[0; 5*pi/180; 0 ; 0];
