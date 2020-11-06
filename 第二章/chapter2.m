clc;clear
%%
%˵����
%ѡ���������ź󣬽���Ӧ��Ŀ�Ĵ��۲�������";"ȥ�������м��ɵõ������д��ڵ����
%%
%�������������ţ�
number = 4;
%%
switch number
    case 1  
        %%��һ
        syms s t %����������ű��� s �� t
        A = [-3,1;1,-3];
        FS = inv(s*eye(2)-A); %��Ԥ����� FS s = ? ( ) I A ?1�� eye(2)Ϊ 2x2 ��λ����
        eAt = ilaplace(FS,s,t); %��������˹���任
        eAt = simplify(eAt); %������ʽ
        eAt;
        %%����
        syms t
        A = [-3 1; 1 -3];
        eAt = expm(A * t);
        eAt = simplify(eAt);
        eAt;
    case 2 
        syms z k
        G = [0 1; -0.2 -0.9];
        Fz = (inv(z*eye(2)-G))*z;
        Fk = iztrans(Fz, z, k);
        Fk = simplify(Fk);
        Fk;
    case 3  
        r = dsolve('Dv=-3*v+w, Dw=v-3*w', 'v(0)=1, w(0)=0');
        x1=r.v;
        x2=r.w;
        x1;
        x2;
    case 4  
       %% (1)
       A = [-3 1; 1 -3];
       B = [0 1; 1 0];
       C = [1 0; 0 1];
       D = [0 0; 0 0];
       x0 = [1; 1];
       step(A, B, C, D, x0);
       grid
       clear clc
       %% (2)
       A = [-3 1; 1 -3];
       B = [0 1; 1 0];
       C = [1 0; 0 1];
       D = [0 0; 0 0];
       x0 = [1; 1];
       t = 0:0.01:2;
       LT = length(t);
       u1 = ones(1, LT);
       u2 = ones(1, LT);
       u = [u1; u2];
       lsim(A, B, C, D, u, t, x0)
       grid
    case 5 % ����������������
      T = 0.1;
      G = [1.0187 0.0906; -0.1 1];
      G = [0.9953, 0.0906; -0.0906, 0.8187];
      H = [0.0047; 0.0906];
      C = [1 0];
      D = 0;
      [yd, x, n] = dstep(G, H, C, D);
      for k=1:n
          plot([k-1, k-1], [0, yd(k), 'k'])
          hold on
      end
      e = 1-yd;
      for k=1:n
          for j=1:100
              u(j+(k-1)*100)=e(k);
          end
      end
      t = (0:0.01:n-0.01)*T;
      [yc] = lsim([0 1;0 -2],[0;1], [1 0], [0], u, t);
      plot(t/T, yc, ':k')
      axis([0 80 0 1])
      hold off
    case 6
        syms T
        A = [0 1; 0 -2];
        B = [0; 1];
        [G, H] = c2d(A, B, T')
end