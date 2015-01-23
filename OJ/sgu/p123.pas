program p123;
var f:array[1..1000] of longint;
    i,k,n,s:longint;
begin
    readln(k);
    f[1]:=1; f[2]:=1; s:=2;
    for i:=3 to k do begin
        f[i]:=f[i-1]+f[i-2];
        s:=s+f[i];
    end;
    if (k=1) or (k=0) then s:=k;
    writeln(s);
end.
