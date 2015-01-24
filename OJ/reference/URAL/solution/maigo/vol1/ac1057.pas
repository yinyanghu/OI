program ural1057;
const
  maxb=10;
var
  pow:array[0..30]of longint;
  x,y:longint;
  k,b,xpow,ypow:shortint;
procedure calpow;
  var
    i:shortint;
  begin
    pow[0]:=1;
    for i:=0 to 30 do begin
      if pow[i]>(x-1) div b then xpow:=i;
      if pow[i]>y div b then begin
        ypow:=i;
        exit;
      end;
      pow[i+1]:=pow[i]*b;
    end;
  end;
function c(n,m:shortint):longint;
  var
    a:int64;
    i:shortint;
  begin
    if m>n then begin c:=0;exit;end;
    if m>n div 2 then m:=n-m;
    a:=1;
    for i:=1 to m do
      a:=a*(n+1-i) div i;
    c:=a;
  end;
function count(a:longint;h,k:shortint):longint;
  begin
    if k<0 then
      count:=0
    else if k=0 then
      count:=1
    else if h=-1 then
      count:=0
    else if pow[h]<=a then
      count:=count(a-pow[h],h-1,k-1)+c(h,k)
    else
      count:=count(a,h-1,k);
  end;
begin
  read(x,y,k,b);
  calpow;
  writeln(count(y,ypow,k)-count(x-1,xpow,k));
end.
