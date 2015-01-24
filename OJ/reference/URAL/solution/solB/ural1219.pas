var
        s       :       ansistring;
        i       :       longint;
begin
  setlength(s,1000000);
  randseed:=19890706;
  for i:=1 to 1000000 do
    s[i]:=chr(random(26)+97);
  writeln(s);
end.