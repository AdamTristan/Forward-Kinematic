function T = FKmatrix_manual(o1, o2, o3, o4, o5, o6)

T01 = [ cos(o1)  -sin(o1)   0   0       ;
        0         0        -1  -162.5   ;
        sin(o1)   cos(o1)   0   0       ;
        0         0         0   1     ] ;
    
T12 = [ cos(o2)  -sin(o2)   0  -425     ;
        sin(o2)   cos(o2)   0   0       ;
        0         0         1   0       ;
        0         0         0   1     ] ;
    
T23 = [ cos(o3)  -sin(o3)   0  -392.5   ;
        sin(o3)   cos(o3)   0   0       ;
        0         0         1   0       ;
        0         0         0   1     ] ;

T34 = [ cos(o4)  -sin(o4)   0   0       ;
        0         0        -1  -133.3   ;
        sin(o4)   cos(o4)   0   0       ;
        0         0         0   1     ] ;

T45 = [ cos(o5)  -sin(o5)   0   0       ;
        0         0         1   99.7    ;
       -sin(o5)  -cos(o5)   0   0       ;
        0         0         0   1     ] ;

T56 = [ cos(o6)  -sin(o6)   0   0       ;
        sin(o6)   cos(o6)   0   0       ;
        0         0         1   99.6    ;
        0         0         0   1     ] ;

T = T01 * T12 * T23 * T34 * T45 * T56 ;

end
