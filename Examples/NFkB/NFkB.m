function model = NFkB()
    % NFkB provides the GenSSI implementation of the model of the NFkB
    % signalling pathway as introduced by
    % 
    %    Lipniacki et al. (2004). Mathematical model of NFkB regulatory  
    %    module, Journal of Theoretical Biology 228, 195-215.

    % Symbolic variables
    syms x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15
    syms a1 a2 t1 a3 t2 c1a c2a c3a c4a c5a c6a c1 c2 c3 c4 c5 ...
    k1 k2 k3 kprod kdeg kv i1 e2a i1a e1a c1c c2c c3c x01 x06 x07 x08 x09 x010 x011 x012 x014 x015 NF

    % Parameters
    model.sym.p = [a1;a2;t1;a3;t2;c1a;c2a;c3a;c4a;c5a;c6a;c1;c2;c3;c4;c5;...
                   k1;k2;k3;kprod;kdeg;kv;i1;e2a;i1a;e1a;c1c;c2c;c3c;x01;...
                   x06;x07;x08;x09;x010;x011;x012;x014;x015;NF];

    % State variables
    model.sym.x = [x1;x2;x3;x4;x5;x6;x7;x8;x9;x10;x11;x12;x13;x14;x15];

    % Control vectors (g)
    model.sym.g=[-k1*x1
                  k1*x1-k2*x2*x8
                  k2*x2*x8
                  0
                  0
                  0
                  0
                  0
                  0
                  0
                  0
                  0
                  0
                  0
                  0];

    % Autonomous dynamics (f)
    model.sym.xdot=[kprod-kdeg*x1
                    -k3*x2-kdeg*x2-a2*x2*x10+t1*x4-a3*x2*x13+t2*x5
                    k3*x2-kdeg*x3
                    a2*x2*x10-t1*x4
                    a3*x2*x13-t2*x5
                    c6a*x13-a1*x6*x10+t2*x5-i1*x6
                    i1*kv*x6-a1*x11*x7
                    c4*x9-c5*x8
                    c2+c1*x7-c3*x9
                    -a2*x2*x10-a1*x10*x6+c4a*x12-c5a*x10-i1a*x10+e1a*x11
                    -a1*x11*x7+i1a*kv*x10-e1a*kv*x11
                    c2a+c1a*x7-c3a*x12
                    a1*x10*x6-c6a*x13-a3*x2*x13+e2a*x14
                    a1*x11*x7-e2a*kv*x14
                    c2c+c1c*x7-c3c*x15];   

    % Initial conditions
    model.sym.x0 = [x01;0;0;0;0;x06;x07;x08;x09;x010;x011;x012;NF;x014;x015];

    % Observables
    model.sym.y = [x7;x10+x13;x9;x1+x2+x3;x2;x12];
end