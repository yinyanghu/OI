program p3372;
var a:longint;
begin
    while not eof do begin
	readln(a);
	while (a mod 2=0) do a:=a div 2;
	if a=1 then writeln('YES') else writeln('NO');
    end;
end.