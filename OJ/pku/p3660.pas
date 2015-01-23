program p3660;
const maxn=100;
var n,m,i,j,k,x,y,total:longint;
    flag:boolean;
    f:array[1..maxn,1..maxn] of boolean;
begin
    readln(n,m);
    fillchar(f,sizeof(f),false);
    for i:=1 to n do f[i,i]:=true;
    for i:=1 to m do begin
        readln(x,y);
	f[x,y]:=true;
    end;
    for k:=1 to n do
	for i:=1 to n do
	    if f[i,k] then for j:=1 to n do
		if f[k,j] then f[i,j]:=true;
    total:=0;
    for i:=1 to n do begin
        flag:=true;
	for j:=1 to n do
	    if (not f[i,j]) and (not f[j,i]) then begin
	        flag:=false; break;
	    end;
	if flag then inc(total);
    end;
    writeln(total);		
end.
