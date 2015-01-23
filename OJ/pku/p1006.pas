program p1006;
var p,e,i,d,ans,t:longint;
begin
    t:=0;
    while not eof do begin
	readln(p,e,i,d);
	if (p=-1) and (e=-1) and (i=-1) and (d=-1) then halt;
	inc(t);
	ans:=(5544*p+14421*e+1288*i-d+21252) mod 21252;
	if ans=0 then ans:=21252;
	writeln('Case ',t,': the next triple peak occurs in ',ans,' days.');
    end;
end.