program ural1114;
const
  maxbox=20;
  maxball=15;
type
  bignum=array[0..19]of byte;
var
  w:array[0..maxball,0..maxbox]of cardinal;
    {w[i,j] is the number of methods to put <=i balls into j boxes}
  x,y,ans:bignum;
  n,a,b,i,j:byte;
procedure makebignum(a:cardinal;var b:bignum);
  var
    i:byte;
  begin
    i:=0;
    while a>0 do begin
      b[i]:=a mod 10;
      a:=a div 10;
      inc(i);
    end;
  end;
procedure multiply(var a,b,c:bignum);
  var
    i,j:byte;
  begin
    fillchar(c,sizeof(c),0);
    for i:=0 to 9 do
      for j:=0 to 9 do
        inc(c[i+j],a[i]*b[j]);
    for i:=0 to 18 do begin
      inc(c[i+1],c[i] div 10);
      c[i]:=c[i] mod 10;
    end;
  end;
begin
  readln(n,a,b);
  if a<b then begin i:=a;a:=b;b:=i;end;
  for i:=0 to a do w[i,0]:=1;
  for i:=1 to n do w[0,i]:=1;
  for i:=1 to n do
    for j:=1 to a do
      w[j,i]:=w[j-1,i]+w[j,i-1];

  makebignum(w[a,n],x);
  makebignum(w[b,n],y);
  multiply(x,y,ans);

  i:=19;
  while ans[i]=0 do dec(i);
  while i>0 do begin
    write(ans[i]);
    dec(i);
  end;
  writeln(ans[0]);
end.
