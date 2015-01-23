program p3612;
const maxn=100000;
      maxh=100;
      infinity=1000000000;
var f:array[false..true,0..maxh] of longint;
    a:array[1..maxn] of longint;
    n,c,i,j,k,ans:longint;
    flag:boolean;
begin
    readln(n,c);
    for i:=1 to n do readln(a[i]);
    flag:=false;
    for i:=0 to maxh do
	if (i>=a[1]) then f[flag,i]:=sqr(i-a[1]) else f[flag,i]:=infinity;
    for i:=2 to n do begin
        flag:=not flag;
        k:=infinity;
        for j:=0 to maxh do begin
	    if f[not flag,j]-j*c<k then k:=f[not flag,j]-j*c;
	    f[flag,j]:=k+j*c;
	end;
	k:=infinity;
	for j:=maxh downto 0 do begin
	    if f[not flag,j]+j*c<k then k:=f[not flag,j]+j*c;
	    if k-j*c<f[flag,j] then f[flag,j]:=k-j*c;
	end;
	for j:=0 to maxh do
	    if j>=a[i] then f[flag,j]:=f[flag,j]+sqr(j-a[i]) else f[flag,j]:=infinity;
    end;
    ans:=infinity;
    for i:=0 to maxh do
	if f[flag,i]<ans then ans:=f[flag,i];
    writeln(ans);
end.
