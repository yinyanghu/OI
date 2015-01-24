program findgcd;
var
	n,m:longint;
function gcd(a,b:longint):longint;
 begin
	if b = 0 then gcd:=a else gcd:=gcd(b,a mod b);
 end;

begin
	readln(n,m);
	writeln(gcd(n,m));
end.