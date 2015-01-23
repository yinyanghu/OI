program p1985;
const
	maxn = 40000;
	maxqueue = 40000;
	limitsize = 10;
	infinity = 1000000000;
type
	pointnode = record
		size:longint;
		list:array[1..limitsize] of longint;
		len:array[1..limitsize] of longint;
		flag:array[1..limitsize] of boolean;
	end;
var
	a:array[1..maxn] of pointnode;
	d:array[1..maxn] of longint;
	f:array[1..maxn,0..1] of longint;
	queue:array[1..maxqueue] of longint;
	i,ans,n,m,x,y,k:longint;
procedure del(x,y:longint);
 var
	i:longint;
 begin
 	dec(d[x]); dec(d[y]);
	for i:=1 to a[x].size do
		if (a[x].list[i] = y) then begin
			a[x].flag[i]:=false;
			exit;
		end;
 end;
 
procedure bfs;
 var
	i,x,k,left,right:longint;
 begin
 	left:=0; right:=0;
 	for i:=1 to n do
 		if (d[i] = 1) then begin
 			inc(right);
 			queue[right]:=i;
 		end;
 	while (left <= right) do begin
 		inc(left);
 		x:=queue[left];
 		for i:=1 to a[x].size do if (a[x].flag[i]) then begin
 			if (f[x,0] + a[x].len[i] > f[a[x].list[i],1]) then f[a[x].list[i],1]:=f[x,0] + a[x].len[i];
 			if (f[a[x].list[i],0] < f[a[x].list[i],1]) then begin
 				k:=f[a[x].list[i],0]; f[a[x].list[i],0]:=f[a[x].list[i],1]; f[a[x].list[i],1]:=k;
 			end;
 			del(a[x].list[i],x);
 			if (d[a[x].list[i]] = 1) then begin
 				inc(right);
 				queue[right]:=a[x].list[i];
 			end;
 		end;
 	end;
 end;
 
begin
	readln(n,m);
	for i:=1 to n do a[i].size:=0;
	for i:=1 to m do begin
		read(x,y,k); readln;
		inc(a[x].size); a[x].list[a[x].size]:=y; a[x].len[a[x].size]:=k;
		a[x].flag[a[x].size]:=true;
		inc(a[y].size); a[y].list[a[y].size]:=x; a[y].len[a[y].size]:=k;
		a[y].flag[a[y].size]:=true;
	end;
	for i:=1 to n do d[i]:=a[i].size;
	fillchar(f,sizeof(f),0);
	bfs;
	ans:=-infinity;
	for i:=1 to n do
		if (f[i,0] + f[i,1] > ans) then ans:=f[i,0] + f[i,1];
	writeln(ans);
end.
