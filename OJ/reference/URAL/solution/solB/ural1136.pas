var
        dd,t,l,r,ans :       array[1..3000] of longint;
        size,root    :       longint;
        n,i          :       longint;

procedure insert(var a:longint;x:longint);
begin
  if a=0 then
    begin
      inc(size);
      a:=size;
      t[size]:=x;
      l[size]:=0;
      r[size]:=0;
    end
  else
    if x<t[a] then insert(l[a],x)
              else insert(r[a],x);
end;

procedure print(a:longint);
begin
  if a=0 then exit;
  print(r[a]);
  print(l[a]);
  inc(i);
  ans[i]:=t[a];
end;

begin
//  assign(input,'d.in');reset(input);
  read(n);
  for i:=1 to n do
    read(dd[i]);
  for i:=n downto 1 do insert(root,dd[i]);
  i:=0;
  print(root);
  for i:=1 to n do
    if i<>n then write(ans[i],' ') else writeln(ans[i]);
end.