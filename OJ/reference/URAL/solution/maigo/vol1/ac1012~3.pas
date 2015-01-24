{This works for both 1012 and 1013}
program ural1012_3;
const
  l=1783;
type
  bignum=array[0..l]of integer;
var
  n,d,i,j:integer;
  k:byte;
  a,b,c:bignum;
begin
  readln(n,k);
  fillchar(a,sizeof(a),0);fillchar(b,sizeof(b),0);
  a[0]:=1;b[0]:=k-1;d:=0;
  for i:=2 to n do begin
    for j:=0 to d do
      c[j]:=(k-1)*(a[j]+b[j]);
    a:=b;b:=c;
    j:=0;
    repeat
      inc(b[j+1],b[j] div 10);
      b[j]:=b[j] mod 10;
      if (b[j+1]=0) and (j>=d) then break;
      inc(j);
    until false;
    d:=j;
  end;

  for i:=d downto 0 do
    write(b[i]);
  writeln;
end.
