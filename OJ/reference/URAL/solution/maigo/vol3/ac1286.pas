program ural1286;
var
  p,q,x,y,a,b,t:int64;
function gcd(a,b:int64):int64;
  var
    t:int64;
  begin
    repeat
      t:=a mod b;a:=b;b:=t;
    until b=0;
    gcd:=a;
  end;
begin
  read(p,q,x,y,a,b);
  p:=abs(p);q:=abs(q);if p<q then begin t:=p;p:=q;q:=t;end;
  x:=abs(x-a);y:=abs(y-b);
  if p=0 then
    if (x=0) and (y=0) then writeln('YES') else writeln('NO')
  else if q=0 then
    if (x mod p=0) and (y mod p=0) then writeln('YES') else writeln('NO')
  else begin
    t:=gcd(p,q);
    if (x mod t>0) or (y mod t>0) then writeln('NO') else begin
      p:=p div t;q:=q div t;
      if odd(p+q) then
        writeln('YES')
      else begin
        x:=x div t;y:=y div t;
        if odd(x+y) then writeln('NO') else writeln('YES');
      end;
    end;
  end;
end.
