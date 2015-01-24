//Written on 6176 -- Mar 24, 2005
program permut1;
const
  maxn=12;
  maxk=98;
var
  f:array[1..maxn,0..maxk]of cardinal;
  n,k,t,i:byte;
begin
  f[1,0]:=1;
  for n:=2 to maxn do begin
    f[n,0]:=1;
    for k:=1 to n-1 do
      f[n,k]:=f[n,k-1]+f[n-1,k];
    for k:=n to maxk do
      f[n,k]:=f[n,k-1]+f[n-1,k]-f[n-1,k-n];
  end;
  read(t);
  for i:=1 to t do begin
    read(n,k);
    writeln(f[n,k]);
  end;
end.
