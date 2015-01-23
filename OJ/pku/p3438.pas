program p3438;
const maxn=1000;
var a:array[1..maxn] of char;
    i,k,n,t,m:longint;
begin
    readln(t);
    for m:=1 to t do begin
	n:=0;
	while not eoln do begin
	    inc(n);
	    read(a[n]);
	end;
        readln;
	i:=0;
	while i<n do begin
	    inc(i);
	    k:=1;
	    while (i<n) and (a[i+1]=a[i]) do begin
		inc(k); inc(i);
	    end;
	    write(k,a[i]);
	end;
	writeln;
    end;
end.
