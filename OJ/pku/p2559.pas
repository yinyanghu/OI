program p2559;
const
	maxn = 100000;
var
	left,right:array[1..maxn] of longint;
	h:array[0..maxn + 1] of int64;
	n:longint;
procedure init;
 var
 	i:longint;
 begin
 	read(n);
 	if (n = 0) then halt;
 	for i:=1 to n do read(h[i]);
 	h[0]:=-1; h[n + 1]:=-1;
 end;
 
procedure main;
 var
 	i:longint;
 	max,s:int64;
 begin
 	for i:=1 to n do begin
 		left[i]:=i; right[i]:=i;
 	end;
 	for i:=1 to n do
 		while (h[left[i] - 1] >= h[i]) do left[i]:=left[left[i] - 1];
 	for i:=n downto 1 do
 		while (h[right[i] + 1] >= h[i]) do right[i]:=right[right[i] + 1];
 	max:=0;
 	for i:=1 to n do begin
 		s:=h[i] * (right[i] - left[i] + 1);
 		if (s > max) then max:=s;
 	end;
 	writeln(max);
 end;
 
begin
	while true do begin
		init;
		main;
	end;
end.
