program ural1081;
const
  maxn=43;
var
  count:array[0..maxn]of int64;
  n,i:byte;
  k:int64;
begin
  readln(n,k);
  count[0]:=1;count[1]:=2;
  for i:=2 to n do
    count[i]:=count[i-1]+count[i-2];

  if k>count[n] then
    writeln(-1)
  else begin
    for i:=n-1 downto 0 do
      if k>count[i] then begin
        write(1);
        dec(k,count[i]);
      end
      else
        write(0);
    writeln;
  end;
end.
