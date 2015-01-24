program zushu;
var a:array[1..100] of string;
    i,j,n:integer;
    k:string;
begin
    readln(n);
    for i:=1 to n do readln(a[i]);
    for i:=1 to n-1 do
      for j:=i+1 to n do
        if (a[i]+a[j]<a[j]+a[i]) then begin
            k:=a[i]; a[i]:=a[j]; a[j]:=k;
        end;
    for i:=1 to n do write(a[i]);
    readln;
end.