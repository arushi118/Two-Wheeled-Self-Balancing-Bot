mc= 1.5;
mp= 0.5;
g = 9.82;
L = 1;
d1= 0.01;
d2= 0.01;
A = [0,0,1,0;
    0,0,0,1;
    0,(g*mp)/mc,-d1/mc,-d2/(L*mc);
    0,(g*(mc+mp))/(L*mc),-d1/(L*mc),-(d2*(mc+mp))/(L*L*mc*mp)];
B = [0;0;1/mc;1/(L*mc)];
C = [0,1,0,0];          %for q2 as output
% C = [1,0,0,0]         for q1 as output
D = 0;
sys=ss(A,B,C,D)        %builds a state-space model


p=pole(sys)            % pole:frequency at which the denominator of the transfer sys=0  (if (-)ve then sys is stable)
%eig(A)                 % same as pole; poles correspond to the freq domain and eigen values correspond to the state-space domain.
z=zero(sys)            % zero:frequency at which the numerator of the transfer sys=0  (if (-)ve then sys is stable)
s=isstable(sys)        % if s=0:sys not stable ; if s=1:sys is stable
pzmap(sys)             % plots zero pole map:shows the location in the complex plane of the poles and zeros of the transfer function         
tf_sys=tf(sys)         % converts ss model to tranfer fn(mathematical function which models the device's output for each possible input)
[a,b]=ss2tf(A,B,C,D)   % gives a=num of tf & b=den of tf

zpk_sys=zpk(sys)       % gives the zero-pole gain model of the system