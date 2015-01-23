program p1011;
var p,q:double;
    k:longint;
begin
    readln(p,q);
    if p=q then writeln('0')
      else begin
          k:=0;
          repeat
             inc(k);
          until trunc(k*p/100+0.000001)+1=trunc(k*q/100-0.000001);
      end;
    writeln(k);
end.