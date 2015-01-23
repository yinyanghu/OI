program p2111;
const maxn=365;
      dx:array[1..8] of longint=(-2,-1,1,2,2,1,-1,-2);
      dy:array[1..8] of longint=(1,2,2,1,-1,-2,-2,-1);
type point=record
	 x,y,key:longint;
     end;
var a:array[1..maxn,1..maxn] of longint;
    f:array[1..maxn,1..maxn] of longint;
    list:array[1..maxn*maxn] of point;
    q:array[1..maxn] of point;
    flag:array[1..maxn,1..maxn] of boolean;
    i,j,k,n,ans,total,x,y:longint;

procedure sort(l,r:longint);
 var i,j,x:longint;
     y:point;
 begin
     i:=l; j:=r; x:=list[(l+r) shr 1].key;
     repeat
	while list[i].key>x do inc(i);
	while list[j].key<x do dec(j);
	if i<=j then begin
	    y:=list[i]; list[i]:=list[j]; list[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

procedure findpath;
 var cur,next,i,j,xx,yy,x,y,t:longint;
 begin
     fillchar(flag,sizeof(flag),true);
     cur:=0;
     for i:=1 to n do
	for j:=1 to n do
	    if (ans=f[i,j]) then begin
	        inc(cur); q[cur].x:=i; q[cur].y:=j;
		flag[i,j]:=false;
	    end;
     for t:=ans downto 1 do begin
         k:=a[q[1].x,q[1].y];
         xx:=q[1].x; yy:=q[1].y;
         for i:=2 to cur do
	     if a[q[i].x,q[i].y]<k then begin
	         k:=a[q[i].x,q[i].y];
		 xx:=q[i].x; yy:=q[i].y;
	     end;
	 writeln(k);
	 next:=0;
	 for i:=1 to 8 do begin
	     x:=xx+dx[i]; y:=yy+dy[i];
	     if (x>=1) and (x<=n) and (y>=1) and (y<=n) and (flag[x,y]) and (a[x,y]>k) and (f[x,y]=t-1) then begin
	         inc(next); flag[x,y]:=false;
		 q[next].x:=x; q[next].y:=y;
	     end;
	 end;
	 cur:=next;
     end;
 end;

begin
    readln(n);
    for i:=1 to n do
	for j:=1 to n do read(a[i,j]);
    total:=0;
    for i:=1 to n do
	for j:=1 to n do begin
	    f[i,j]:=1;
	    inc(total);
	    list[total].x:=i; list[total].y:=j; list[total].key:=a[i,j];
	end;
    sort(1,total);
    for i:=1 to total do begin
        x:=list[i].x; y:=list[i].y;
	for k:=1 to 8 do
	    if (x+dx[k]>=1) and (x+dx[k]<=n) and (y+dy[k]>=1) and (y+dy[k]<=n) and (a[x+dx[k],y+dy[k]]<a[x,y]) then
		if (f[x+dx[k],y+dy[k]]<f[x,y]+1) then f[x+dx[k],y+dy[k]]:=f[x,y]+1;
    end;
    ans:=-1;
    for i:=1 to n do
	for j:=1 to n do
	    if (ans<f[i,j]) then ans:=f[i,j];
    writeln(ans);
    findpath;
end.
