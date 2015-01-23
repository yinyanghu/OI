program p1800;
const
	maxn = 600;
var
	s:array[1..maxn] of string;
	flag:array[1..maxn,1..maxn] of boolean;
	f:array[1..maxn,1..maxn] of longint;
	l,n,len:longint;
	
procedure init;
 var
	k,p:longint;
	t:ansistring;
 begin
	readln(k,l,n);
	if (k = 0) and (l = 0) and (n = 0) then halt;
	readln(t);
	k:=0;
	p:=pos(' ',t);
	while (p <> 0) do begin
		inc(k);
		s[k]:=copy(t,1,p - 1);
		delete(t,1,p);
		p:=pos(' ',t);
	end;
	s[n]:=t;
	len:=length(s[n]);
 end;
 
function check(x,y:longint):boolean;
 var
	i:longint;
 begin
	for i:=2 to len do
		if (s[x,i] <> s[y,i - 1]) then exit(false);
	check:=true;
 end;
 
procedure prepare;
 var
	i,j:longint;
 begin
	for i:=1 to n do
		for j:=1 to n do flag[i,j]:=check(i,j);
 end;
 
procedure dp;
 var
	i,j,k,ans:longint;
 begin
	fillchar(f,sizeof(f),0);
	for i:=1 to n do f[len,i]:=1;
	for i:=len + 1 to l do
		for k:=1 to n do
			if (f[i - 1,k] > 0) then
				for j:=1 to n do
					if (flag[k,j]) then f[i,j]:=f[i,j] + f[i - 1,k];
					
	ans:=0;
	for i:=1 to n do ans:=ans + f[l,i];
	writeln(ans);
 end;
 
begin
	while true do begin
		init;
		prepare;
		dp;
	end;
end.
