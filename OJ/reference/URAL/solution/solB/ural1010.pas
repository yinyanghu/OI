var
        f                 :       array[1..100000] of int64;
        n,i,ans           :       longint;
        max               :       double;
begin
  read(n);
  max:=0;
  for i:=1 to n do read(f[i]);
  for i:=2 to n do
    if abs(f[i]-f[i-1])>max then
      begin
        max:=abs(f[i]-f[i-1]);
        ans:=i;
      end;
  writeln(ans-1,' ',ans);
end.
