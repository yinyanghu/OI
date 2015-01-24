program ural1226;
const
  letter:set of char=['A'..'Z','a'..'z'];
var
  s:string;
  c:char;
begin
  repeat
    read(c);
    if c in letter then
      s:=c+s
    else begin
      write(s,c);
      s:='';
    end;
  until eof;
  write(s);
end.
