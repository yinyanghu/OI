var
  n,t:smallint;
  r,i,j:shortint;
  ss:array[0..16]of shortint;
begin
  assign(input,'jinzhi.in');reset(input);
  assign(output,'jinzhi.out');rewrite(output);
  while not eof do
  begin
    readln(n,r);
    r:=-r;
    t:=n;
    i:=0;
    while t<>0 do
    begin
      if odd(i) then
        ss[i]:=(t mod r-r) mod r
      else
        ss[i]:=(t mod r+r) mod r;
      t:=t-ss[i];
      t:=t div r;
      inc(i);
    end;
    write(n,'=');
    for j:=i-1 downto 0 do
    begin
      ss[j]:=abs(ss[j]);
      if ss[j]<10 then
        write(ss[j])
      else
        write(chr(ss[j]+55));
    end;
    writeln('(base ',-r,')');
  end;
  readln;
  close(input);
  close(output);
end.
