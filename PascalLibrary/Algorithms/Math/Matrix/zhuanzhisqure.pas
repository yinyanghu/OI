program zhuanzhisqure;
var a:array [1..1000,1..1000] of integer;
    i,j,t,m:integer;
begin
    readln(m);
    randomize;
    for i:=1 to m do begin
          for j:=1 to m do begin
              a[i,j]:=random(101);
              write(a[i,j]:4);
          end;
          writeln;
      end;
    writeln;
    for i:=1 to m do
      for j:=1 to i-1 do begin
          t:=a[i,j]; a[i,j]:=a[j,i]; a[j,i]:=t;
      end;
    for i:=1 to m do begin
        for j:=1 to m do write(a[i,j]:4);
        writeln;
    end;
    readln;
end.