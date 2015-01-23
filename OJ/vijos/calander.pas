program calander;
var i,x,y,z,n:longint;
begin
    readln(n);
    for i:=1 to n do begin
        readln(x,y,z);
        if ((z=30) and ((y=11) or (y=9))) or ((y+z) mod 2=0) then writeln('YES')
            else writeln('NO');
     end;
end.