//Written on 6110 -- Jan 17, 2005
program fctrl2;
const
  maxn=100;
  base=10000000;
type
  bignum=array[-1..23]of longint;
var
  f:array[1..maxn]of bignum;
  n,t,i,j,k:shortint;
  s:string;
begin
  fillchar(f,sizeof(f),0);
  f[1,-1]:=0;f[1,0]:=1;
  for n:=2 to maxn do begin
    for i:=0 to f[n-1,-1] do begin
      inc(f[n,i],f[n-1,i]*n);
      f[n,i+1]:=f[n,i] div base;
      f[n,i]:=f[n,i] mod base;
    end;
    f[n,-1]:=f[n-1,-1]+ord(f[n,f[n-1,-1]+1]>0);
  end;

  read(t);
  for i:=1 to t do begin
    read(n);
    write(f[n,f[n,-1]]);
    for j:=f[n,-1]-1 downto 0 do begin
      str(f[n,j],s);
      for k:=length(s) to 6 do write('0');
      write(f[n,j]);
    end;
    writeln;
  end;
end.
