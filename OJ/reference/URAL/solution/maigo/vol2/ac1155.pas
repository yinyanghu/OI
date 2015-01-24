program ural1155;
var
  a,b,c,d,e,f,g,h:byte;
begin
  readln(a,b,c,d,e,f,g,h);
  if a+c+f+h<>b+d+e+g then begin
    writeln('IMPOSSIBLE');
    halt;
  end;
  while (e<a) or (f<b) do begin
    writeln('EF+');
    inc(e);inc(f);
  end;
  while (g<c) or (h<d) do begin
    writeln('GH+');
    inc(g);inc(h);
  end;
  while a>0 do begin
    writeln('AE-');
    dec(a);dec(e);
  end;
  while b>0 do begin
    writeln('BF-');
    dec(b);dec(f);
  end;
  while c>0 do begin
    writeln('CG-');
    dec(c);dec(g);
  end;
  while d>0 do begin
    writeln('DH-');
    dec(d);dec(h);
  end;
  while (e>0) and (f>0) do begin
    writeln('EF-');
    dec(e);dec(f);
  end;
  while (g>0) and (h>0) do begin
    writeln('GH-');
    dec(g);dec(h);
  end;
  while e>0 do begin
    writeln('EH-');
    dec(e);dec(h);
  end;
  while f>0 do begin
    writeln('FG-');
    dec(f);dec(g);
  end;
end.
