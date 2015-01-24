//Written on 6425 -- Nov 28, 2005
program acode;
var
  c:char;
  d1,d2:byte;
  a0,a1,a2:int64;
begin
  repeat
    read(c);if c='0' then halt;
    d2:=ord(c)-48;a1:=1;a2:=1;
    while not eoln do begin
      d1:=d2;read(c);d2:=ord(c)-48;
      a0:=a1;a1:=a2;a2:=0;
      if d2>0 then inc(a2,a1);
      if (d1*10+d2) in [10..26] then inc(a2,a0);
    end;
    readln;writeln(a2);
  until false;
end.
