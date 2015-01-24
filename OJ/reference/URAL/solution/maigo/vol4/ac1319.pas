program ural1319;
const
  maxn=100;
var
  map:array[1..maxn,1..maxn]of word;
  n,x,y,t:byte;
  i:word;
begin
  read(n);
  x:=1;y:=n;map[x,y]:=1;
  for i:=2 to n*n do begin
    if (x=n) or (y=n) then begin
      t:=n+1-x;x:=n+1-y;y:=t;
      if y>1 then dec(y) else inc(x);
    end
    else begin
      inc(x);inc(y);
    end;
    map[x,y]:=i;
  end;

  for x:=1 to n do begin
    for y:=1 to n-1 do
      write(map[x,y],' ');
    writeln(map[x,n]);
  end;
end.
