program p1519;
var s:ansistring;
    i,m:longint;
begin
    readln(s);
    while s<>'0' do begin
        while length(s)>1 do begin
            m:=0;
	    for i:=1 to length(s) do m:=m+ord(s[i])-48;
	    str(m,s);
        end;
	writeln(s);
        readln(s);
    end;
end.