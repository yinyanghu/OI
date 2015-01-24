program ural1110;
var
  n,m,y,x,r,i:longint;
  first:boolean;
begin
  readln(n,m,y);
  first:=true;
  for x:=0 to m-1 do begin
    r:=1;
    for i:=1 to n do
      r:=(r*x) mod m;
    if r=y then begin
      if first then first:=false else write(' ');
      write(x);
    end;
  end;
  if first then writeln(-1) else writeln;
end.
