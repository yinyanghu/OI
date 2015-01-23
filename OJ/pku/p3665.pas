program p3665;
const maxn=1000;
var a:array[1..maxn] of longint;
    n,t,i,remain,k,max:longint;
begin
    readln(n,t);
    for i:=1 to n do readln(a[i]);
    for t:=1 to t do begin
        max:=1;
	for i:=2 to n do
	    if a[i]>a[max] then max:=i;
	writeln(max);
	remain:=a[max] mod (n-1);
	k:=(a[max]-remain) div (n-1);
	for i:=1 to n do
	    if i<>max then inc(a[i],k);
	for i:=1 to n do
	    if remain=0 then break 
		else if (i<>max) then begin
		    inc(a[i]); dec(remain);
		end;
	a[max]:=0;
    end;
end.
