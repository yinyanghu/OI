program car;
const k=0.000000001;
var s,a,b,c,c0,c1,t1,t2,t3,t4:real;
begin
    readln(s,a,b);
    c0:=0;
    c1:=s;
    repeat
         c:=(c0+c1)/2;
         t3:=c/b;
         t1:=t3+(s-c)/a;
         t4:=(c-t3*a)/(a+b);
         t2:=t3+t4+(s-(t3+t4)*a)/b;
         if t1<t2 then c1:=c else c0:=c;
    until abs(t1-t2)<k;
    writeln(t1:10:5);
    readln;
end.