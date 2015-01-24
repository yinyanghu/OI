const m=100000;
var n,i,j:integer;
    a,b:array[1..m] of integer;
    c:array[1..m] of integer;
begin
    readln(n); randomize;
    for i:=1 to n do a[i]:=random(m)+1;
    for i:=1 to m do c[i]:=0;
    for i:=1 to n do c[a[i]]:=c[a[i]]+1;
    for i:=2 to m do c[i]:=c[i]+c[i-1];
    for i:=n downto 1 do
     begin
        b[c[a[i]]]:=a[i];
        c[a[i]]:=c[a[i]]-1;
     end;
    writeln('Sorted data:');
    for i:= 1 to n do write(b[i]:6);
end.
