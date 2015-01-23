program p3050;
const
	n = 5;
	l = 6;
	maxnum = 999999;
	dx:array[1..4] of longint = (0,0,1,-1);
	dy:array[1..4] of longint = (1,-1,0,0);
var
	a:array[1..n,1..n] of longint;
	hash:array[0..maxnum] of boolean;
	i,j,total:longint;
	
procedure dfs(k,x,y,sum:longint);
 var
	i,xx,yy:longint;
 begin
 	if (k = l + 1) then begin
 		if hash[sum] then begin
 			hash[sum]:=false;
 			inc(total);
 		end;
 		exit;
 	end;
	for i:=1 to 4 do begin
		xx:=x + dx[i];
		yy:=y + dy[i];
		if (1 <= xx) and (xx <= n) and (1 <= yy) and (yy <=n) then dfs(k + 1,xx,yy,sum * 10 + a[xx,yy]);
	end;
 end;
 
begin
	fillchar(hash,sizeof(hash),true);
	for i:=1 to n do
		for j:=1 to n do read(a[i,j]);
	for i:=1 to n do
		for j:=1 to n do dfs(1,i,j,0);
	writeln(total);
end.