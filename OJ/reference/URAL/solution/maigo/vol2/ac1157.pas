program ural1157;
const
  max=10000;
var
  rec:array[1..max]of byte;
  m,n,k,l:word;
procedure calrec(x:word);
  var
    i:byte;
  begin
    for i:=1 to trunc(sqrt(x)) do
      if x mod i=0 then inc(rec[x]);
  end;
begin
  read(m,n,k);
  for l:=1 to k do
    calrec(l);
  for l:=k+1 to max do begin
    calrec(l);
    if (rec[l]=n) and (rec[l-k]=m) then begin
      writeln(l);
      halt;
    end;
  end;
  writeln(0);
end.
