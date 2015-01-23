program p130; //Catalan Number
const
	maxn = 30;
var
	n,i,j:longint;
	f:array[0..maxn] of int64;
begin
	readln(n);
	f[0]:=1;
	for i:=1 to n do begin
		f[i]:=0;
		for j:=0 to i - 1 do f[i]:=f[i] + f[j] * f[i - 1 - j];
	end;
	writeln(f[n],' ',n + 1);
end.
