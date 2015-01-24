program ural1086;
const
  max=15000;
var
  p:array[1..max]of longint;
  k,i,a:integer;
  x:longint;
function prime(x:longint):boolean;
  var
    i:integer;
  begin
    i:=0;
    repeat
      inc(i);
    until (sqr(p[i])>x) or (x mod p[i]=0);
    prime:=sqr(p[i])>x;
  end;
begin
  p[1]:=2;k:=1;x:=1;
  repeat
    inc(x,2);
    if prime(x) then begin
      inc(k);
      p[k]:=x;
    end;
  until k=max;

  read(k);
  for i:=1 to k do begin
    read(a);
    writeln(p[a]);
  end;
end.
