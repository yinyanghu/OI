program p1342;
var s,p:ansistring;
    i,q,code:longint;
    f:array[0..5000] of longint;
begin
    readln(s);
    while s<>'0' do begin
	fillchar(f,sizeof(f),0);
	f[0]:=1; f[1]:=1;
        for i:=2 to length(s) do begin
	    if s[i]<>'0' then f[i]:=f[i-1];
	    p:=copy(s,i-1,2);
    	    val(p,q,code);
    	    if (q>9)and(q<27) then f[i]:=f[i]+f[i-2];
        end;
        writeln(f[length(s)]);
        readln(s);
    end;
end.