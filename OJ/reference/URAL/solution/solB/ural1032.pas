var
        f,a        :       array[0..10000] of longint;
        i,j,k,n    :       longint;
procedure print(x,y:longint);
begin
  writeln(y-x+1);
  for i:=x  to y do
    writeln(a[i]);
  halt;
end;

begin
  k:=0;
  read(n);
  for i:=1 to n do
    begin
      read(j);
      a[i]:=j;
      inc(k,j);
      k:=k mod n;
      if k=0 then
        print(1,i)
             else
        if f[k]=0 then f[k]:=i
             else print(f[k]+1,i);
    end;
end.