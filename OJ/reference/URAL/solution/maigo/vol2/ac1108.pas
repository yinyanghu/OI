program ural1108;
const
  bignumlen=9999;
type
  bignum=array[-1..bignumlen]of longint;
var
  a,b,c:bignum;
  n,i:byte;
procedure plus1(var x:bignum);
  var
    i:integer;
  begin
    i:=0;
    while x[i]=999 do begin
      x[i]:=0;
      inc(i);
    end;
    inc(x[i]);
    if i>x[-1] then x[-1]:=i;
  end;
procedure mul(var a,b,c:bignum);
  var
    i,j:integer;
  begin
    fillchar(c,sizeof(c),0);
    for i:=0 to a[-1] do
      for j:=0 to b[-1] do
        inc(c[i+j],a[i]*b[j]);
    for i:=0 to a[-1]+b[-1] do
      if c[i]>999 then begin
        inc(c[i+1],c[i] div 1000);
        c[i]:=c[i] mod 1000;
      end;
    if c[a[-1]+b[-1]+1]=0 then c[-1]:=a[-1]+b[-1] else c[-1]:=a[-1]+b[-1]+1;
  end;
procedure out(x:bignum);
  var
    i:integer;
  begin
    write(x[x[-1]]);
    for i:=x[-1]-1 downto 0 do begin
      write(x[i] div 100);
      write(x[i] mod 100 div 10);
      write(x[i] mod 10);
    end;
    writeln;
  end;
begin
  read(n);
  writeln(2);
  a[-1]:=0;a[0]:=1;
  for i:=2 to n do begin
    b:=a;
    plus1(b);
    mul(a,b,c);
    a:=c;
    plus1(c);
    out(c);
  end;
end.
