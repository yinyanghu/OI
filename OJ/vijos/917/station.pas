program station;
var t:array[1..1000] of longint;
    n,m,total,i,p:longint;
    max:extended;
begin
    assign(input,'station.in'); reset(input);
    assign(output,'station.out'); rewrite(output);
    readln(n,m);
    for i:=1 to n do read(t[i]);
    total:=0; max:=0;
    for i:=1 to n do begin
        if t[i] mod m=0 then p:=t[i] div m
           else p:=t[i] div m+1;
        total:=total+p;
        max:=max+t[i]*960/m*0.6;
    end;
    writeln(total);
    writeln(max:0:0);
    close(input);
    close(output);
end.
