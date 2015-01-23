program p1572;
var n,i,x,y,total:longint;
    well,cover:double;
function getmin(x,p:longint):double;
 begin
     case p of
         1:getmin:=x*2;
         2:getmin:=x;
         3:getmin:=sqrt(3)/2*x;
     end;
 end;

function getmax(x,p:longint):double;
 begin
     case p of
         1:getmax:=x*2;
         2:getmax:=sqrt(2)*x;
         3:getmax:=x;
     end;
 end;

begin
    readln(x,y);
    well:=getmax(y,x);
    total:=0;
    readln(n);
    for i:=1 to n do begin
        readln(x,y);
        cover:=getmin(y,x);
        if cover<=well then inc(total);
    end;
    writeln(total);
end.