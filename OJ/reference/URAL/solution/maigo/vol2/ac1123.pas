program ural1123;
var
  s:ansistring;
  i,j:integer;
procedure incbyte(p:integer);
  begin
    while s[p]='9' do begin
      s[p]:='0';
      dec(p);
    end;
    inc(s[p]);
  end;
begin
  readln(s);
  for i:=1 to length(s) div 2 do begin
    j:=length(s)+1-i;
    if s[i]>=s[j] then
      s[j]:=s[i]
    else begin
      incbyte(j-1);
      s[j]:=s[i];
    end;
  end;
  writeln(s);
end.
