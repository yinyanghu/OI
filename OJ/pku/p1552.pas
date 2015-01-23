program p1552;
var ok:array[1..200] of boolean;
    a:array[1..15] of longint;
    i,total,k,n:longint;
begin
    read(k);
    while k<>-1 do begin
        fillchar(ok,sizeof(ok),false);
        n:=0;
	while k<>0 do begin
	    ok[k]:=true;
	    inc(n);
	    a[n]:=k;
	    read(k);
	end;
	read(k);
        total:=0;
	for i:=1 to n do 
	   if ok[a[i]*2] then inc(total);
	writeln(total);
    end;
end.