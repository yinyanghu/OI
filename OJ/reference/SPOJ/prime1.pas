//Written on 6106 -- Jan 13, 2005
program prime1;
const
  max=1000000000;
var
  p:array[1..3401]of word;
  primes,i,j,t,m,n:longint;
function prime(x:longint):boolean;
  var
    r,i:longint;
  begin
    r:=trunc(sqrt(x));
    for i:=1 to primes do begin
      if p[i]>r then break;
      if x mod p[i]=0 then begin
        prime:=false;exit;
      end;
    end;
    prime:=true;
  end;
begin
  primes:=0;
  for i:=2 to trunc(sqrt(max)) do
    if prime(i) then begin
      inc(primes);
      p[primes]:=i;
    end;

  read(t);
  for i:=1 to t do begin
    if i>1 then writeln;
    read(m,n);
    for j:=m to n do
      if (j>1) and prime(j) then writeln(j);
  end;
end.
