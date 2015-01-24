program ural1044;
const
  maxd=99;
type
  bignum=array[0..maxd]of integer;
var
  c:array[0..450]of bignum;
  n,i:byte;
  s,j,k:integer;
procedure add(var a,b:bignum);
  var
    i:byte;
  begin
    for i:=0 to maxd do begin
      inc(a[i],b[i]);
      if a[i]>=10 then begin
        inc(a[i+1]);
        dec(a[i],10);
      end;
    end;
  end;
procedure out(x:bignum);
  var
    y:bignum;
    d,i,j:shortint;
  begin
    fillchar(y,sizeof(y),0);
    for d:=maxd downto 0 do
      if x[d]>0 then break;
    for i:=0 to d do
      for j:=0 to d do
        inc(y[i+j],x[i]*x[j]);
    for i:=0 to d*2-1 do begin
      inc(y[i+1],y[i] div 10);
      y[i]:=y[i] mod 10;
    end;
    for i:=d*2 downto 0 do
      write(y[i]);
    writeln;
  end;
begin
  readln(n,s);
  if odd(s) or (s>n*18) then begin
    writeln(0);
    halt;
  end;

  fillchar(c,sizeof(c),0);
  for i:=0 to 9 do
    c[i][0]:=1;
  for i:=1 to n-1 do
    for j:=9*i downto 0 do
      for k:=9 downto 1 do
        add(c[j+k],c[j]);
  out(c[s div 2]);
end.
