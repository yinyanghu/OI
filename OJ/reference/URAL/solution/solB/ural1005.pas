var
        f                     :       array[0..2000001] of boolean;
        a                     :       array[1..20     ] of longint;
        i,j,k,ans,sum,n,maxt  :       longint;
begin
  read(n);
  fillchar(f,sizeof(f),false);
  f[0]:=true;
  maxt:=0;
  for i:=1 to n do
    begin
      read(a[i]);
      inc(sum,a[i]);
    end;
  ans:=sum;
  for i:=1 to n do
    for j:=maxt downto 0 do
      if f[j] then
        begin
          f[j+a[i]]:=true;
          if j+a[i]>maxt then maxt:=j+a[i];
          if abs(sum-(j+a[i])*2)<ans then ans:=abs(sum-(j+a[i])*2);
        end;
  writeln(ans);
end.
