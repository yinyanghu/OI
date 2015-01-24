program ural1222;
const
  maxdigit=500;
type
  bignum=array[0..maxdigit]of byte;
var
  n,l,i:word;
  a:bignum;
procedure multiply(x:byte);
  var
    i:word;
  begin
    for i:=0 to l do
      a[i]:=a[i]*x;
    for i:=0 to l do begin
      inc(a[i+1],a[i] div 10);
      a[i]:=a[i] mod 10;
    end;
    while a[l+1]>0 do begin
      inc(l);
      a[l+1]:=a[l] div 10;
      a[l]:=a[l] mod 10;
    end;
  end;
begin
  a[0]:=1;
  read(n);
  if n>1 then
    case n mod 3 of
      0:for i:=1 to n div 3 do multiply(3);
      1:begin for i:=1 to (n-4) div 3 do multiply(3);multiply(4);end;
      2:begin for i:=1 to n div 3 do multiply(3);multiply(2);end;
    end;
  for i:=l downto 0 do
    write(a[i]);
  writeln;
end.
