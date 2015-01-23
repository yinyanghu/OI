program p144;
var x,y,t:longint;
    ans,z:double;
begin
    read(x,y);
    read(z);
    t:=(y-x)*60;
    ans:=1-sqr((t-z)/t);
    writeln(ans:0:7);
end.