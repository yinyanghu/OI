program p3170;
const
	maxn = 1000;
	maxqueue = 10000;
	maxshrubbery = 10000;
	infinity = 1000000000;
	dx:array[1..4] of longint = (0,0,1,-1);
	dy:array[1..4] of longint = (1,-1,0,0);
type
	node = record
		x,y,len:longint;
	end;
	point = record
		a,b:longint;
	end;
var
	a:array[1..maxn,1..maxn] of longint;
	queue:array[1..maxqueue] of node;
	flag:array[1..maxn,1..maxn] of boolean;
	shrubbery:array[1..maxn,1..maxn] of longint;
	w:array[1..maxshrubbery] of point;
	i,j,m,n,ans,sx,sy,tx,ty,tot:longint;
	
procedure bfs_start;
 var
	head,tail,i,xx,yy:longint;
 begin
	fillchar(flag,sizeof(flag),true);
	head:=0; tail:=1;
	queue[1].x:=sx; queue[1].y:=sy; queue[1].len:=0;
	flag[sx,sy]:=false;
	while (head <> tail) do begin
		inc(head);
		if (head > maxqueue) then head:=1;
		if (shrubbery[queue[head].x,queue[head].y] <> 0) then begin
			w[shrubbery[queue[head].x,queue[head].y]].a:=queue[head].len;
			continue;
		end;
		for i:=1 to 4 do begin
			xx:=queue[head].x + dx[i];
			yy:=queue[head].y + dy[i];
			if (1 <= xx) and (xx <= n) and (1 <= yy) and (yy <= m) and ((a[xx,yy] = 0) or (a[xx,yy] = 4)) and (flag[xx,yy]) then begin
				inc(tail);
				if (tail > maxqueue) then tail:=1;
				flag[xx,yy]:=false;
				queue[tail].x:=xx; queue[tail].y:=yy;
				queue[tail].len:=queue[head].len + 1;
			end;
		end;
		
	end;
 end;
 
procedure bfs_end;
 var
	head,tail,i,xx,yy:longint;
 begin
	fillchar(flag,sizeof(flag),true);
	head:=0; tail:=1;
	queue[1].x:=tx; queue[1].y:=ty; queue[1].len:=0;
	flag[tx,ty]:=false;
	while (head <> tail) do begin
		inc(head);
		if (head > maxqueue) then head:=1;
		if (shrubbery[queue[head].x,queue[head].y] <> 0) then begin
			w[shrubbery[queue[head].x,queue[head].y]].b:=queue[head].len;
			continue;
		end;
		for i:=1 to 4 do begin
			xx:=queue[head].x + dx[i];
			yy:=queue[head].y + dy[i];
			if (1 <= xx) and (xx <= n) and (1 <= yy) and (yy <= m) and ((a[xx,yy] = 0) or (a[xx,yy] = 4)) and (flag[xx,yy]) then begin
				inc(tail);
				if (tail > maxqueue) then tail:=1;
				flag[xx,yy]:=false;
				queue[tail].x:=xx; queue[tail].y:=yy;
				queue[tail].len:=queue[head].len + 1;
			end;
		end;
		
	end;
 end;
 
begin
	fillchar(shrubbery,sizeof(shrubbery),0);
	tot:=0;
	readln(m,n);
	for i:=1 to n do
		for j:=1 to m do begin
			read(a[i,j]);
			if (a[i,j] = 2) then begin
				sx:=i; sy:=j;
			end;
			if (a[i,j] = 3) then begin
				tx:=i; ty:=j;
			end;
			if (a[i,j] = 4) then begin
				inc(tot);
				shrubbery[i,j]:=tot;
				w[tot].a:=-1; w[tot].b:=-1;
			end;
		end;
	bfs_start;
	bfs_end;
	ans:=infinity;
	for i:=1 to tot do
		if (w[i].a <> -1) and (w[i].b <> -1) and (w[i].a + w[i].b < ans) then ans:=w[i].a + w[i].b;
	writeln(ans);
end.