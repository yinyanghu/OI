program ural1292;
const
  maxlen=14;
  maxnum=11111;
var
  next:array[1..maxnum]of word;
  res:array[1..maxnum,1..maxlen]of word;
  t,n,k,l,i:word;
begin
  for n:=1 to maxnum do begin
    t:=n*3;
    repeat
      inc(next[n],power(t mod 10,3));
      t:=t div 10;
    until t=0;
    next[n]:=next[n] div 3;
  end;

  for n:=1 to maxnum do begin
    res[n,1]:=n;
    for i:=2 to maxlen do
      res[n,i]:=next[res[n,i-1]];
  end;

  read(t);
  for i:=1 to t do begin
    read(n,k,l);
    if n>maxlen then writeln(153-l) else writeln(res[k div 3,n]*3-l);
  end;
end.
