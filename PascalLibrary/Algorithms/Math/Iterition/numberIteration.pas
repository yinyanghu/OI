program number;
var s:array[1..100] of longint;
    i,j,n:integer;
begin
    readln(n);
    for i:=1 to n do s[i]:=1;
    for i:=2 to n do
      if odd(i) then s[i]:=s[i-1]
        else for j:=1 to (i div 2) do s[i]:=s[i]+s[j];
    writeln(s[n]);
end.