program p2385;
const maxn=1000;
      maxw=30;
var f:array[0..maxn,0..maxw,1..2] of longint;
    a:array[1..maxn] of longint;
    n,w,i,j,k,ans:longint;
    
function max(a,b:longint):longint;
 begin
     if a>b then max:=a else max:=b;
 end;
 
begin
    fillchar(f,sizeof(f),0);
    readln(n,w);
    for i:=1 to n do readln(a[i]);
    for i:=1 to n do
	for j:=0 to w do
	    for k:=1 to 2 do
	        if a[i]=k then f[i,j,k]:=f[i-1,j,k]+1 else
		    if j-1>=0 then f[i,j,k]:=max(f[i-1,j-1,3-k]+1,f[i-1,j,k]) else f[i,j,k]:=f[i-1,j,k];
    ans:=0;
    for i:=0 to w do
	for j:=1 to 2 do
	    if f[n,i,j]>ans then ans:=f[n,i,j];
    writeln(ans);
end.
