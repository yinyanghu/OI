program p3626;
const
	limitsize = 500;
	maxqueue = 10000;
	dx:array[1..4] of longint = (0,0,1,-1);
	dy:array[1..4] of longint = (1,-1,0,0);
type
	queuenode = record
		x,y,len:longint;
	end;
var
	a:array[-limitsize..limitsize,-limitsize..limitsize] of boolean;
	wx,wy,x,y:longint;
	uplimit,downlimit,leftlimit,rightlimit:longint;
	n,head,tail,i:longint;
	queue:array[1..maxqueue] of queuenode;

begin
	readln(wx,wy,n);
	fillchar(a,sizeof(a),true);
	uplimit:=0; downlimit:=0; leftlimit:=0; rightlimit:=0;
	for i:=1 to n do begin
		readln(x,y);
		a[x,y]:=false;
		if (x > uplimit) then uplimit:=x;
		if (x < downlimit) then downlimit:=x;
		if (y > rightlimit) then rightlimit:=y;
		if (y < leftlimit) then leftlimit:=y;
	end;
	inc(uplimit); dec(downlimit); inc(rightlimit); dec(leftlimit);
	head:=0; tail:=1; queue[1].x:=0; queue[1].y:=0; queue[1].len:=0;
	a[0,0]:=false;
	while (head <> tail) do begin
		inc(head);
		if (head > maxqueue) then head:=1;
		for i:=1 to 4 do begin
			x:=queue[head].x + dx[i];
			y:=queue[head].y + dy[i];
			if (downlimit <= x) and (x <= uplimit) and (leftlimit <= y) and (y <= rightlimit) and (a[x,y]) then begin
				inc(tail);
				if (tail > maxqueue) then tail:=1;
				queue[tail].x:=x; queue[tail].y:=y;
				a[x,y]:=false;
				queue[tail].len:=queue[head].len + 1;
				if (x = wx) and (y = wy) then begin
					writeln(queue[tail].len);
					halt;
				end;
			end;
		end;
	end;
end.