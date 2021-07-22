mc= 1.5
mp= 0.5
g = 9.82
L = 1
d1= 0.01
d2= 0.01
A = [0,0,1,0;
     0,0,0,1;
     0,(g*mp)/mc,-d1/mc,-d2/(L*mc);
     0,(g*(mc+mp))/(L*mc),-d1/(L*mc),-(d2*(mc+mp))/(L*L*mc*mp)]

B = [0;0;1/mc;1/(L*mc)]
C = [0,1,0,0]
D = 0
sys=ss(A,B,C,D)          % builds a state-space model
[a,b,c,d] = ssdata(sys)  % extracts the matrix data (A,B,C,D) from the space state model


A(3,2) = (g*mp)/mc;
A(3,3) = -d1/mc;
A(3,4) = -d2/(L*mc);
A(4,2) = (g*(mc+mp))/(L*mc);
A(4,3) = -d1/(L*mc);
A(4,4) = -(d2*(mc+mp))/(L*L*mc*mp);
B(3,1) = 1/mc;
B(4,1) = 1/(L*mc);

rlocus(sys)             % examining how the roots of a system change with variation gain within a feedback system. 
                        % The sys is not controllable by a p-controller as
                        % it has roots which are on the postivie side of
                        % the plane hence, it is an unstable system.
                 
%sisotool(sys)           %shows that the system is not controllable just by using the SISOtool