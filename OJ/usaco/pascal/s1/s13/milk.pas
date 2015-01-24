{
ID:lijianx1
PROG:milk
LANG:PASCAL
}
program milk;
type node=record
	 p,v:longint;
     end;
var a:array[1..5000] of node;
    n,i,m,total:longint;
procedure sort(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2].p;
     repeat
	while a[i].p<x do inc(i);
	while a[j].p>x do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    assign(input,'milk.in'); reset(input);
    assign(output,'milk.out'); rewrite(output);
    readln(m,n);
    for i:=1 to n do readln(a[i].p,a[i].v);
    sort(1,n); total:=0;
    for i:=1 to n do begin
	if m>a[i].v then begin
	   total:=total+a[i].p*a[i].v;
	   m:=m-a[i].v;
	end else begin
	    total:=total+a[i].p*m;
	    break;
	end;
    end;
    writeln(total);
    close(input);
    close(output);
end.