program ural1038;
var
  c:char;
  sen,wor:boolean;
  mis:integer;
function cap(c:char):boolean;
  begin
    if (c>='A') and (c<='Z') then cap:=true else cap:=false;
  end;
function small(c:char):boolean;
  begin
    if (c>='a') and (c<='z') then small:=true else small:=false;
  end;
begin
  sen:=false;wor:=false;mis:=0;
  repeat
    read(c);
    if c<' ' then begin
      wor:=false;
      continue;
    end;
    if (not sen) and small(c) then inc(mis);
    if wor and cap(c) then inc(mis);
    if (c='.') or (c='!') or (c='?') then
      sen:=false
    else if cap(c) or small(c) then
      sen:=true;
    if cap(c) or small(c) then wor:=true else wor:=false;
  until eof;
  writeln(mis);
end.
