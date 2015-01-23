{
ID:lijianx1
PROG:ariprog
LANG:PASCAL
}
program ariprog;
const maxm=250;
var ok:array[0..sqr(maxm)*2] of boolean;
    a:array[1..10000] of longint;
    s:array[1..21047] of longint;
    n,m,i,j,d,p,total:longint;
procedure check;
 var t,k:longint;
 begin
     t:=s[i]+d;
     for k:=3 to n do begin
	 t:=t+d;
	 if not ok[t] then exit;
     end;
     inc(total);
     a[total]:=d shl 18+i;
 end;

procedure qsort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2];
     repeat
        while a[i]<x do inc(i);
        while a[j]>x do dec(j);
        if i<=j then begin
            y:=a[i]; a[i]:=a[j]; a[j]:=y;
            inc(i); dec(j);
        end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

begin
    assign(input,'ariprog.in'); reset(input);
    assign(output,'ariprog.out'); rewrite(output);
    readln(n); readln(m);
    fillchar(ok,sizeof(ok),false);
    for i:=0 to m do
       for j:=i to m do ok[i*i+j*j]:=true;
    p:=0;
    m:=m*m*2;
    for i:=0 to m do
	if ok[i] then begin
	    inc(p); s[p]:=i;
	end;
    total:=0;
    for i:=1 to p-1 do
	for j:=i+1 to p do begin
	    d:=s[j]-s[i];
	    if s[i]+d*(n-1)>m then break;
	    check;
	end;
    if total=0 then writeln('NONE')
	else begin
            qsort(1,total);
	    for i:=1 to total do writeln(s[a[i] and 262143],' ',a[i] shr 18);
	end;
    close(input);
    close(output);
end.
