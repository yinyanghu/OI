program p1588;
type node=record
	 x,y:longint;
     end;
var n,i,j:longint;
    ans:double;
    a:array[1..300] of node;
function dist(p,q:node):double;
 begin
     dist:=sqrt(sqr(p.x-q.x)+sqr(p.y-q.y));
 end;

begin
    readln(n);
    for i:=1 to n do readln(a[i].x,a[i].y);
    ans:=0;
    for i:=1 to n-1 do
	for j:=i+1 to n do ans:=ans+dist(a[i],a[j]);
    writeln(ans:0:0);
end.