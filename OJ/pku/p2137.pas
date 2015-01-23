program p2137;
const maxn=100;
      maxs=40;
type point=record
	 x,y:longint;
     end;
     node=record
	 s:longint;
	 w:array[1..maxs] of point;
     end;
var f:array[1..maxn,1..maxs] of double;
    a:array[1..maxn] of node;
    n,i,j,start,k,ans:longint;
    total:double;
function min(a,b:double):double;
 begin
     if a<b then min:=a else min:=b;
 end;

function dist(a,b:point):double;
 begin
     dist:=sqrt(sqr(a.x-b.x)+sqr(a.y-b.y));
 end;

begin
    readln(n);
    for i:=1 to n do begin
	read(a[i].s);
	for j:=1 to a[i].s do read(a[i].w[j].x,a[i].w[j].y);
    end;
    ans:=maxlongint;
    for start:=1 to a[1].s do begin
        fillchar(f,sizeof(f),$7F);
	f[1,start]:=0;
	for i:=2 to n do
	    for j:=1 to a[i].s do
		if i=2 then f[i,j]:=dist(a[1].w[start],a[i].w[j])
		    else for k:=1 to a[i-1].s do f[i,j]:=min(f[i,j],f[i-1,k]+dist(a[i-1].w[k],a[i].w[j]));
	total:=maxlongint;
	for i:=1 to a[n].s do total:=min(total,f[n,i]+dist(a[n].w[i],a[1].w[start]));	
	if trunc(total*100)<ans then ans:=trunc(total*100);
    end;
    writeln(ans);
end.