program p275;
const maxn=100;
var n,i,j,k:longint;
    a:array[1..maxn] of int64;
    x,w:int64;
begin
    readln(n);
    for i:=1 to n do read(a[i]);
    x:=0;
    for i:=63 downto 0 do begin
        k:=0; w:=int64(1) shl i;
	for j:=1 to n do
	    if w and a[j]>0 then begin
	        k:=j; break;
	    end;
	if k=0 then continue;
	if w and x=0 then x:=x xor a[k];
	for j:=1 to n do
	    if (j<>k) and (w and a[j]>0) then a[j]:=a[j] xor a[k];
	a[k]:=0;
    end;
    writeln(x);
end.
