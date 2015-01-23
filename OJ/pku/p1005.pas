program p1005;
var s,i,n,year:longint;
    x,y,r,dist:double;
begin
    readln(n);
    for i:=1 to n do begin
        readln(x,y);
        r:=0; year:=0; s:=0; dist:=sqrt(x*x+y*y);
        while (r<=dist) do begin
            s:=s+50;
            r:=sqrt(s*2/pi);
            inc(year);
        end;
        writeln('Property ',i,': This property will begin eroding in year ',year,'.');
    end;
    writeln('END OF OUTPUT.');
end.