program p2435;
const
	maxn = 30;
	maxm = 40;
	maxqueue = 10000;
type
	queuenode = record
		x,y,prev:longint;
		direction:char;
	end;
var
	a:array[1..maxn * 2 - 1,1..maxm * 2 - 1] of char;
	flag:array[1..maxn * 2 - 1,1..maxm * 2 - 1] of boolean;
	queue:array[1..maxqueue] of queuenode;
	ans:array[1..maxqueue] of char;
	head,tail,n,m,sx,sy,tx,ty,i,j,x,y,tot:longint;
procedure printpath(x,y:longint);
 begin
 	if (x = -1) then exit;
 	printpath(queue[x].prev,x);
 	inc(tot); ans[tot]:=queue[y].direction;
 end;
 
procedure print(x:longint);
 var
 	i,k:longint;
 begin
 	tot:=0;
 	printpath(queue[x].prev,x);
 	write(ans[1]); k:=1;
 	for i:=2 to tot do begin
 		if (ans[i] = ans[i - 1]) then inc(k)
 			else begin
 				writeln(' ',k);
 				write(ans[i]);
 				k:=1;
 			end;
 	end;
 	writeln(' ',k);
 	halt;
 end;
 
begin
	readln(n,m);
	n:=n * 2 - 1;
	m:=m * 2 - 1;
	fillchar(flag,sizeof(flag),true);
	for i:=1 to n do begin
		for j:=1 to m do begin
			read(a[i,j]);
			if (a[i,j] = 'S') then begin
				sx:=i; sy:=j;
			end;
			if (a[i,j] = 'E') then begin
				tx:=i; ty:=j;
			end;
		end;
		readln;
	end;
	head:=0; tail:=1;
	queue[1].x:=sx; queue[1].y:=sy; queue[1].prev:=-1;
	flag[sx,sy]:=false;
	while (head < tail) do begin
		inc(head);
		x:=queue[head].x; y:=queue[head].y;
		if (x + 1 <= n) and (a[x + 1,y] = '|') and (flag[x + 2,y]) then begin
			flag[x + 2,y]:=false;
			inc(tail);
			queue[tail].x:=x + 2;
			queue[tail].y:=y;
			queue[tail].prev:=head;
			queue[tail].direction:='S';
			if (queue[tail].x = tx) and (queue[tail].y = ty) then print(tail);
		end;
		if (x - 1 >= 1) and (a[x - 1,y] = '|') and (flag[x - 2,y]) then begin
			flag[x - 2,y]:=false;
			inc(tail);
			queue[tail].x:=x - 2;
			queue[tail].y:=y;
			queue[tail].prev:=head;
			queue[tail].direction:='N';
			if (queue[tail].x = tx) and (queue[tail].y = ty) then print(tail);
		end;
		if (y + 1 <= m) and (a[x,y + 1] = '-') and (flag[x,y + 2]) then begin
			flag[x,y + 2]:=false;
			inc(tail);
			queue[tail].x:=x;
			queue[tail].y:=y + 2;
			queue[tail].prev:=head;
			queue[tail].direction:='E';
			if (queue[tail].x = tx) and (queue[tail].y = ty) then print(tail);
		end;
		if (y - 1 >= 1) and (a[x,y - 1] = '-') and (flag[x,y - 2]) then begin
			flag[x,y - 2]:=false;
			inc(tail);
			queue[tail].x:=x;
			queue[tail].y:=y - 2;
			queue[tail].prev:=head;
			queue[tail].direction:='W';
			if (queue[tail].x = tx) and (queue[tail].y = ty) then print(tail);
		end;
	end;
end.