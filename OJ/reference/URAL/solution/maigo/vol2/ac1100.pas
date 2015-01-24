program ural1100;
const
  maxn=150000;
var
  x:array[1..maxn]of longint;
  n,id,i:longint;
  m,t:byte;
begin
  read(n);
  for i:=1 to n do begin
    read(id,m);
    x[i]:=id shl 7+m;
  end;

  for m:=100 downto 0 do
    for i:=1 to n do begin
      t:=x[i] mod 128;
      if t=m then writeln(x[i] shr 7,' ',t);
    end;
end.
