program ural1172;
const
  maxn=30;
type
  bignum=array[-1..41]of word;
var
  a,b,c:array[boolean,0..maxn,0..maxn]of bignum;
  n,i,j,k:byte;
function sum(a,b:bignum):bignum;
  var
    i:byte;
  begin
    if b[-1]>a[-1] then a[-1]:=b[-1];
    for i:=0 to a[-1] do begin
      inc(a[i],b[i]);
      if a[i]>999 then begin
        inc(a[i+1]);dec(a[i],1000);
      end;
    end;
    if a[a[-1]+1]>0 then inc(a[-1]);
    sum:=a;
  end;
function pro(a:bignum;b:byte):bignum;
  var
    i:byte;
  begin
    for i:=0 to a[-1] do
      a[i]:=a[i]*b;
    for i:=0 to a[-1] do
      if a[i]>999 then begin
        inc(a[i+1],a[i] div 1000);
        a[i]:=a[i] mod 1000;
      end;
    while a[a[-1]+1]>0 do begin
      inc(a[-1]);
      a[a[-1]+1]:=a[a[-1]] div 1000;
      a[a[-1]]:=a[a[-1]] mod 1000;
    end;
    pro:=a;
  end;
procedure out(a:bignum);
  var
    i:shortint;
  begin
    write(a[a[-1]]);
    for i:=a[-1]-1 downto 0 do
      write(a[i] div 100,a[i] div 10 mod 10,a[i] mod 10);
    writeln;
  end;
begin
  read(n);
  a[true,0,0,0]:=1;
  for i:=1 to n do
    for j:=0 to n do
      for k:=0 to n do begin
        if i+j+k=1 then continue;
        if i>1 then a[odd(i),j,k]:=pro(sum(b[not odd(i),j,k],c[not odd(i),j,k]),i-1);
        if j>0 then b[odd(i),j,k]:=pro(sum(a[odd(i),j-1,k],c[odd(i),j-1,k]),j);
        if k>0 then c[odd(i),j,k]:=pro(sum(a[odd(i),j,k-1],b[odd(i),j,k-1]),k);
      end;
  out(b[odd(n),n,n]);
end.
