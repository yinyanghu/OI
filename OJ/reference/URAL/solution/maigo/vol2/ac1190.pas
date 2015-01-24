program ural1190;
var
  n,i,x,c,junk:word;
  min,max:longint;
  s:string;
procedure no;
  begin
    writeln('NO');
    halt;
  end;
begin
  readln(n);
  x:=10000;min:=0;max:=0;c:=0;
  for i:=1 to n do begin
    inc(c);
    readln(s);
    delete(s,1,pos(' ',s));
    if s[1]='1' then begin
      delete(s,1,2);
      val(s,x,junk);
      inc(min,x*c);
      if min>10000 then no;
      c:=0;
    end;
    inc(max,x);
  end;
  if max<10000 then no;
  writeln('YES');
end.
