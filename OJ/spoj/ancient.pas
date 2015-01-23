program ancient;
var
	s:string;
	delta,i:longint;
begin
	s:='xzrnhxnijfynaijxjfqtmhxsts';
	for delta:=1 to 26 do begin
		for i:=1 to length(s) do write(chr((ord(s[i]) - 96 + delta) mod 27 + 96));
		writeln;
		writeln('**************');
	end;
end.
