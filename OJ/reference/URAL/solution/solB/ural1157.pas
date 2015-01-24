var
        count       :       array[1..10000] of longint;
        m,n,k,ans   :       longint;
        i,j,x       :       longint;

procedure prepare;
begin
  readln(m,n,k);
  for i:=1 to 10000 do
    for j:=1 to trunc(sqrt(i)) do
      if i mod j=0 then inc(count[i]);
end;

procedure work;
begin
  for ans:=1 to 10000 do
    if ans-k>0 then
      if (count[ans]=n) and (count[ans-k]=m) then
        begin
          writeln(ans);
          halt;
        end;
  writeln(0);
end;

begin
  prepare;
  work;
end.