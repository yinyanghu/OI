program ural1255;
var
  n,k:word;
function min(a,b:word):word;
  begin
    if a<b then min:=a else min:=b;
  end;
begin
  read(n,k);
  if n<k then
    writeln(0)
  else
    writeln((sqr(n)-sqr(min(n mod k,k-n mod k))) div k);
end.
