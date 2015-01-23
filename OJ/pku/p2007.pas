program p2007;
const
	maxn = 1000;
type
	pointnode = record
		x,y:longint;
	end;
var
	point:array[1..maxn] of pointnode;
	n:longint;

procedure init;
 begin
	n:=0;
	while not eof do begin
		inc(n);
		readln(point[n].x,point[n].y);
	end;
 end;

procedure swap(var a,b:pointnode);
 var
	k:pointnode;
 begin
	k:=a; a:=b; b:=k;
 end;

function cross(p1,p2,p3:pointnode):longint;
 begin
	cross:=(p2.x - p1.x) * (p3.y - p1.y) - (p2.y - p1.y) * (p3.x - p1.x);
 end;

function getdist(a,b:pointnode):double;
 begin
	getdist:=sqrt(sqr(a.x - b.x) + sqr(a.y - b.y));
 end;

procedure sort(l,r:longint);
 var
	i,j:longint;
	x:pointnode;
 begin
	i:=l; j:=r; x:=point[(l + r) shr 1];
	repeat
		while (cross(point[1],point[i],x) > 0) or ((cross(point[1],point[i],x) = 0) and (getdist(point[1],point[i]) < getdist(point[1],x))) do inc(i);
		while (cross(point[1],point[j],x) < 0) or ((cross(point[1],point[j],x) = 0) and (getdist(point[1],point[j]) > getdist(point[1],x))) do dec(j);
		if (i <= j) then begin
			swap(point[i],point[j]);
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;

procedure convex_hull;
 var
	i,top,k,start:longint;
	stack:array[1..maxn] of longint;
 begin
	k:=1;
	for i:=2 to n do
		if (point[i].x < point[k].x) or ((point[i].x = point[k].x) and (point[i].y < point[k].y)) then k:=i;
	swap(point[1],point[k]);
	sort(2,n);
	top:=1;
	stack[1]:=1;
	for i:=2 to n do begin
		while (top > 1) and (cross(point[stack[top]],point[stack[top-1]],point[i]) > 0) do dec(top);
		inc(top); stack[top]:=i;
	end;
	for start:=1 to top do
		if (point[stack[start]].x = 0) and (point[stack[start]].y = 0) then break;
	for i:=start to top do writeln('(',point[stack[i]].x,',',point[stack[i]].y,')');
	for i:=1 to start - 1 do writeln('(',point[stack[i]].x,',',point[stack[i]].y,')');
 end;

begin
	init;
	convex_hull;
end.