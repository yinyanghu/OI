program ural1205;
const
  maxn=200;
var
  x,y:array[0..maxn+1]of real;
  dist:array[0..maxn+1,0..maxn+1]of real;
  sec:array[0..maxn+1,0..maxn+1]of byte;
  route:array[1..maxn]of byte;
  n,i,j,k:byte;
  vfoot,vtrain:real;
begin
  read(vfoot,vtrain,n);
  for i:=1 to n do
    read(x[i],y[i]);
  repeat
    read(i,j);
    if i=0 then break;
    dist[i,j]:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]))/vtrain;sec[i,j]:=j;
    dist[j,i]:=dist[i,j];sec[j,i]:=i;
  until false;
  read(x[0],y[0],x[n+1],y[n+1]);
  for i:=0 to n+1 do
    for j:=0 to n+1 do
      if dist[i,j]=0 then begin
        dist[i,j]:=sqrt(sqr(x[i]-x[j])+sqr(y[i]-y[j]))/vfoot;
        sec[i,j]:=j;
      end;

  for k:=1 to n do
    for i:=0 to n+1 do
      for j:=0 to n+1 do
        if dist[i,k]+dist[k,j]<dist[i,j] then begin
          dist[i,j]:=dist[i,k]+dist[k,j];
          sec[i,j]:=sec[i,k];
        end;

  writeln(dist[0,n+1]:0:7);
  k:=0;i:=0;
  while sec[i,n+1]<>n+1 do begin
    inc(k);route[k]:=sec[i,n+1];i:=route[k];
  end;
  write(k);
  for i:=1 to k do
    write(' ',route[i]);
  writeln;
end.
