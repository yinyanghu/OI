program p222;
var
	n,k,ans,i:longint;
begin
	readln(n,k);
	if (n < k) then begin
		writeln(0);
		exit;
	end;
	ans:=1;
	for i:=1 to k do ans:=ans * sqr(n - k + i) div i;
	writeln(ans);
end.
