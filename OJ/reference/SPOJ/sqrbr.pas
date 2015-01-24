//Written on 6154 -- Mar 2, 2005
program sqrbr;
const
  maxn=19;
var
  count:array[boolean,0..maxn]of longint;
  t,u,n,k,p,i,j:shortint;
function bottom(x:byte):byte;
  begin
    if x>n then bottom:=n*2-x else bottom:=x;
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(n,k,p);
    fillchar(count[false],sizeof(count[false]),0);
    count[false,0]:=1;
    for i:=1 to n*2 do begin
      fillchar(count[odd(i)],sizeof(count[odd(i)]),0);
      for j:=1 to bottom(i) do
        inc(count[odd(i),j],count[not odd(i),j-1]);
      if i<>p then
        for j:=1 to bottom(i-1) do
          inc(count[odd(i),j-1],count[not odd(i),j])
      else
        if k>1 then begin read(p);dec(k);end;
    end;
    writeln(count[false,0]);
  end;
end.
