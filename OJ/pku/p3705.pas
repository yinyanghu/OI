program p3705;
var
	n,i:longint;
begin
	readln(n);
	if (n = 1) then begin
		writeln(0);
		exit;
	end;
	if (n = 2) then begin
		writeln(1);
		writeln('1 1 1');
		exit;
	end;
	writeln(n shr 1 + 1);
	if (n and 1 =0) then begin
		writeln('1 1 ',n - 1);
		dec(n);
	end;
	for i:=0 to (n shr 1 - 1) do writeln(i + n shr 1 + 1,' 2 ',i);
	writeln(n shr 1 + 1,' ',n shr 1,' ',0);
end.