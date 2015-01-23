program p1331;
var n,d,i,j:longint;
    a,f:array[0..2500] of longint;
    ch:char;
begin
    readln(n,d);
    for i:=1 to n do begin
        readln(ch);
        if ch='H' then a[i]:=a[i-1]+1 else a[i]:=a[i-1]-1;
    end;
    fillchar(f,sizeof(f),$7f);
    f[0]:=0;
    for i:=1 to n do
      for j:=0 to i-1 do
        if (abs(a[i]-a[j])=i-j) or (abs(a[i]-a[j])<=d) then
	   if f[j]+1<f[i] then f[i]:=f[j]+1;
    writeln(f[n]);
end.