var
        i,j     :       longint;
        s       :       string;
begin
  readln(s);
  j:=0;
  for i:=1 to length(s) do
    j:=(j*10+ord(s[i])-48) mod 7;
  writeln(j);
end.