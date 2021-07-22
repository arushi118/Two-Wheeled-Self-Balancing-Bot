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

sys=ss(A,B,C,D)        %builds a state-space model

obs=rank(obsv(sys))    %gives the value 4(observable) for q1 as output
ctr=rank(ctrb(sys))    %gives the value 4(controllable) 

% stablize system using lqr method
Q= [1 0 0 0;
    0 0 0 0;
    0 0 1 0;
    0 0 0 1];
R= 1;
K1=lqr(A,B,Q,R)
eig=(A-B*K1)
A1=A-B*K1
sys_lqr=ss(A1,B,C,D);
p=pole(sys_lqr);                     % all are negative as the sys is now stable
z=zero(sys_lqr);
s=isstable(sys_lqr);                 %gives s=1 as now the system is stable
rlocus(sys_lqr);


%stablize system using pole place meny method
eigs=[-1.1;-1.2;-1.3;-1.4];          % to tell that where do we want our poles to be as poles=eigs
K2=place(A,B,eigs)
A2=A-B*K2;
sys_pole=ss(A2,B,C,D);
p=pole(sys_pole)                     % all are negative as the sys is now stable
z=zero(sys_pole);
s=isstable(sys_pole);                 %gives s=1 as now the system is stable
rlocus(sys_pole);


x0=[0; 5*pi/180; 0 ; 0];
% des_pole=[-3;-3;-3;-3];
% K=acker(A,B,des_pole)
% 
% Q=eye(4)
% R=1;
% K_lqr=lqr(A,B,Q,R)


%the simulink models the eqn x_dot= (A-B*K)x in the subsystem. then we
%added the controller (used K1 but could have used K2 also) to stablize the
%system such that now all the values are converging to 0 whereas in the
%uunstable system all the values were tending to infinity.
