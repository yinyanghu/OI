program p2181;
const maxn=150000;
var f:array[false..true,0..1] of longint;
    a:array[1..maxn] of longint;
    n,i:longint;
    flag:boolean;
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;
 
begin
    readln(n);
    for i:=1 to n do readln(a[i]);
    fillchar(f,sizeof(f),0);
    flag:=false;
    for i:=1 to n do begin
        flag:=not flag;
        f[flag,0]:=max(f[not flag,0],f[not flag,1]+a[i]);
	f[flag,1]:=max(f[not flag,1],f[not flag,0]-a[i]);
    end;
    writeln(max(f[flag,0],f[flag,1]));
end.
