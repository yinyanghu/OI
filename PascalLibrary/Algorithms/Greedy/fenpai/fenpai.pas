program fenpai;
var i,n,s:integer;
    a:array[1..100] of longint;
    v:longint;
begin
    readln(n);
    v:=0;
    for i:=1 to n do begin
        read(a[i]);
        inc(v,a[i]);
    end;
    v:=v div n; s:=0;
    for i:=1 to n-1 do if a[i]<>v then begin
        inc(s);
        a[i+1]:=a[i+1]+a[i]-v;
    end;
    writeln(s);
end.