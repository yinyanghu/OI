program gaochuweishu;
var x,y:longint;
    i,j,m,z:integer;
begin
   readln(x);
   readln(y);
   readln(m);
   if (x mod y)=0 then write(x div y)
    else begin
      while (x>y) do begin
         write(x div y);
         x:=x mod y;
      end;
      writeln;
      if x<y then write('0.');
      for i:=1 to m do begin
         x:=(x mod y)*10;
         write (x div y);
      end;
   end;
end.