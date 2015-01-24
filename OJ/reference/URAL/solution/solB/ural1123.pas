var
        s,src       :       ansistring;
        ch          :       char;
        i           :       longint;
begin
  readln(src);
  s:=src;
  if odd(length(src))
    then
      begin
        for i:=length(s) shr 1+2 to length(s) do
          s[i]:=s[length(s)-i+1];
        if s<src then
          s[length(s) shr 1+1]:=chr(ord(s[length(s) shr 1+1])+1);
      end
    else
      begin
        for i:=length(s) shr 1+1 to length(s) do
          s[i]:=s[length(s)-i+1];
        if s<src then
          begin
            s[length(s) shr 1]:=chr(ord(s[length(s) shr 1])+1);
            s[length(s) shr 1+1]:=s[length(s) shr 1];
          end;
      end;
  for i:=1 to length(s) do
    if s[i]>'9' then
  writeln(s);
end.
