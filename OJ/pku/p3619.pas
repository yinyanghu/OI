program p3619;
var n,m,i,s,t,r,time:longint;
begin
    readln(n,m);
    for i:=1 to m do begin
        readln(s,t,r);
	if (n mod (s*t)=0) then time:=n div (s*t)*(t+r)-r
	    else if (n mod (s*t) mod s<>0) then time:=n div (s*t)*(t+r)+trunc(n mod (s*t)/s)+1
		else time:=n div (s*t)*(t+r)+trunc(n mod (s*t)/s);
	writeln(time);
    end;
end.
