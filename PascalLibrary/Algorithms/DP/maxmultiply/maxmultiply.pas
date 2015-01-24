program maxmultiply;
var n,k,i,max{,total}:longint;
    f:array[1..1000] of longint;
begin
    readln(n);
    for i:=1 to n do begin
	f[i]:=i;
	max:=0;
	for k:=1 to i-1 do if k*f[i-k]>max then max:=k*f[i-k];
	if max>f[i] then f[i]:=max;
    end;
    writeln(f[n]);
end.
    {total:=1; i:=n;
    while n>=5 do begin
	total:=total*3;
	dec(n,3);
    end;
    if n<>0 then total:=total*n;}