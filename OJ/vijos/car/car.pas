program car;
const k=0.000000000000000001;
var t:array[1..4] of extended;
    a,b,s:longint;
    l,r,mid:extended;
begin
    assign(input,'car.in'); reset(input);
    assign(output,'car.out'); rewrite(output);
    readln(s,a,b);
    l:=0; r:=s;
    repeat
        mid:=(l+r)/2;
        t[3]:=mid/b;
        t[1]:=t[3]+(s-mid)/a;
        t[4]:=(mid-t[3]*a)/(a+b);
        t[2]:=t[3]+t[4]+(s-(t[3]+t[4])*a)/b;
        if t[1]>t[2] then l:=mid else r:=mid;
    until abs(t[1]-t[2])<k;
    writeln(t[1]:0:3);
    close(input);
    close(output);
end.