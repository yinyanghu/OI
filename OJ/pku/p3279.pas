program p3279;
const maxn=15;
var a,now:array[1..maxn,1..maxn] of boolean;
    f,ans:array[1..maxn,1..maxn] of longint;
    w:array[0..maxn] of longint;
    min,i,j,m,n,k,total:longint;
    flag:boolean;
procedure fliptile(x,y:longint);
 begin
     now[x,y]:=not now[x,y];
     if (x-1>=1) then now[x-1,y]:=not now[x-1,y];
     if (x+1<=m) then now[x+1,y]:=not now[x+1,y];
     if (y-1>=1) then now[x,y-1]:=not now[x,y-1];
     if (y+1<=n) then now[x,y+1]:=not now[x,y+1];
     inc(total); inc(f[x,y]);
 end;
 
begin
    readln(m,n);
    for i:=1 to m do begin
	for j:=1 to n do begin
	    read(k);
	    a[i,j]:=k=0;
	end;
	readln;
    end;
    w[0]:=1;
    for i:=1 to n do w[i]:=w[i-1] shl 1;
    min:=maxlongint;
    for k:=0 to w[n]-1 do begin
        total:=0;
	fillchar(f,sizeof(f),0);
	for i:=1 to m do
	    for j:=1 to n do now[i,j]:=a[i,j];
	for i:=1 to n do
	    if (w[n-i] and k>0) then fliptile(1,i);
	for i:=2 to m do
	    for j:=1 to n do
		if not now[i-1,j] then fliptile(i,j);
	flag:=true;
	for i:=1 to m do
	    for j:=1 to n do
	        if not now[i,j] then begin
		    flag:=false; break;
		end;
	if (flag) and (total<min) then begin
	    min:=total;
	    for i:=1 to m do
		for j:=1 to n do ans[i,j]:=f[i,j];
	end;
    end;
    if min=maxlongint then writeln('IMPOSSIBLE')
	else begin
	    for i:=1 to m do begin
	        for j:=1 to n-1 do write(ans[i,j],' ');
	        writeln(ans[i,n]);
	    end;
	end;
end.
