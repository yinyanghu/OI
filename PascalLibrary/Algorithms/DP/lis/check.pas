program check;
const maxn=100000;
var n,i,j,max:longint;
    a,f:array[1..maxn] of longint;
begin
    assign(input,'lis.in'); reset(input);
    readln(n);
    for i:=1 to n do read(a[i]);
    close(input);
    fillchar(f,sizeof(f),0);
//increase
    max:=-1;
    for i:=1 to n do begin
        f[i]:=1;
	for j:=1 to i-1 do
	    if (a[i]>a[j]) and (f[i]<f[j]+1) then f[i]:=f[j]+1; //if a[i]>=a[j] --->not decrease
	if f[i]>max then max:=f[i];
    end;
    assign(output,'check.out'); rewrite(output);
    writeln(max);
    close(output);
end.
// decrease
{
    max:=-1;
    for i:=n downto 1 do begin
        f[i]:=1;
	for j:=i+1 to n do
	    if (a[i]>a[j]) and (f[i]<f[j]+1) then f[i]:=f[j]+1; //if a[i]>=a[j]--->not increase
	if f[i]>max then max:=f[i];
    end;
}