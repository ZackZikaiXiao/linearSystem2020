clc;clear
%%
%说明：
%选择仿真例题号后，将对应题目的待观察变量后的";"去掉，运行即可得到命令行窗口的输出
%%
%请输入仿真例题号：
number = 1.1;
%%
switch number
    case 1.1  
        num = [1 3 3 1];
        den = [1 2];
        G = tf(num, den);
        sys = ss(G);
        sys;
    case 1.2  
        num = [1 3 1];
        den = [1 2 1];
        G = tf(num, den);
        sys = ss(G);
        sys;
    case 1.3  
        num = [1 3 1];
        den = [1 2 1];
        G = tf(num, den);
        sys = ss(G);
        [A, B,C, D] = tf2ss(num, den);
        [P, J] = jordan(A);
        sysJon = ss2ss(sys,inv(P));
        sysJon;
    case 1.4  
        A = [0 1 0 0; -1 -1 1 1; 1 0 -3 0; -50 0 0 -2];
        B = [0; 0; 0; 10];
        C = [1 0 0 0];
        D = 0;
        sys = ss(A, B, C, D);
        G = tf(sys);
        G;
    case 1.5
        %% 状态空间
        A = [2 4; 4 2];
        B = [1 -1; -1 1];
        C = [2 0; 0 2];
        D = 0;
        sys1 = ss(A, B, C, D);
        A = [1 2; 4 3];
        B = [1 -1; 0 1];
        C = [1 0; 0 2];
        D = 0;
        sys2 = ss(A, B, C, D);
        sysSeries = series(sys1, sys2);
        sysParallel = parallel(sys1, sys2);
        sysFeedback = feedback(sys1, sys2, -1);
        sysSeries;
        sysParallel;
        sysFeedback;
        %% 传递函数(阵)
        G1 = tf(sys1);
        G2 = tf(sys2);
        sysSeries = series(G1, G2);
        sysParallel = parallel(G1, G2);
        sysFeedback = feedback(G1, G2, -1);
        sysSeries;
        sysParallel;
        sysFeedback;
end