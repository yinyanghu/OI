var
        f                :       array[1..1000] of longint;
        x,y              :       array[1..1000] of longint;
        n,m,i,j,k,max    :       longint;
        ans              :       extended;

begin
  read(n,m,k);
  for i:=1 to k do
    read(x[i],y[i]);
  for i:=1 to k-1 do
    for j:=i+1 to k do
      if (x[i]>x[j]) or ((x[i]=x[j]) and (y[i]>y[j])) then
        begin
          max:=x[i];x[i]:=x[j];x[j]:=max;
          max:=y[i];y[i]:=y[j];y[j]:=max;
        end;
  max:=1;
  for i:=1 to k do f[i]:=1;
  for i:=1 to k-1 do
    for j:=i+1 to k do
      if (x[i]<x[j]) and (y[i]<y[j]) and (f[i]+1>f[j]) then
        begin
          f[j]:=f[i]+1;
          if f[j]>max then max:=f[j];
        end;
  if k=0 then max:=0;
  ans:=n+m-max shl 1;
  ans:=ans+sqrt(2)*max;
  ans:=ans*100;
  writeln(round(ans));
end.