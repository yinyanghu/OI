program ural1094;
const
  width=80;
var
  s:array[1..width]of char;
  c:char;
  p:byte;
begin
  fillchar(s,sizeof(s),32);p:=1;
  repeat
    read(c);
    if c>=' ' then
      if c='>' then begin
        inc(p);
        if p>width then p:=1;
      end
      else if c='<' then begin
        dec(p);
        if p=0 then p:=1;
      end
      else begin
        s[p]:=c;
        inc(p);
        if p>width then p:=1;
      end;
  until eof;

  for p:=1 to width do
    write(s[p]);
  writeln;
end.
