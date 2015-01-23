program p404;
const
	maxn = 100;
var
	s:array[1..maxn] of string;
var
	i,n,m,k:longint;
begin
	readln(n,m);
	for i:=1 to m do readln(s[i]);
	k:=n mod m;
	if (k = 0) then k:=m;
	writeln(s[k]);
end.
