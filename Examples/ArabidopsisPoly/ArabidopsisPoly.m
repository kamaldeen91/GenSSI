function model = ArabidopsisPoly()
	% Symbolic variables
	syms x1 x2 x3 x4 x5 x6 x7 xi1 xi2 xi3 xi4 xi5 xi6 xi7 xi8 xi9
	syms p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18 p19 p20 p21 p22 p23 p24 p25 p26 p27

	% Parameters
	model.sym.p = [p1;p2;p3;p4;p5;p6;p7;p8;p9;p10;p11;p12;p13;p14;p15;p16;p17;p18;p19;p20;p21;p22;p23;p24;p25;p26;p27];

	% State variables
	model.sym.x = [x1;x2;x3;x4;x5;x6;x7;xi1;xi2;xi3;xi4;xi5;xi6;xi7;xi8;xi9];

	% Control vectors (g)
	model.sym.g = [p26*x7
                   0
                   0
                   0
                   0
                   0
                   - p21 - p27*x7
                   0
                   0
                   -p26*x7*xi3^2
                   0
                   0
                   0
                   0
                   0
                   xi9^2*(p21 + p27*x7)];

	% Autonomous dynamics (f)
	model.sym.xdot = [p1*x6*xi2 - p5*x1*xi3
                      p19*x1 - p22*x2 + p23*x3 - p6*x2*xi4
                      p22*x2 - p23*x3 - p7*x3*xi5
                      p2*p4^2*xi1 - p8*x4*xi6
                      p20*x4 - p24*x5 + p25*x6 - p9*x5*xi7
                      p24*x5 - p25*x6 - p10*x6*xi8
                      p21 - p11*x7*xi9
                      2*x3*xi1^2*(p23*x3 - p22*x2 + p7*x3*xi5)
                      xi2^2*(p25*x6 - p24*x5 + p10*x6*xi8)
                      -xi3^2*(p1*x6*xi2 - p5*x1*xi3)
                      -xi4^2*(p19*x1 - p22*x2 + p23*x3 - p6*x2*xi4)
                      xi5^2*(p23*x3 - p22*x2 + p7*x3*xi5)
                      -xi6^2*(p2*p4^2*xi1 - p8*x4*xi6)
                      -xi7^2*(p20*x4 - p24*x5 + p25*x6 - p9*x5*xi7)
                      xi8^2*(p25*x6 - p24*x5 + p10*x6*xi8)
                      -xi9^2*(p21 - p11*x7*xi9)];

	% Initial conditions
	model.sym.x0 = [0;0;0;0;0;0;0;1/p4^2;1/p3;1/p12;1/p13;1/p14;1/p15;1/p16;1/p17;1/p18];

	% Observables
	model.sym.y = [x1;x4];
end