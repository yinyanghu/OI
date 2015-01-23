program p3670;
const maxn=30000;
var f:array[1..maxn,1..3] of longint;
    a:array[1..maxn] of longint;
    up,down,i,n:longint;
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;
 
function dp:longint;
 var i:longint;
 begin
     f[1,1]:=1; f[1,2]:=1; f[1,3]:=1; f[1,a[1]]:=0;
     for i:=2 to n do begin
         f[i,1]:=f[i-1,1]+1-ord(a[i]=1);
	 f[i,2]:=min(f[i-1,1],f[i-1,2])+1-ord(a[i]=2);
	 f[i,3]:=min(min(f[i-1,1],f[i-1,2]),f[i-1,3])+1-ord(a[i]=3);
     end;
     dp:=min(min(f[n,1],f[n,2]),f[n,3]);
 end;
 
begin
    readln(n);
    for i:=1 to n do readln(a[i]);
    up:=dp;
    for i:=1 to n do a[i]:=4-a[i];
    down:=dp;
    writeln(min(up,down));
end.
