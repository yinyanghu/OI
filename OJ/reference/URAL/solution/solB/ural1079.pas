var
        f       :       array[0..100000] of longint;
        i,k,max :       longint;
begin
  f[0]:=0;
  f[1]:=1;
  for i:=2 to 100000 do
    begin
      f[i]:=f[i shr 1];
      if odd(i) then inc(f[i],f[i shr 1+1]);
    end;
  repeat
    readln(k);
    if k=0 then halt;
    max:=0;
    for i:=0 to k do if f[i]>max then max:=f[i];
    writeln(max);
  until false;


end.