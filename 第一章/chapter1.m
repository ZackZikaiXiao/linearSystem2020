clc;clear
%%
%˵����
%ѡ���������ź󣬽���Ӧ��Ŀ�Ĵ��۲�������";"ȥ�������м��ɵõ������д��ڵ����
%%
%�������������ţ�
number = 1;
%%
switch number
    case 1  % ���ݺ���
        num = [1 3 1];
        den = [1 2 4 6];
        G = tf(num, den);
        G;
    case 2  % �㼫�㴫��
        z = 3;
        p = [1 -2 -4];
        k = 7;
        sys = zpk(z, p, k);
        sys;
    case 3  % ����ϵͳ��״̬�ռ�ģ��
        A = [0 1; -2 -3];
        B = [1 0; 1 1];
        C = [1 0; 1 1; 0 2];
        D = [0 0; 1 0; 0 1];
        sys = ss(A, B, C, D);
        sys;
    case 4  % ����������������
        %% ����
        sys1 = tf([3 1], [1 3 2]);
        sys2 = tf([1 4], [1 2]);
        sysSeries = series(sys1, sys2);
        sysParallel = parallel(sys1, sys2);
        sysFeedback = feedback(sys1, sys2, -1);
        sysSeries;
        sysParallel;
        sysFeedback;
    case 5 % ����������������
        %% ״̬�ռ�
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
    case 6  % ������״̬�ռ�ģ�͵�ת��
        %% ���ݺ�����״̬�ռ�
        num = [1 3 1];
        den = [1 2 4 6];
        G = tf(num, den);
        sys = ss(G);
        sys;
    case 7 % ������״̬�ռ�ģ�͵�ת��
        %% ״̬�ռ䵽���ݺ���
        A = [0 1; -2 -3];
        B = [1 0; 1 1];
        C = [1 0; 1 1; 0 2];
        D = [0 0; 1 0; 0 1];
        sys = ss(A, B, C, D);
        G = tf(sys);
        G;
    case 8 % ���Ա任
        %% ����ֵ����������
        A = [2 -1 -1; 0 -1 0; 0 2 1];
        [eigenVector, eigenValue] = eig(A);
    case 9 % ���Ա任
        %% Լ������
        A = [0 1 0; 0 0 1; 8 -12 6];
        [eigenVector, Jordan] = jordan(A);
        eigenVector;
        Jordan;
    case 10 %���Ա任
        %% Լ����׼��
        A = [0 1 0; 0 0 1; 8 -12 6];
        B = [5; 1; 5];
        C = [1, 0, 1];
        D = 0;
        sys = ss(A, B, C, D);
        [P, J] = jordan(A);
        GP = ss2ss(sys,inv(P));
end