program p3175;
var
	l,s,i,k:longint;
	m:double;
	ans,delta:int64;
function check(x:int64):boolean;
 var
 	k:double;
 	w:int64;
 begin
	k:=sqrt(x);
	w:=trunc((k - trunc(k)) * delta);
	check:=w = s;
 end;
 
begin
	readln(l);
	readln(s);
	delta:=1;
	for i:=1 to l do delta:=delta * 10;
	m:=s / delta;
	k:=0;
	while true do begin
		inc(k); ans:=round((k + m) * (k + m));
		if check(ans) then begin
			writeln(ans);
			halt;
		end;
	end;
end.
