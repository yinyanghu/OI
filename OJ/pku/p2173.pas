program p2173;
const
	maxn = 100;
	maxh = 100;
type
	node = record
		x,y:longint;
	end;
var
	n,w,h,i,j,k,len:longint;
	a:array[1..maxn] of node;
	x,y:array[0..maxh] of longint;
	point,ans:node;

function max(a,b:longint):longint;
 begin
	if (a > b) then max:=a else max:=b;
 end;

function check(p:node):longint;
 var
	i,len:longint;
 begin
	if (w - p.x < h - p.y) then len:=w - p.x else len:=h - p.y;
	for i:=1 to n do
		if (a[i].x > p.x) and (a[i].x < p.x + len) and (a[i].y > p.y) and (a[i].y < p.y + len) then len:=max(a[i].x - p.x,a[i].y - p.y);
	check:=len;
 end;

begin
	readln(n,w,h);
	x[0]:=0; y[0]:=0;
	for i:=1 to n do begin
		readln(a[i].x,a[i].y);
		x[i]:=a[i].x;
		y[i]:=a[i].y;
	end;
	len:=1;
	for i:=0 to n do
		for j:=0 to n do begin
			point.x:=x[i]; point.y:=y[j];
			k:=check(point);
			if (k > len) then begin
				len:=k;
				ans:=point;
			end;
		end;
	writeln(ans.x,' ',ans.y,' ',len);
end.