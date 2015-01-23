program p1079;
var a,max:array[0..100000] of longint;
    n,i:longint;
begin
    a[0]:=0; a[1]:=1;
    max[0]:=0; max[1]:=1;
    for i:=2 to 100000 do begin
        if odd(i) then a[i]:=a[i div 2]+a[i div 2+1]
           else a[i]:=a[i div 2];
        if a[i]>max[i-1] then max[i]:=a[i]
            else max[i]:=max[i-1];
    end;
    repeat
       readln(n);
       if n=0 then halt;
       writeln(max[n]);
    until false;
end.
