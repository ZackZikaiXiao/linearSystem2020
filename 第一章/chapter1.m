clc;clear
%%
%说明：
%选择仿真例题号后，将对应题目的待观察变量后的";"去掉，运行即可得到命令行窗口的输出
%%
%请输入仿真例题号：
number = 1;
%%
switch number
    case 1  % 传递函数
        num = [1 3 1];
        den = [1 2 4 6];
        G = tf(num, den);
        G;
    case 2  % 零极点传函
        z = 3;
        p = [1 -2 -4];
        k = 7;
        sys = zpk(z, p, k);
        sys;
    case 3  % 建立系统的状态空间模型
        A = [0 1; -2 -3];
        B = [1 0; 1 1];
        C = [1 0; 1 1; 0 2];
        D = [0 0; 1 0; 0 1];
        sys = ss(A, B, C, D);
        sys;
    case 4  % 串联、并联、反馈
        %% 传函
        sys1 = tf([3 1], [1 3 2]);
        sys2 = tf([1 4], [1 2]);
        sysSeries = series(sys1, sys2);
        sysParallel = parallel(sys1, sys2);
        sysFeedback = feedback(sys1, sys2, -1);
        sysSeries;
        sysParallel;
        sysFeedback;
    case 5 % 串联、并联、反馈
        %% 状态空间
        A = [0 1 0; 0 0 1; -4 -8 -5];
        B = [0; 0; 1];
        C = [1 0 0];
        D = 0;
        sys1 = ss(A, B, C, D);
        A = [0 1; -2 -3];
        B = [0; 1];
        C = [1 0];
        D = 0;
        sys2 = ss(A, B, C, D);
        sysSeries = series(sys1, sys2);
        sysParallel = parallel(sys1, sys2);
        sysFeedback = feedback(sys1, sys2, -1);
        sysSeries;
        sysParallel;
        sysFeedback;
    case 6  % 传函与状态空间模型的转化
        %% 传递函数到状态空间
        num = [1 3 1];
        den = [1 2 4 6];
        G = tf(num, den);
        sys = ss(G);
        sys;
    case 7 % 传函与状态空间模型的转化
        %% 状态空间到传递函数
        A = [0 1; -2 -3];
        B = [1 0; 1 1];
        C = [1 0; 1 1; 0 2];
        D = [0 0; 1 0; 0 1];
        sys = ss(A, B, C, D);
        G = tf(sys);
        G;
    case 8 % 线性变换
        %% 特征值和特征向量
        A = [2 -1 -1; 0 -1 0; 0 2 1];
        [eigenVector, eigenValue] = eig(A);
    case 9 % 线性变换
        %% 约旦矩阵
        A = [0 1 0; 0 0 1; 8 -12 6];
        [eigenVector, Jordan] = jordan(A);
        eigenVector;
        Jordan;
    case 10 %线性变换
        %% 约旦标准型
        A = [0 1 0; 0 0 1; 8 -12 6];
        B = [5; 1; 5];
        C = [1, 0, 1];
        D = 0;
        sys = ss(A, B, C, D);
        [P, J] = jordan(A);
        GP = ss2ss(sys,inv(P));
end