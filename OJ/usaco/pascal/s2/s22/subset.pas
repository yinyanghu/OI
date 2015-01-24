{
ID:lijianx1
PROG:subset
LANG:PASCAL
}
program subset;
var f:array[1..40,0..400] of int64;
    i,j,n,m:longint;
begin
    assign(input,'subset.in'); reset(input);
    assign(output,'subset.out'); rewrite(output);
    readln(n);
    close(input);
    m:=(n+1)*n div 2;
    if odd(m) then begin
	writeln(0);
	close(output);
	halt;
    end;
    m:=m div 2;
    f[1,1]:=1; f[1,0]:=1;
    for i:=2 to n do
	for j:=0 to m do
	   if j-i>=0 then f[i,j]:=f[i-1,j]+f[i-1,j-i] else f[i,j]:=f[i-1,j];
    writeln(f[n,m] div 2);
    close(output);
end.