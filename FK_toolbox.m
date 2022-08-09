clc ;

% Link函数
L(1) = Link([1 2 3 4], 'modified') ;

L(1).RP; % 获取连杆关节类型
L(1).theta; % 获取连杆关节角
L(1).d; % 获取连杆偏距
L(1).a; % 获取连杆长度
L(1).alpha; % 获取连杆扭转角

% SerialLink函数
%         theta  d       a       alpha
L(1) = Link([0   162.5   0       pi/2],  'standard');
L(2) = Link([0   0      -425     0   ],  'standard');
L(3) = Link([0   0      -392.2   0   ],  'standard');
L(4) = Link([0   133.3   0       pi/2],  'standard');
L(5) = Link([0   99.7    0      -pi/2],  'standard');
L(6) = Link([0   99.6    0       0   ],  'standard');

six_link = SerialLink([L(1) L(2) L(3) L(4) L(5) L(6)]);

% six_link.plot([0 0 0 0 0 0]); % 画出三维模型
% six_link.display; % 展示所有信息
% six_link.teach; % 示教器
