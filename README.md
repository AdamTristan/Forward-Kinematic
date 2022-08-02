# Forward-Kinematic
Forward Kinematic code based on matlab
正逆运动学快速入门指南
1.正运动学
1.1二维旋转矩阵
在xoy坐标系中，对于单位向量a=(cosθ,sinθ)，令它绕着o点转动α°，则新单位向量a’=(cos(θ＋α),sin(θ＋α)),展开a’得：
![image](https://user-images.githubusercontent.com/76904279/182274217-9a72cf48-d413-441f-aa11-2e014a0a37d5.png)
![image](https://user-images.githubusercontent.com/76904279/182274244-cded38bd-9c57-4dd1-810a-17c3d1dc097a.png)
1.2三维旋转矩阵
可以发现，绕着o点转动，就相当于绕着一条垂直于xoy平面向外的z轴转动，
我们不妨扩展xoy的矩阵到三维，同时增加旋转矩阵的维度，得：
![image](https://user-images.githubusercontent.com/76904279/182274266-e13514f0-2169-4e4a-ad33-457c1748ae72.png)
易得绕着y，x轴旋转的矩阵。
2.1 RPY角的定义
对于三维空间中的物体，我们需要六个自由度（dof，dimension of freedom）去描述它，即相对于基坐标（space frame）的距离（A,B,C)以及相对于基坐标的转动位姿（X’,Y’,Z’),那么，我们应该如何描述转动位姿呢？我们说一个坐标系依次绕着基坐标的x，y，z轴分别转动γ，β，α角度称为转动位姿，其矩阵自然表示为：
![image](https://user-images.githubusercontent.com/76904279/182274280-e418ddeb-990a-45b6-9828-e37af1030354.png)
由于三个角度是矩阵R的参数，所以已知一方可以求出另一方。
2.2 齐次旋转矩阵
我们知道了描述一个末端位姿需要六个参数，于是乎我们试图将旋转矩阵和位置矩阵放在一个矩阵中，这将得到一个4×4的矩阵T∈SE(3):
![image](https://user-images.githubusercontent.com/76904279/182274297-beeeab1a-9351-4afe-8846-b2c1332c40bf.png)
这个群涵盖了我们需要的所有信息，但是一个六自由度的东西，却需要十二个值去映射意义，未免使数据太冗杂了，于是我们提出了DH法来让通过四个数据获得我们想要的所有信息。
3.1 DH法的引入（本指南主要介绍MDH法）
高中我们学过，任意不平行不垂直的两条直线都有且仅有一条公垂线同时垂直于两条直线，故如图建立四个坐标系，从左到右通过旋转，平移，平移，旋转得到最终坐标系。
D-H法的简化方式很明确，就是将y轴位移和旋转的2个自由度干掉了，仅考虑x和z轴的位移与旋转。这样，6个自由度的位姿变成由4个参数来表示了。其中参数采用连杆扭转角（Link Twist）α，连杆长度（Link Length）a，连杆偏移（Link Offset）d，关节角（Joint Angle）θ，在MDH中，{i}的轴线和{i+1}的轴线，如果相交，则交点为原点，xi轴在两轴线所在平面的垂线上，方向任意；如果不相交，两轴线公垂线和当前关节i轴线的交点为原点，xi为在公垂线上，方向任意；若平行，则x，z任意。
![image](https://user-images.githubusercontent.com/76904279/182274317-cbbaa0bb-f0e8-43b1-b056-8922c7c2531d.png)
由坐标旋转矩阵得：
![image](https://user-images.githubusercontent.com/76904279/182274330-3dd8d1fe-e97d-4623-b3a6-ecbef6e0f8e7.png)
3.2二维连杆末端执行器的位姿表示
先引入一个二维特例，另基座坐标为（0，0），易得末端坐标为（L1C1+L2C12,L1S1+L2S12)
![image](https://user-images.githubusercontent.com/76904279/182274343-07415a94-a341-40ac-a986-6abfe02d3c39.png)
下面用DH法:
![image](https://user-images.githubusercontent.com/76904279/182274357-bf5d6c84-1829-4970-93f8-975bda478f77.png)
![image](https://user-images.githubusercontent.com/76904279/182274369-c977438d-b782-40f8-983d-1621ec2e263f.png)
3.3六轴工业机械臂末端执行器的位姿表示
绿线为x，蓝线为y，圈叉表示垂直于纸面向内。
在图中，y轴虽然未标定，但是该图满足右手定则（即坐标方向有：x×y=z）
在图表中，需要注意的是theta_i+offset才是末端转动的总和.
（需要注意的是，DH表不唯一，同一个机械臂有很多建表方式，得出来模型虽然不一致，但是末端姿态是一样的）
![image](https://user-images.githubusercontent.com/76904279/182274385-d8b71fa4-69cc-485a-8e26-ae90e7b53084.png)
参数表：
i	theta_i	d_i	a_i-1	alpha_i-1	offset
1	theta_1	L1	0	0	PI/2
2	theta_2	L2	0	PI/2	PI/2
3	theta_3	0	L3	0	0
4	theta_4	L4	L5	PI/2	PI/2
5	theta_5	L7	0	-PI/2	0
6	theta_6	L8	0	PI/2	0
