program p2656;
var n,i,max,ans,a,b:longint;
begin
    while true do begin
	readln(n);
	if n=0 then break;
	max:=-1;
	for i:=1 to n do begin
	    readln(a,b);
	    if (a+b>max) then begin
	        max:=a+b; ans:=i;
	    end;
	end;
	if (max<=8) then writeln(0) else writeln(ans);
    end;    
end.
