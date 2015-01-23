program p1990;
const
	maxn = 20000;
type
	node = record
		v,x,num:longint;
	end;
var
	a:array[1..maxn] of node;
	size,dist:array[1..maxn] of int64;
	n,i:longint;
	ans:int64;
function lowbit(x:longint):longint;
 begin
	lowbit:=x and -x;
 end;
 
procedure addsize(x,delta:longint);
 begin
	while (x <= maxn) do begin
		size[x]:=size[x] + delta;		
		x:=x + lowbit(x);
	end;
 end;
 
procedure adddist(x,delta:longint);
 begin
 	while (x <= maxn) do begin
 		dist[x]:=dist[x] + delta;
 		x:=x + lowbit(x);
 	end;
 end;
 
function sumsize(x:longint):int64;
 begin
 	sumsize:=0;
 	while (x > 0) do begin
 		sumsize:=sumsize + size[x];
 		x:=x - lowbit(x);
 	end;
 end;
 
function sumdist(x:longint):int64;
 begin
 	sumdist:=0;
 	while (x > 0) do begin
 		sumdist:=sumdist + dist[x];
 		x:=x - lowbit(x);
 	end;
 end;
 
function getsize(x,y:longint):int64;
 begin
	getsize:=sumsize(y) - sumsize(x - 1);
 end;
 
function getdist(x,y:longint):int64;
 begin
	getdist:=sumdist(y) - sumdist(x - 1);
 end;
 
procedure sort(l,r:longint);
 var
	i,j:longint;
	x,y:node;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1];
	repeat
		while (a[i].v > x.v) do inc(i);
		while (a[j].v < x.v) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;
 
begin
	readln(n);
	fillchar(size,sizeof(size),0);
	fillchar(dist,sizeof(dist),0);
	for i:=1 to n do begin
		readln(a[i].v,a[i].x);
		addsize(a[i].x,1);
		adddist(a[i].x,a[i].x);
		a[i].num:=i;
	end;
	sort(1,n);
	ans:=0;
	for i:=1 to n do begin
		ans:=ans + a[i].v * (getsize(1,a[i].x - 1) * a[i].x - getdist(1,a[i].x - 1) + getdist(a[i].x + 1,maxn) - getsize(a[i].x + 1,maxn) * a[i].x);
		addsize(a[i].x,-1);
		adddist(a[i].x,-a[i].x);
	end;
	writeln(ans);
end.