program ural1104;
const
  mink:byte=2;
  maxk=36;
var
  r:array[2..maxk] of byte;
  k,x:byte;
  c:char;
function chr2num(c:char):byte;
  begin
    if c>'9' then chr2num:=ord(c)-55 else chr2num:=ord(c)-48;
  end;
begin
  fillchar(r,sizeof(r),0);
  repeat
    read(c);
    if eoln then readln;
    x:=chr2num(c);
    if x+1>mink then mink:=x+1;
    for k:=mink to maxk do
      r[k]:=(r[k]{'*k' is omitted}+x) mod (k-1);
  until eof;

  for k:=mink to maxk do
    if r[k]=0 then begin
      writeln(k);
      halt;
    end;
  writeln('No solution.');
end.
