program p3049;
const
	maxl = 15;
	maxn = 26;
var
	a:array[1..maxn] of char;
	s:array[1..maxl] of char;
	i,l,n:longint;
	ch:char;
	
procedure sort(l,r:longint);
 var
	i,j:longint;
	x,y:char;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1];
	repeat
		while (a[i] < x) do inc(i);
		while (a[j] > x) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;
 
procedure print;
 var
	i:longint;
 begin
	for i:=1 to l do write(s[i]);
	writeln;
 end;
 
procedure dfs(k,last,x,y:longint);
 var
	i:longint;
 begin
	if (k = l + 1) then begin
		if (x >= 1) and (y >= 2) then print;
		exit;
	end;
	for i:=last + 1 to n do begin
		s[k]:=a[i];
		if (a[i] in ['a','e','i','o','u']) then dfs(k + 1,i,x + 1,y)
			else dfs(k + 1,i,x,y + 1);
	end;	
 end;
 
begin
	readln(l,n);
	for i:=1 to n - 1 do read(a[i],ch);
	readln(a[n]);
	sort(1,n);
	dfs(1,0,0,0);
end.