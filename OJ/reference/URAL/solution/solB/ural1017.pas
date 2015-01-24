var
                f        :       array[0..500] of qword;
                i,j,k,n  :       longint;
begin
  fillchar(f,sizeof(f),0);
  readln(n);
  f[0]:=1;
  for i:=1 to n do
    for j:=n downto i do
      inc(f[j],f[j-i]);
  writeln(f[n]-1);
end.