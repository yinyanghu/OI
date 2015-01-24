program ural1181;
const
  maxn=1000;
  colorstr='RGB';
var
  count:array[1..3]of word;
  color:array[1..maxn]of byte;
  prev,next:array[1..maxn]of word;
  n,i:word;
  c:char;
begin
  readln(n);
  for i:=1 to n do begin
    read(c);
    color[i]:=pos(c,colorstr);
    inc(count[color[i]]);
    if i=1 then prev[i]:=n else prev[i]:=i-1;
    if i=n then next[i]:=1 else next[i]:=i+1;
  end;

  writeln(n-3);
  i:=1;
  repeat
    repeat
      i:=next[i];
    until (color[prev[i]]<>color[next[i]]) and (count[color[i]]>1);
    writeln(prev[i],' ',next[i]);
    dec(count[color[i]]);
    next[prev[i]]:=next[i];prev[next[i]]:=prev[i];
    dec(n);
  until n=3;
end.
