{
ID:lijianx1
PROG:barn1
LANG:PASCAL
}
program barn1;
var a,w:array[1..200] of longint;
    k,m,s,c,i,j,total,ans:longint;

begin
    assign(input,'barn1.in'); reset(input);
    readln(m,s,c);
    for i:=1 to c do readln(a[i]);
    close(input);
    for i:=1 to c-1 do
	for j:=i+1 to c do
	    if a[i]>a[j] then begin
		k:=a[i]; a[i]:=a[j]; a[j]:=k;
	    end;
    total:=0;
    for i:=1 to c-1 do
	if a[i+1]-a[i]>1 then begin
	    inc(total);
	    w[total]:=a[i+1]-a[i]-1;
	end;
    for i:=1 to total-1 do
	for j:=i+1 to total do
	   if w[i]<w[j] then begin
	       k:=w[i]; w[i]:=w[j]; w[j]:=k;
	   end;
    ans:=a[c]-a[1]+1;
    for i:=1 to m-1 do ans:=ans-w[i];
    assign(output,'barn1.out'); rewrite(output);
    writeln(ans);
    close(output);
end.