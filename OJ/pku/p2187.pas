program p2187;
const maxn=50000;
      zero=1e-6;
type point=record
         x,y:longint;
     end;
var n:longint;
    p,s:array[1..maxn] of point;
    a,num:array[1..maxn] of longint;
    i,j,ans,tot,k:longint;            
function cross(p1,p2,p3:point):longint;
 var x1,x2,y1,y2,k:extended;
 begin
     x1:=p2.x-p1.x; y1:=p2.y-p1.y;
     x2:=p3.x-p1.x; y2:=p3.y-p1.y;
     k:=x1*y2-y1*x2;
     if abs(k)<zero then cross:=0
     	else if k>0 then cross:=1 else cross:=-1;
 end;
 
procedure swap(x,y:longint);
 var k:point;
     w:longint;
 begin
     k:=p[x]; p[x]:=p[y]; p[y]:=k;
     w:=num[x]; num[x]:=num[y]; num[y]:=w;
 end;
 
procedure sort(l,r:longint);
 var i,j:longint;
 begin
     if l>=r then exit;
     i:=l; j:=r;
     repeat
	while (cross(p[1],p[i],p[j])>=0) and (i<j) do inc(i);
	swap(i,j);
	while (cross(p[1],p[i],p[j])>=0) and (i<j) do dec(j);
        swap(i,j);
     until i=j;
     sort(l,i-1); sort(i+1,r);
 end;
 
begin
    readln(n);
    for i:=1 to n do begin
        readln(p[i].x,p[i].y);
        s[i]:=p[i];
        num[i]:=i;
    end;
    k:=1;
    for i:=2 to n do
    	if (p[i].y<p[k].y) or ((p[i].y=p[k].y) and (p[i].x<p[k].x)) then k:=i;
    swap(1,k);
    sort(2,n);
    for i:=1 to 3 do a[i]:=i;
    tot:=3;
    for i:=4 to n do begin
        while cross(p[a[tot]],p[a[tot-1]],p[i])>0 do dec(tot);
        inc(tot); a[tot]:=i;
    end;
    ans:=-1;
    for i:=1 to tot-1 do
    	for j:=i+1 to tot do
             if sqr(s[num[a[i]]].x-s[num[a[j]]].x)+sqr(s[num[a[i]]].y-s[num[a[j]]].y)>ans
             	then ans:=sqr(s[num[a[i]]].x-s[num[a[j]]].x)+sqr(s[num[a[i]]].y-s[num[a[j]]].y);
    writeln(ans);
end.