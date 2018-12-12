function [T1_gu,R1_gu, T2_gu,R2_gu] = My_PARC(X,Y,Z)
% PARC �㷨ʵ��
%
% ���������
%{
%   1��S1 �� X �� PARC-1 ��ɢ�����͹۲����
        S1 =    [ 0, 0
                  1, 0 ];
%   2��S2 �� Y �� PARC-2 ��ɢ�����͹۲����
        S2 =    [ 0, 1
                  0, 0 ];
%   3��S3 �� Z �� PARC-3 ��ɢ�����͹۲����
        S3 =    [ -1, -1
                   1,  1 ];
% ע������˳���ܵߵ������������㷨������ǰ������˳�����ģ�
%}
% ���������
%   1��T1_gu,R1_gu ��һ��⣬����
%           R = R22 * R1_gu, T = T11 * T1_gu;
%           ���У�R22 �� T11 �ǲ�֪���ģ���ͨ��������ʽ��á�
%   2��T2_gu,R2_gu ����һ��⣬����
%           R = R11 * R2_gu, T = T22 * T2_gu;
%           ���У�R11 �� T22 �ǲ�֪���ģ���ͨ��������ʽ��á�
% ���ˣ���Զ����Ѿ���ɡ���ֻ��עɢ�������е���Թ�ϵ����Ϳ����ˡ�
% ���Ҫ���Ǿ��������Լ�Ϊ���䶨��������������Ҫ����һЩ����������ʡ�ԣ�������ģ�
%
% �������� 2017.11.16. 19:13


%% �� R22 ��һ�� R ���� T11 ��һ�� T �Ľⷨ
Q1 = ( Z(1,1)/Z(2,1) - X(1,1)/X(2,1) ) / ( Z(1,1)/Z(2,1)*Y(2,2)/Y(1,2) -1 );
R1_gu = [       Q1      ,   Q1*Y(2,2)/Y(1,2);
          X(1,1)/X(2,1) ,       1               ];
R1_gu = R1_gu.';% ע�⣺�ҵļ�������ģ����R��û��ת�õģ���ԭʼ���ײ�ͬ���������Ľ����ԭʼ�����б���ʽ��ת�ã�����������ǰת���ˣ�������

Q2 = ( Z(1,2)/Z(1,1) - X(2,2)/X(2,1) ) / ( 1 - Z(1,2)/Z(1,1)*Y(1,1)/Y(1,2) );
T1_gu = [           1       ,   X(2,2)/X(2,1);
           Q2*Y(1,1)/Y(1,2) ,        Q2         ];


%% �� R11 ��һ�� R ���� T22 ��һ�� T �Ľⷨ
Q3 = ( Z(2,1)/Z(1,1) - Y(2,2)/Y(1,2) ) / ( Z(2,1)/Z(1,1)*X(1,1)/X(2,1) - 1 );
R2_gu = [           1           , Y(2,2)/Y(1,2);
            Q3*X(1,1)/X(2,1)    ,       Q3          ];
R2_gu = R2_gu.';% ����Ҳһ����ͬ R1_gu ������

Q4 = ( Z(1,1)/Z(1,2) - Y(1,1)/Y(1,2) ) / ( 1 - Z(1,1)/Z(1,2)*X(2,2)/X(2,1) );
T2_gu = [       Q4          , Q4*X(2,2)/X(2,1);
          Y(1,1)/Y(1,2)     ,           1           ];


end