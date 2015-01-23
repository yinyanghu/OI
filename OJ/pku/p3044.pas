program p3044;
const
	maxn = 50000;
var
	a:array[1..maxn] of longint;
	top,n,i,ans,x,y:longint;
begin
	readln(n,i);
	top:=0; ans:=0;
	for i:=1 to n do begin
		readln(x,y);
		if (y < a[top]) then
			while (top > 0) and (y < a[top]) do dec(top);
		if (y <> 0) and ((top = 0) or (y > a[top])) then begin
			inc(ans);
			inc(top); a[top]:=y;
		end;
	end;
	writeln(ans);
end.