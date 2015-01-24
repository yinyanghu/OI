//Written on 6196 -- Apr 13, 2005
program partit;
const
  maxm=219;
  maxn=9;
var
  f:array[1..maxm,1..maxn]of longint;
  i,j,t,u,v,m,n,k,a:longint;
begin
  for i:=1 to maxm do f[i,1]:=1;
  for j:=2 to maxn do
    for i:=1 to maxm do begin
      t:=i-1;
      while t>0 do begin
        inc(f[i,j],f[t,j-1]);
        dec(t,j);
      end;
    end;

  read(u);
  for v:=1 to u do begin
    read(m,n,k);a:=0;
    for i:=n downto 2 do begin
      j:=1;t:=m-1;
      repeat
        dec(k,f[t,i-1]);
        if k<=0 then break;
        inc(j);dec(t,i);
      until false;
      inc(k,f[t,i-1]);write(a+j,' ');dec(m,(j-1)*i+1);inc(a,j-1);
    end;
    writeln(a+m);
  end;
end.
