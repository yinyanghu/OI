program gen;
const a=0.0000000000000000000000000000000000000000000000000000000000000000000000000000001;
{var s1,s2:real;
begin
    s1:=1.4;
    s2:=1/(s1+1)+1;
    while (s2-s1<a) do begin
        s1:=s2;
        s2:=1/(s1+1)+1;
    end;
    writeln(s2:8:14);
end.
}

var x0,x1,x:real;
begin
    x0:=0;
    x1:=1/(x0+2);
    while abs(x1-x0)>a do begin
        x0:=x1;
        x1:=1/(x0+2);
    end;
    x:=x1+1;
    writeln('sqrt(2)=',x:0:40);
    readln;
end.
