program ackerman;
var m,n:integer;
    t:integer;
function ack(a,b:integer):integer;
 begin
     if (a=0) then ack:=b+1
       else if (b=0) then ack:=ack(a-1,1)
         else ack:=ack(a-1,ack(a,b-1));
 end;

begin
    readln(m,n);
    t:=ack(m,n);
    writeln(t);
    readln;
end.
