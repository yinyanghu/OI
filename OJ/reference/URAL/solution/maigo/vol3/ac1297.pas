program ural1297;
const
  maxl=1000;
var
  c:array[1..maxl]of char;
  len,i,max,start:word;
procedure extend(s,t:word);
  begin
    while (s>1) and (t<len) do begin
      if c[s-1]<>c[t+1] then break;
      dec(s);inc(t);
    end;
    if t-s+1>max then begin
      max:=t-s+1;
      start:=s;
    end;
  end;
begin
  repeat
    inc(len);
    read(c[len]);
  until eoln;

  for i:=1 to len do
    extend(i,i);
  for i:=2 to len do
    if c[i-1]=c[i] then
      extend(i-1,i);

  for i:=start to start+max-1 do
    write(c[i]);
  writeln;
end.
