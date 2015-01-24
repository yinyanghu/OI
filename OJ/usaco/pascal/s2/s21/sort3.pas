{
ID:lijianx1
PROG:sort3
LANG:PASCAL
}
program sort3;
const maxn=1000;
var total,i,j,n,k:longint;
    a,c:array[1..maxn] of longint;
    flag:array[1..maxn] of boolean;
    ok:boolean;
procedure sort(l,r:longint);
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
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    assign(input,'sort3.in'); reset(input);
    readln(n);
    for i:=1 to n do readln(a[i]);
    close(input);
    for i:=1 to n do c[i]:=a[i];
    fillchar(flag,sizeof(flag),true);
    sort(1,n);
    total:=0; k:=0;
    for i:=1 to n do begin
	ok:=false;
	if (a[i]<>c[i]) and (flag[i]) then begin
	    for j:=i+1 to n do
		if (a[i]=c[j]) and (a[j]=c[i]) and (flag[j]) then begin
		    inc(total); ok:=true; flag[j]:=false; break;
		end;
	    if not ok then inc(k);
	end;
    end;
    assign(output,'sort3.out'); rewrite(output);
    writeln(total+k div 3*2);
    close(output);
end.
