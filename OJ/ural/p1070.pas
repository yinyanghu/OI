program p1070;
var a,b,c,d:double;
begin
    readln(a,b);
    readln(c,d);
    a:=trunc(a)+frac(a)/60*100;
    b:=trunc(b)+frac(b)/60*100;
    c:=trunc(c)+frac(c)/60*100;
    d:=trunc(d)+frac(d)/60*100;
    a:=b-a;
    if a<=-12 then a:=a+24;
    if a>=12 then a:=a-24;
    c:=d-c;
    if c<=-12 then c:=c+24;
    if c>=12 then c:=c-24;
    writeln(round(abs(a-c)/2));
end.
