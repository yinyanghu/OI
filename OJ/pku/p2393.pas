program p3293;
const
	infinity = 1000000000;
var
	n,s,c,y,k,i:longint;
	ans:int64;

function min(a,b:longint):longint;
 begin
	if (a < b) then min:=a else min:=b;
 end;

begin
	readln(n,s);
	ans:=0;
	k:=infinity;
	for i:=1 to n do begin
		readln(c,y);
		k:=min(k + s,c);
		ans:=ans + k * y;
	end;
	writeln(ans);
end.