program p3494;
const
	maxn = 2000;
var
	a:array[1..maxn,1..maxn] of longint;
	left,right:array[1..maxn] of longint;
	n,m:longint;
	
procedure init;
 var
 	i,j:longint;
 begin
 	readln(n,m);
 	for i:=1 to n do begin
 		for j:=1 to m do begin
 			read(a[i,j]);
 			if (a[i,j] = 1) then a[i,j]:=a[i,j] + a[i,j - 1];
 		end;
 		readln;
 	end;
 	for i:=1 to n do begin
 		left[i]:=i - 1;
 		right[i]:=i + 1;
 	end;
 end;
 
function max(a,b:longint):longint; inline;
 begin
 	if (a > b) then max:=a else max:=b;
 end;
 
function calc(x:longint):longint;
 var
 	i,j:longint;
 begin
 	for i:=1 to n do begin
 		j:=i - 1;
 		while (j >= 1) and (a[j,x] >= a[i,x]) do j:=left[j];
 		left[i]:=j;
 	end;
 	for i:=n downto 1 do begin
 		j:=i + 1;
 		while (j <= n) and (a[j,x] >= a[i,x]) do j:=right[j];
 		right[i]:=j;
 	end;
 	calc:=0;
 	for i:=1 to n do calc:=max(calc,a[i,x] * (right[i] - left[i] - 1));
 end;
 
procedure main;
 var
 	i,ans:longint;
 begin
 	ans:=0;
 	for i:=1 to m do ans:=max(ans,calc(i));
 	writeln(ans);
 end;
 
begin
	while not eof do begin
		init;
		main;
	end;
end.
