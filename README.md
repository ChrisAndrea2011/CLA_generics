# CLA_generics

The Carry Look Ahead Adder is designed to reduce the carry propagation time  of the Ripple Carry Adder. Let's look at the truth table of the full adder:

Truth Table

A           B            Cin                Sum     Carry     
0            0            0                    0            0
0            0            1                    1            0
0            1            0                    1            0
0            1            1                    0            1
1            0            0                    1            0
1            0            1                    0            1
1            1            0                    0            1
1            1            1                    1            1  

Carry is generated when A and B are 1 . Hence, 

      G = A and B. 

Carry is propagated under 2 conditions:

      P = A or B. 

C0 = A0B0 + Cin(A0 + B0)  = G0 + CinP0.  

C1 = A1B1 + C0(A1 + B1) = G1 + C0P1 = G1 + P1(G0 + CinP0) 

C2 = A2B2+C1(A2+B2) = G2 + P2G1 + P1P2G0 + Cin P0P1P2 

C3 = A3B3 + C2(A3 + B3) = G3 + C2P3 = G3 + P3(G2 +P2G1 + P1P2G0 + Cin P0P1P2      



Note that the C0, C1, C2 and C3 are all calculated at the same time, without having to wait for the carry from the previous stages.
