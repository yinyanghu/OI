program ural1143;
const
  maxn=200;
  inf=1e38;
var
  x,y:array[1..maxn+1]of real;
  d:array[1..maxn+1,1..maxn+1]of real;
  l1,l2:array[1..maxn+1]of real;
  f:array[boolean,2..maxn+1,0..1]of real;
  n,i,j:byte;
  ans:real;
function min(a,b:real):real;
  begin
    if a<b then min:=a else min:=b;
  end;
begin
  read(n);
  for i:=1 to n do
    read(x[i],y[i]);
  x[n+1]:=x[1];y[n+1]:=y[1];

  for i:=1 to n+1 do
    for j:=1 to n+1 do
      d[i,j]:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]));

  l1[1]:=0;for i:=2 to n do l1[i]:=l1[i-1]+d[i-1,i];
  l2[n+1]:=0;for i:=n downto 2 do l2[i]:=l2[i+1]+d[i+1,i];

  f[true,n+1,0]:=0;f[true,n+1,1]:=0;
  for i:=2 to n do begin
    f[true,i,0]:=l2[i];for j:=i+2 to n+1 do f[true,i,0]:=min(f[true,i,0],l2[i]+d[j,i]-d[j,j-1]);
    f[true,i,1]:=l2[i];for j:=i to n-2 do f[true,i,1]:=min(f[true,i,1],l2[i]+d[n+1,j]-d[j+1,j]);
  end;
  ans:=min(f[true,2,0],f[true,2,1]);

  for i:=2 to n do begin
    f[odd(i),n+1,0]:=l1[i];for j:=3 to i do f[odd(i),n+1,0]:=min(f[odd(i),n+1,0],l1[i]+d[1,j]-d[j-1,j]);
    f[odd(i),n+1,1]:=l1[i];for j:=1 to i-2 do f[odd(i),n+1,1]:=min(f[odd(i),n+1,1],l1[i]+d[j,i]-d[j,j+1]);
    for j:=n downto 2 do begin
      f[odd(i),j,0]:=min(f[not odd(i),j,0]+d[i-1,i],f[not odd(i),j,1]+d[j,i]);
      f[odd(i),j,1]:=min(f[odd(i),j+1,0]+d[i,j],f[odd(i),j+1,1]+d[j+1,j]);
    end;
    ans:=min(ans,min(f[odd(i),i+1,0],f[odd(i),i+1,1]));
  end;
  writeln(ans:0:3);
end.
