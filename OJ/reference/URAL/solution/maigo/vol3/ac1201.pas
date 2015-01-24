program ural1201;
const
  md:array[1..12]of byte=(31,28,31,30,31,30,31,31,30,31,30,31);
  wd:array[1..7]of string[3]=('mon','tue','wed','thu','fri','sat','sun');
var
  y,w:word;
  m,d,i,s:shortint;
  leap:boolean;
begin
  read(d,m,y);
  if (y mod 400=0) or (y mod 100<>0) and (y mod 4=0) then md[2]:=29;
  dec(y);
  y:=y mod 400;
  w:=y div 100*5;
  y:=y mod 100;
  inc(w,y div 4*5+y mod 4);
  for i:=1 to m-1 do
    inc(w,md[i]);
  w:=(w+d) mod 7;
  if w=0 then w:=7;

  s:=d-w;while s>0 do dec(s,7);
  for w:=1 to 7 do begin
    write(wd[w]);
    i:=s+w;
    repeat
      write(' ');
      if i=d then write('[') else write(' ');
      if i>0 then write(i:2) else write('  ');
      if i=d then write(']') else if i+7<=md[m] then write(' ');
      inc(i,7);
    until i>md[m];
    writeln;
  end;
end.
