program boygirl;
const maxn=100000;
var n,i,max:longint;
    a:array[1..maxn] of integer;
    s:array[0..maxn] of longint;
    f:array[-maxn..maxn] of longint;
begin
    readln(n);
    for i:=1 to n do begin
        read(a[i]);
        if a[i]=0 then a[i]:=-1;
    end;
    s[0]:=0;
    for i:=-100000 to 100000 do f[i]:=-1;
    f[s[0]]:=0; max:=0;
    for i:=1 to n do begin
        s[i]:=s[i-1]+a[i];
        if f[s[i]]=-1 then f[s[i]]:=i
          else if max<i-f[s[i]] then max:=i-f[s[i]];
    end;
    writeln(max)
end.