program ural1174;
const
  maxn=100;
  maxdigit=200;
var
  p:array[1..maxn]of byte;
  n,i,j,x,d:byte;
  ans:array[0..maxdigit]of integer;
procedure mul(x:byte);
  var
    i:byte;
  begin
    for i:=0 to d do
      ans[i]:=ans[i]*x;
    for i:=0 to d do begin
      inc(ans[i+1],ans[i] div 10);
      ans[i]:=ans[i] mod 10;
    end;
    while ans[d+1]>0 do begin
      inc(d);
      ans[d+1]:=ans[d] div 10;
      ans[d]:=ans[d] mod 10;
    end;
  end;
procedure sub(x:byte);
  var
    i:byte;
    t:word;
  begin
    dec(ans[0],x);
    i:=0;
    while ans[i]<0 do begin
      if ans[i] mod 10=0 then t:=-ans[i] div 10 else t:=-ans[i] div 10+1;
      dec(ans[i+1],t);inc(ans[i],t*10);
      inc(i);
    end;
    while ans[d]=0 do dec(d);
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(x);
    p[x]:=i;
  end;
  for i:=n downto 2 do
    for j:=1 to i-1 do
      if p[j]>p[i] then dec(p[j]);

  ans[0]:=1;
  for i:=2 to n do
    if odd(ans[0]) then begin
      mul(i);sub(p[i]-1);
    end
    else begin
      mul(i);sub(i-p[i]);
    end;
  for i:=d downto 0 do
    write(ans[i]);
  writeln;
end.
