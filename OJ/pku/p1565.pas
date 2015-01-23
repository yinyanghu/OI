program p1565;
var s:string;
    a,f:array[1..31] of longint;
    i,l,total:longint;
begin
    readln(s);
    f[1]:=2;
    for i:=2 to 31 do f[i]:=f[i-1]*2;
    while s<>'0' do begin
	l:=length(s);
	for i:=1 to l do a[i]:=ord(s[l-i+1])-48;
	total:=0;
	for i:=1 to l do total:=total+(f[i]-1)*a[i];
	writeln(total);
	readln(s);
    end;
end.