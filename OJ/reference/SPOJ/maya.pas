//Written on 6129 -- Feb 5, 2005
program maya;
var
  n,i,x:longint;
  c:char;
begin
  repeat
    readln(n);
    if n=0 then halt;
    x:=0;
    for i:=n downto 1 do begin
      if i=2 then x:=x*18 else x:=x*20;
      repeat
        read(c);
        case c of
          '.':inc(x,1);
          '-':inc(x,5);
        end;
      until eoln;
      readln;
    end;
    writeln(x);
  until false;
end.
