program p3037;
const
	maxn = 100;
	maxw = 50;
	maxqueue = 10000;
	infinity = 100000000000;
	dx:array[1..4] of longint = (0,0,1,-1);
	dy:array[1..4] of longint = (1,-1,0,0);
type
	queuenode = record
		x,y:longint;
	end;
var
	v,n,m:longint;
	w:array[0..maxw] of int64;
	a:array[1..maxn,1..maxn] of longint;
	queue:array[1..maxqueue] of queuenode;
	flag:array[1..maxn,1..maxn] of boolean;
	time,speed:array[1..maxn,1..maxn] of double;
	
procedure init;
 var
 	i,j:longint;
 begin
 	readln(v,n,m);
 	w[0]:=1;
 	for i:=1 to maxw do w[i]:=w[i - 1] shl 1;
 	for i:=1 to n do
 		for j:=1 to m do begin
 			read(a[i,j]);
 			time[i,j]:=infinity;
 		end;
 	speed[1,1]:=v;
 	for i:=1 to n do
 		for j:=1 to m do
 			if (a[i,j] > a[1,1]) then speed[i,j]:=v / w[a[i,j] - a[1,1]]
 				else speed[i,j]:=v * w[a[1,1] - a[i,j]];
 	time[1,1]:=0;
 end;

procedure spfa;
 var
 	head,tail,i,xx,yy:longint;
 	k:double;
 begin
 	head:=0; tail:=1;
 	fillchar(flag,sizeof(flag),true);
 	queue[1].x:=1; queue[1].y:=1; flag[1,1]:=false;
 	while (head <> tail) do begin
 		inc(head); if (head > maxqueue) then head:=1;
 		for i:=1 to 4 do begin
 			xx:=queue[head].x + dx[i];
 			yy:=queue[head].y + dy[i];
 			if (1 <= xx) and (xx <= n) and (1 <= yy) and (yy <= m) then begin
 				k:=time[queue[head].x,queue[head].y] + 1 / speed[queue[head].x,queue[head].y];
 				if (k < time[xx,yy]) then begin
 					time[xx,yy]:=k;
 					if (flag[xx,yy]) then begin
 						inc(tail); if (tail > maxqueue) then tail:=1;
 						queue[tail].x:=xx; queue[tail].y:=yy;
 						flag[xx,yy]:=false;
 					end;
 				end;
 			end;
 		end;
 		flag[queue[head].x,queue[head].y]:=true;
 	end;
 end;

procedure main;
 begin
 	spfa;
 	writeln(time[n,m]:0:2);
 end;
	
begin
	init;
	main;
end.
