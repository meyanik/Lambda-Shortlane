module led_btn(
input a,b,c,d,
output A,B,C,D,E,F,G

);


assign A=(~b&~d) | c | a | (d &b);

assign B = ~b | (~c&~d) | (c&d);

assign C = ~c | b | d ;

assign D = (~b&~d) | (b&~c&d) | (~b&c) | (c&~d) ;

assign E=  (~b&~d) | (c&~d) ;

assign F = (~c&~d) | b | a;

assign G = a | (b&~c) | (~b&c) | (c&~d);


endmodule
