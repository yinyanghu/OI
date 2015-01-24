var
        a              :       array[1..101] of longint;
        ans,n,i,j      :       longint;
begin
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i]>a[j] then
        begin
          ans:=a[i];
          a[i]:=a[j];
          a[j]:=ans;
        end;
  ans:=0;
  for i:=1 to n shr 1+1 do
    inc(ans,a[i] shr 1+1);
  writeln(ans);
end.