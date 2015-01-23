{
ID:lijianx1
PROG:frac1
LANG:PASCAL
}
program frac1;
type node=record
	 n,d:longint;
	 v:double;
     end;

var i,j,n,k:longint;
    a:array[1..10000] of node;

function gcd(a,b:longint):longint;
 begin
     if b=0 then gcd:=a else gcd:=gcd(b,a mod b);
 end;

procedure qsort(l,r:longint);
 var i,j:longint;
     x:double;
     y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2].v;
     repeat
	while a[i].v<x do inc(i);
	while a[j].v>x do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

begin
    assign(input,'frac1.in'); reset(input);
    assign(output,'frac1.out'); rewrite(output);
    readln(n); k:=0;
    for i:=1 to n do
	for j:=1 to i do
	    if gcd(i,j)=1 then begin
		inc(k);
		a[k].d:=i; a[k].n:=j; a[k].v:=j/i;
	    end;
    qsort(1,k);
    writeln('0/1');
    for i:=1 to k do writeln(a[i].n,'/',a[i].d);
    close(input);
    close(output);
end.