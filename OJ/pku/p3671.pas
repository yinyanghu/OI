program p3671;
const maxn=30000;
var a:array[1..maxn] of boolean;
    totalone,totaltwo,min,i,n,k:longint;
begin
    readln(n);
    for i:=1 to n do begin
        readln(k);
	a[i]:=k=1;
    end;
    totalone:=0; totaltwo:=0;
    for i:=1 to n do
	if a[i] then inc(totalone);
    min:=totalone;
    for i:=1 to n do begin
	if a[i] then dec(totalone)
	    else inc(totaltwo);
	if totalone+totaltwo<min then min:=totalone+totaltwo;
    end;
    writeln(min);
end.
