program p3700;
const
	maxn = 60;
var
	up,down,a:array[1..maxn] of longint;
	n,i,ans:longint;
procedure dfs(x,u,d:longint);
 var
 	temp,i:longint;
 	flag:boolean;
 begin
 	if (u + d >= ans) then exit;
 	if (x = n + 1) then begin
 		ans:=u + d;
 		exit;
 	end;
 	flag:=false;
 	for i:=1 to u do
 		if (up[i] < a[x]) then begin
 			flag:=true;
 			break;
 		end;
 	if flag then begin
 	 	temp:=up[i]; up[i]:=a[x];
 		dfs(x + 1,u,d);
 	 	up[i]:=temp;
 	end else begin
 		up[u + 1]:=a[x];
 		dfs(x + 1,u + 1,d);
 		up[u + 1]:=0;
 	end;
 	
  	flag:=false;
 	for i:=1 to d do
 		if (down[i] > a[x]) then begin
 			flag:=true;
 			break;
 		end;
 	if flag then begin
 	 	temp:=down[i]; down[i]:=a[x];
 		dfs(x + 1,u,d);
 	 	down[i]:=temp;
 	end else begin
 		down[d + 1]:=a[x];
 		dfs(x + 1,u,d + 1);
 		down[d + 1]:=0;
 	end;

 end;
 
begin
	readln(n);
	while (n <> 0) do begin
		for i:=1 to n do read(a[i]);
		ans:=trunc(sqrt(n)) + 1;
		dfs(1,0,0);
		writeln(ans);
		readln(n);
	end;
end.