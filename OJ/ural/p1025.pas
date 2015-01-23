program p1025;
var a:array[1..200] of longint;
    i,j,k,n,total:longint;
begin
    readln(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if a[i]>a[j] then begin
            k:=a[i]; a[i]:=a[j]; a[j]:=k;
        end;
    n:=n div 2+1; total:=0;
    for i:=1 to n do total:=total+(a[i] div 2+1);
    writeln(total);
end.