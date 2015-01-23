program p2139;
const maxn=300;
      exp=0.0001;
var a:array[1..maxn,1..maxn] of longint;
    s:array[1..maxn] of longint;
    ans,point:double;
    n,m,i,j,k,total:longint;
begin
    readln(n,m);
    for i:=1 to n do 
        for j:=1 to n do 
	    if i=j then a[i,j]:=0 else a[i,j]:=maxint;
    for i:=1 to m do begin
        read(total);
	for j:=1 to total do read(s[j]);
	for j:=1 to total-1 do
	    for k:=j+1 to total do begin
	        a[s[j],s[k]]:=1; a[s[k],s[j]]:=1;
	    end;
    end;
    for k:=1 to n do
	for i:=1 to n do 
	    for j:=1 to n do
		if a[i,k]+a[k,j]<a[i,j] then a[i,j]:=a[i,k]+a[k,j];
    ans:=1e10;
    for i:=1 to n do begin
        point:=0; total:=0;
	for j:=1 to n do
	    if a[i,j]>0 then begin
	        inc(total); point:=point+a[i,j];
	    end;
	if total=0 then continue;
	point:=point/total;
	if point<ans then ans:=point;
    end;
    writeln(trunc((ans+exp)*100));
end.
