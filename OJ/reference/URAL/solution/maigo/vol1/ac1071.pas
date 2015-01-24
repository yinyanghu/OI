program ural1071;
const
  maxd=20;
var
  x,y,r:longint;
procedure check(r:longint);
  var
    a,b:array[1..maxd]of longint;
    la,lb:byte;
  begin
    la:=1;lb:=1;a[1]:=x;b[1]:=y;
    while a[la]>=r do begin
      a[la+1]:=a[la] div r;
      a[la]:=a[la] mod r;
      inc(la);
    end;
    while b[lb]>=r do begin
      b[lb+1]:=b[lb] div r;
      b[lb]:=b[lb] mod r;
      inc(lb);
    end;
    repeat
      if a[la]=b[lb] then dec(lb);
      dec(la);
    until (lb=0) or (la<lb);
    if lb=0 then begin
      writeln(r);
      halt;
    end;
  end;
begin
  readln(x,y);
  for r:=2 to x do
    check(r);
  writeln('No solution');
end.
