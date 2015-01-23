program p2184;
const maxs=100000;
      maxn=100;
var f:array[0..1,-maxs..maxs] of longint;
    s,t,left,right:array[0..maxn] of longint;
    i,j,max,n:longint;
begin
    readln(n);
    left[0]:=0; right[0]:=0;
    for i:=1 to n do begin
	readln(s[i],t[i]);
	left[i]:=left[i-1];
	if s[i]<0 then inc(left[i],s[i]);
	right[i]:=right[i-1];
	if s[i]>0 then inc(right[i],s[i]);
    end;
    for i:=left[n] to right[n] do f[0,i]:=-maxlongint;
    f[0,0]:=0;
    f[1]:=f[0];
    for i:=1 to n do begin
	for j:=left[i-1] to right[i-1] do
	    if f[0,j]>-maxlongint then
		if f[0,j]+t[i]>f[1,j+s[i]] then f[1,j+s[i]]:=f[0,j]+t[i];
        f[0]:=f[1];
    end;
    max:=-maxlongint;
    for i:=0 to right[n] do
	if (f[0,i]>=0) and (f[0,i]+i>max) then max:=f[0,i]+i;
    writeln(max);
end.