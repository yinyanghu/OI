program p2140;
var n,k,t,total:longint;
begin
    readln(n);
    k:=2; total:=1;
    while n<>1 do
	if (n mod k=0) then begin
	   t:=1;
	   while (n mod k=0) do begin
	       n:=n div k;
	       inc(t);
	   end;
	   if (k and 1<>0) then total:=total*t;
	end else inc(k);
    writeln(total);
end.