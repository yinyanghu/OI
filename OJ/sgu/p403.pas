program p403;
var
	x:longint;
begin
	readln(x);
	writeln(x shl 1 + 1);
end.
{var
	i,s:longint;
begin
	s:=0;
	for i:=1 to 100 do begin
		s:=s + i;
		if (s mod (i + 1) = 0) then begin
			writeln('1..',i,'  ',i + 1,'  ',s div (i + 1));
		end;
	end;
end.}