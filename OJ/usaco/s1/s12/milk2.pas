{
ID:lijianx1
PROG:milk2
LANG:PASCAL
}
program milk2;
type node=record
	 x,y:longint;
     end;
var a:array[1..5000] of node;
    i,n,max1,max2,s,t:longint;
procedure sort(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) div 2].x;
     repeat
	while a[i].x<x do inc(i);
	while a[j].x>x do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;

begin
    assign(input,'milk2.in'); reset(input);
    readln(n);
    for i:=1 to n do readln(a[i].x,a[i].y);
    close(input);
    sort(1,n);
    max1:=0; max2:=0;
    s:=a[1].x; t:=a[1].y;
    for i:=2 to n do 
       if a[i].x<=t then begin
	  if a[i].y>t then t:=a[i].y;
       end else begin
	   if t-s>max1 then max1:=t-s;
	   if a[i].x-t>max2 then max2:=a[i].x-t;
	   s:=a[i].x; t:=a[i].y; 
       end;
    if t-s>max1 then max1:=t-s;
    assign(output,'milk2.out'); rewrite(output);
    writeln(max1,' ',max2);
    close(output);
end.
