program snake;
const max=18;
var d,i,j,m,n:integer;
    a:array[1..max,1..max] of integer;
begin
    write('N='); readln(n);
    fillchar(a,sizeof(a),0);
    if (n<1) or (n>max) then begin
        writeln('Input N error!');
        readln;
        halt;
    end;
    i:=1; j:=1; m:=1; d:=1;
    repeat
         a[i,j]:=m;
         case d of
             1:begin inc(i); if j=1 then d:=2 else d:=4; end;
             2:begin dec(i); inc(j); if j=n then d:=1 else if i=1 then d:=3; end;
             3:begin inc(j); if i=n then d:=2 else d:=4; end;
             4:begin inc(i); dec(j); if i=n then d:=3 else if j=1 then d:=1; end;
         end;
         inc(m);
    until m>n*n;
    writeln('The result:');
    for i:=1 to n do begin
        for j:=1 to n do write(a[i,j]:4);
        writeln;
    end;
    readln;
end.