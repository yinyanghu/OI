program ural1098;
const
  n=1999;
  maxl=30000;
var
  q:array[1..maxl]of char;
  l,p,i:integer;
  c:char;
begin
  l:=0;
  repeat
    read(c);
    if c>=' ' then begin
      inc(l);
      q[l]:=c;
    end;
  until eof;

  p:=1;
  for i:=2 to l do begin
    p:=(n+p) mod i;
    if p=0 then p:=i;
  end;

  case q[p] of
    '?':writeln('Yes');
    ' ':writeln('No');
    else writeln('No comments');
  end;
end.
