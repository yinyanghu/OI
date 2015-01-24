program ural1083;
var
  n,k:shortint;
  f:longint;
  s:string;
begin
  read(n);
  readln(s);
  k:=length(s)-1;

  f:=1;
  repeat
    f:=f*n;
    dec(n,k);
  until n<=0;

  writeln(f);
end.
