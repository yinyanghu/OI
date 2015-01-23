program p3051;
const
	maxn = 1000;
	maxm = 80;
	dx:array[1..4] of longint = (0,0,1,-1);
	dy:array[1..4] of longint = (1,-1,0,0);
var
	a:array[1..maxn,1..maxm] of boolean;
	ans,i,j,total,n,m:longint;
	ch:char;
procedure floodfill(x,y:longint);
 var
	xx,yy,i:longint;
 begin
 	a[x,y]:=false;
 	inc(total);
	for i:=1 to 4 do begin
		xx:=x + dx[i];
		yy:=y + dy[i];
		if (1 <= xx) and (xx <= n) and (1 <= yy) and (yy <= m) and (a[xx,yy]) then floodfill(xx,yy);
	end;
 end;
 
begin
	readln(m,n);
	for i:=1 to n do begin
		for j:=1 to m do begin
			read(ch);
			a[i,j]:=ch = '*';
		end;
		readln;
	end;
	ans:=0;
	for i:=1 to n do
		for j:=1 to m do
			if a[i,j] then begin
				total:=0;
				floodfill(i,j);
				if total > ans then ans:=total;
			end;
	writeln(ans);
end.