program ural1224;
var
  n,m:cardinal;
function min(a,b:cardinal):cardinal;
  begin
    if a<b then min:=a else min:=b;
  end;
begin
  read(n,m);
  writeln(min(n*2-2,m*2-1));
end.
