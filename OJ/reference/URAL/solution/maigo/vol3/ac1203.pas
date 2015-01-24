program ural1203;
const
  maxt=30000;
var
  s,f:array[0..maxt]of word;
  n,i:longint;
  ts,te:word;
function max(a,b:word):word;
  begin
    if a>b then max:=a else max:=b;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(ts,te);
    s[te]:=max(s[te],ts);
  end;
  for i:=2 to maxt do
    if s[i]=0 then
      f[i]:=f[i-1]
    else
      f[i]:=max(f[s[i]-1]+1,f[i-1]);
  writeln(f[maxt]);
end.
