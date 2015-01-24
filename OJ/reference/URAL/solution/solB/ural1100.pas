var
        n,i,j,max   :       longint;
        a,b         :       array[1..150000] of longint;

begin
  readln(n);
  max:=0;
  for i:=1 to n do
    begin
      readln(a[i],b[i]);
      if b[i]>max then max:=b[i];
    end;
  for i:=max downto 0 do
    for j:=1 to n do
      if b[j]=i then
        writeln(a[j],' ',b[j]);
end.
