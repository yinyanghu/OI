program ural1209;
var
  n,i:word;
  k,x:cardinal;
  first:boolean;
begin
  read(n);
  first:=true;
  for i:=1 to n do begin
    read(k);
    if first then first:=false else write(' ');
    k:=(k-1)*2;
    x:=trunc(sqrt(k));
    if k=x*(x+1) then write(1) else write(0);
  end;
  writeln;
end.
