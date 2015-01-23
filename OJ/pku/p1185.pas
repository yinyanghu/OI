program p1185;
const
	maxn = 100;
	maxm = 10;
	maxstat = 60;
type
	node = record
		stat,key:longint;
	end;
var
	a:array[1..maxn,1..maxm] of boolean;
	flag:array[1..maxn,1..maxstat] of node; //line i --> 0(total status) key--->fire num
	count:array[1..maxn] of longint;
	f:array[boolean,1..maxstat,1..maxstat] of longint;
	n,m:longint;
	
procedure init;
 var
 	i,j:longint;
 	ch:char;
 begin
	readln(n,m);
	for i:=1 to n do begin
		for j:=1 to m do begin
			read(ch);
			a[i,j]:=ch = 'P';
		end;
		readln;
	end;
 end;

procedure dfs(w,cur,last,tot,stat:longint);
 begin
	if (cur = m + 1) then begin
  		inc(count[w]);
  		flag[w,count[w]].stat:=stat;
  		flag[w,count[w]].key:=tot;
  		exit;
  	end;
 	if (a[w,cur]) then begin
 		if (last = 0) or (cur - last > 2) then dfs(w,cur + 1,cur,tot + 1,stat shl 1 + 1);
 		dfs(w,cur + 1,last,tot,stat shl 1);
 	end else begin
 		dfs(w,cur + 1,last,tot,stat shl 1);
 	end;
 end;

procedure prepare;
 var
 	i:longint;
 begin
 	for i:=1 to n do begin
 		count[i]:=0;
 		dfs(i,1,0,0,0);
 	end;
 end;

function max(a,b:longint):longint; inline;
 begin
 	if (a > b) then max:=a else max:=b;
 end;

procedure main;
 var
 	i,j,k,p,ans:longint;
 	cur:boolean;
 begin
 	prepare;
 	if (n >= 1) then begin
  		cur:=true;
 		for i:=1 to count[1] do
 			for j:=1 to maxstat do f[cur,i,j]:=flag[1,i].key;
 	end;
 	if (n >= 2) then begin
 		cur:=not cur;
 		for i:=1 to count[2] do
 			for j:=1 to count[1] do
 				if (flag[2,i].stat and flag[1,j].stat = 0) then f[cur,i,j]:=max(f[cur,i,j],f[not cur,j,1] + flag[2,i].key);
 	end;
 	if (n >= 3) then begin
	 	for i:=3 to n do begin
	 		cur:=not cur;
 			fillchar(f[cur],sizeof(f[cur]),0);
	 		for j:=1 to count[i] do
	 			for k:=1 to count[i - 1] do
	 				if (flag[i,j].stat and flag[i - 1,k].stat = 0) then begin
	 					for p:=1 to count[i - 2] do
	 						if (flag[i,j].stat and flag[i - 2,p].stat = 0) and (flag[i - 1,k].stat and flag[i - 2,p].stat = 0) then
	 							f[cur,j,k]:=max(f[cur,j,k],f[not cur,k,p] + flag[i,j].key);
	 				end;
	 	end;
 	end;
 	ans:=0;
 	if (n = 1) then begin
 		for i:=1 to count[n] do
 			ans:=max(ans,f[cur,i,1]);
 	end else begin
 		for i:=1 to count[n] do
 			for j:=1 to count[n - 1] do
 				ans:=max(ans,f[cur,i,j]);
 	end;
 	writeln(ans);
 end;

begin
	init;
	main;
end.
