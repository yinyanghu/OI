program p2375;
const
	maxw = 500;
	maxl = 500;
	infinity = 100000000;
type
	node = record
		indegree,outdegree:longint;
	end;
var
	a:array[1..maxl,1..maxw] of longint;
	flag:array[1..maxl,1..maxw] of longint;
	count:array[1..maxw * maxl] of node;
	w,l,total,i,j,noindegree,nooutdegree,max,min:longint;
procedure dfs(x,y:longint);
 begin
 	flag[x,y]:=total;
 	if (x - 1 >= 1) and (flag[x - 1,y] = 0) and (a[x - 1,y] = a[x,y]) then dfs(x - 1,y);
 	if (x + 1 <= l) and (flag[x + 1,y] = 0) and (a[x + 1,y] = a[x,y]) then dfs(x + 1,y);
 	if (y - 1 >= 1) and (flag[x,y - 1] = 0) and (a[x,y - 1] = a[x,y]) then dfs(x,y - 1);
 	if (y + 1 <= w) and (flag[x,y + 1] = 0) and (a[x,y + 1] = a[x,y]) then dfs(x,y + 1);
 end;

begin
	readln(w,l);
	max:=-1; min:=infinity;
	for i:=1 to l do
		for j:=1 to w do begin
			read(a[i,j]);
			if (a[i,j] > max) then max:=a[i,j];
			if (a[i,j] < min) then min:=a[i,j];
		end;
	if (max = min) then begin
		writeln(0);
		halt;
	end;
	fillchar(flag,sizeof(flag),0);
	total:=0;
	for i:=1 to l do
		for j:=1 to w do
			if (flag[i,j] = 0) then begin
				inc(total);
				dfs(i,j);
			end;
	if (total = 1) then begin
		writeln(0);
		halt;
	end;
	fillchar(count,sizeof(count),0);
	for i:=1 to l do
		for j:=1 to w do begin
			if (i - 1 >= 1) and (a[i,j] > a[i - 1,j]) then begin
				inc(count[flag[i,j]].outdegree);
				inc(count[flag[i - 1,j]].indegree);
			end;
			if (i + 1 <= l) and (a[i,j] > a[i + 1,j]) then begin
				inc(count[flag[i,j]].outdegree);
				inc(count[flag[i + 1,j]].indegree);
			end;
			if (j - 1 >= 1) and (a[i,j] > a[i,j - 1]) then begin
				inc(count[flag[i,j]].outdegree);
				inc(count[flag[i,j - 1]].indegree);
			end;
			if (j + 1 <= w) and (a[i,j] > a[i,j + 1]) then begin
				inc(count[flag[i,j]].outdegree);
				inc(count[flag[i,j + 1]].indegree);
			end;
		end;
	noindegree:=0; nooutdegree:=0;
	for i:=1 to total do begin
		if (count[i].indegree = 0) then inc(noindegree);
		if (count[i].outdegree = 0) then inc(nooutdegree);
	end;
	if noindegree > nooutdegree then writeln(noindegree) else writeln(nooutdegree);		
end.
