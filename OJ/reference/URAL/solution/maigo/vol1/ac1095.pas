program ural1095;
const
  tail:array[0..6]of integer=(3241,2134,1342,1243,2341,1234,1324);
var
  s:array[0..4]of byte;
  n,i:integer;
  c:char;
  d:byte;
  x:int64;
begin
  readln(n);
  for i:=1 to n do begin
    fillchar(s,sizeof(s),0);x:=0;
    repeat
      read(c);d:=ord(c)-48;
      if d=0 then
        inc(s[0])
      else if (d<5) and (s[d]=0) then
        s[d]:=1
      else
        x:=x*10+d;
    until eoln;
    readln;
    if x>0 then write(x);
    write(tail[(x mod 7)*10000 mod 7]);
    for d:=1 to s[0] do
      write(0);
    writeln;
  end;
end.
