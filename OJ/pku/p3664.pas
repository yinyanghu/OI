program p3664;
const maxn=50000;
type node=record
	 x,y,num:longint;
     end;
var a:array[1..maxn] of node;
    i,k,n,max,win:longint;
procedure sort(l,r:longint);
 var i,j,x:longint;
     y:node;
 begin
     i:=l; j:=r; x:=a[(l+r) shr 1].x;
     repeat
	while a[i].x>x do inc(i);
	while a[j].x<x do dec(j);
	if i<=j then begin
	    y:=a[i]; a[i]:=a[j]; a[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;
 
begin
    readln(n,k);
    for i:=1 to n do begin
        a[i].num:=i;
	readln(a[i].x,a[i].y);
    end;
    sort(1,n);
    win:=0; max:=-1;
    for i:=1 to k do
        if a[i].y>max then begin
	    max:=a[i].y; win:=a[i].num;
        end;
    writeln(win);
end.
