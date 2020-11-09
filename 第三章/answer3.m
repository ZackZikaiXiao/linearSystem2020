clc;clear
%%
%说明：
%选择仿真例题号后，将对应题目的待观察变量后的";"去掉，运行即可得到命令行窗口的输出
%%
%请输入仿真例题号：
number = 2;
%%
switch number
    case 1  
        %%(1)
        A = [-2 2 -1;0 -2 0;1 -4 0];
        B = [0 0;0 1;1 0];
        C = [1 -1 2;-2 0 1];
        D = [0 0;0 0];
        sys = ss(A, B, C, D);
        G = tf(sys)
        %%(2)
        Qc = ctrb(A,B);
        rc = rank(Qc);
        L = size(A);
        if rc == L
            str = '系统能控'
        else
            str = '系统不能控'
        end
        %%(3) 能控
        
    case 2
        %%(1)
        A = [4 1 0 0;0 4 0 0;0 0 4 1;0 0 0 4];
        B = [1 0;0 1;1 -1;-2 0];
        C = [1 1 2 1;1 2 2 0];
        D = [0 0;0 0];
        sys = ss(A, B, C, D);
        G = tf(sys)
        %%(2)
        Qo = obsv(A,C);
        ro = rank(Qo);
        L = size(A);
        if ro == L
            str = '系统能观'
        else
            str = '系统不能观'
        end
        %%(3) 系统不能观
        [Ah Bh Ch P K] = obsvf(A, B, C)
    case 3
        %%(1)
        syms T;
        A = [0 1 0;0 0 1;2 -5 4];
        B = [1;0;0];
        [G, H] = c2d(A, B, T);
        %%(2)
        T = 0.1;
        [G, H] = c2d(A, B, T);
        %%(3)    
end