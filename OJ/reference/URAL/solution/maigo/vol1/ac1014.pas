program ural1014;
var
  n:longint;
  q:string;
  i:byte;
begin
  readln(n);
  if n=0 then
    writeln(10)
  else if n=1 then
    writeln(1)
  else begin
    q:='';
    for i:=9 downto 2 do
      while n mod i=0 do begin
        q:=chr(i+48)+q;
        n:=n div i;
      end;
    if n=1 then writeln(q) else writeln(-1);
  end;
end.
