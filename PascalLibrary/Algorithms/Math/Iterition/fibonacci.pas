program taijie;
var n,i:integer;
    j,k,p:extended;
begin
    readln(n);
    if (n=1) or (n=2) then writeln(n-1)
       else begin
           j:=0; k:=1;
           for i:=3 to n do begin
               p:=j+k;
               j:=k;
               k:=p;
           end;
           writeln('f(',n,')=',p:0:0)
       end;
    readln;
end.
