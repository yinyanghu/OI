program p1073;
var k,n,s,p,total,i:longint;
begin
    readln(n);
    total:=0; s:=1; k:=1; p:=1;
    for i:=1 to n do begin
	if p<>0 then begin
	    total:=total+k;
	    if total>=10000 then total:=total mod 10000;
	    dec(p);
	end;
	if p=0 then begin
	    inc(s); p:=s;
	    k:=k*2; if k>=10000 then k:=k mod 10000;
	end;
    end;
    {while n>0 do begin
	if n>s then n:=n-s
	   else begin
	       for i:=1 to n do begin
		   total:=total+k;
		   if total>=10000 then total:=total mod 10000;
	       end;
	       break;
	   end;
	for i:=1 to s do begin 
	    total:=total+k;
	    if total>=10000 then total:=total mod 10000;
	end;
	inc(s); k:=k*2;
    end;}
    writeln(total);
end.