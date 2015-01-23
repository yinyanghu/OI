program p3263;
const
	maxn = 10000;
	maxf = 10000;
type
	node = record
		x,y:longint;
	end;
var
	a:array[1..maxn] of node;
	f:array[1..maxn] of longint;
	n,i,h,r,k:longint;
procedure sort(l,r:longint);
 var
 	i,j:longint;
 	x,y:node;
 begin
 	i:=l; j:=r; x:=a[(l + r) shr 1];
 	repeat
 		while (a[i].x < x.x) or ((a[i].x = x.x) and (a[i].y < x.y)) do inc(i);
 		while (a[j].x > x.x) or ((a[j].x = x.X) and (a[j].y > x.y)) do dec(j);
 		if (i <= j) then begin
 			y:=a[i]; a[i]:=a[j]; a[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then sort(l,j);
 	if (i < r) then sort(i,r);
 end;
 
function unique:longint;
 var
 	i,cur:longint;
 begin
	sort(1,r);
	cur:=1;
	for i:=2 to r do begin
		if (a[i].x = a[i - 1].x) and (a[i].y = a[i - 1].y) then continue;
		inc(cur);
		a[cur]:=a[i];
	end;
	unique:=cur;
 end;
 
begin
	readln(n,i,h,r);
	for i:=1 to r do begin
		readln(a[i].x,a[i].y);
		if (a[i].x > a[i].y) then begin
			k:=a[i].y; a[i].y:=a[i].x; a[i].x:=k;
		end;
	end;
	r:=unique;
	fillchar(f,sizeof(f),0);
	for i:=1 to r do begin
		dec(f[a[i].x + 1]);
		inc(f[a[i].y]);
	end;
	k:=0;
	for i:=1 to n do begin
		k:=k + f[i];
		writeln(k + h);
	end;
end.
