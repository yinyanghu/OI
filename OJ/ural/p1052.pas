program p1052;
type data=record
         x,y:longint;
     end;
var a:array[1..200] of data;
    n,i,j,k,total,max:longint;

function line(a,b,c:data):boolean;
 var x1,y1,x2,y2:longint;
  begin
      x1:=b.x-a.x;
      y1:=b.y-a.y;
      x2:=c.x-a.x;
      y2:=c.y-a.y;
      if x1*y2=x2*y1 then line:=true else line:=false;
  end;

begin
    readln(n);
    for i:=1 to n do readln(a[i].x,a[i].y);
    max:=0;
    for i:=1 to n-1 do
      for j:=i+1 to n do begin
          total:=2;
          for k:=1 to n do begin
              if (k<>i) and (k<>j) then
                 if line(a[i],a[j],a[k]) then inc(total);
          end;
          if total>max then max:=total;
      end;
    writeln(max);
end.