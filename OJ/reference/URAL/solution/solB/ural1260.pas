var
        f       :       array[1..55] of longint;
        n,i     :       longint;

begin
  f[1]:=1;
  f[2]:=1;
  f[3]:=2;
  readln(n);
  for i:=4 to n do
    inc(f[i],f[i-1]+f[i-3]+1);
  writeln(f[n]);
end.