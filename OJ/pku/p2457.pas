program p2457;
const
	maxn = 50000;
	limitsize = 100;
type
	node = record
		size:longint;
		list:array[1..limitsize] of longint;
	end;
	queuenode = record
		x,pre,len:longint;
	end;
var
	a:array[1..maxn] of node;
	flag:array[1..maxn] of boolean;
	queue:array[1..maxn] of queuenode;
	head,tail,i,k,n,x,y,v:longint;
	
procedure up(k:longint);
 begin
	if (queue[k].pre = -1) then begin
		writeln(queue[k].x);
		exit;
	end;
	up(queue[k].pre);
	writeln(queue[k].x);
 end;
 
procedure print;
 begin
	writeln(queue[tail].len);
	up(tail);
	halt;
 end;
 
begin
	readln(n,k);
	for i:=1 to maxn do a[i].size:=0;
	for i:=1 to n do begin
		readln(x,y);
		inc(a[x].size);
		a[x].list[a[x].size]:=y;
	end;
	fillchar(flag,sizeof(flag),true);
	head:=0; tail:=1;
	queue[1].x:=1; queue[1].pre:=-1; queue[1].len:=1; flag[1]:=false;
	while (head < tail) do begin
		inc(head); v:=queue[head].x;
		for i:=1 to a[v].size do
			if flag[a[v].list[i]] then begin
				flag[a[v].list[i]]:=false;
				inc(tail);
				queue[tail].x:=a[v].list[i];
				queue[tail].len:=queue[head].len + 1;
				queue[tail].pre:=head;
				if (queue[tail].x = k) then print;
			end;
	end;
	writeln(-1);
end.