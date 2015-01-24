program ural1055;
const
  max=5133;
var
  prime:array[1..max]of word;
  count:array[1..max]of longint;
  n,m,primes,i,c:word;
procedure calprime;
  var
    i,j:word;
    ok:boolean;
  begin
    primes:=0;
    for i:=2 to n do begin
      ok:=true;
      for j:=1 to primes do
        if i mod prime[j]=0 then begin
          ok:=false;
          break;
        end;
      if ok then begin
        inc(primes);
        prime[primes]:=i;
      end;
    end;
  end;
procedure mul(x:word;sign:shortint);
  var
    p:word;
  begin
    p:=1;
    while x>1 do begin
      while x mod prime[p]=0 do begin
        inc(count[p],sign);
        x:=x div prime[p];
      end;
      inc(p);
    end;
  end;
begin
  readln(n,m);
  if m>n div 2 then m:=n-m;

  calprime;

  fillchar(count,sizeof(count),0);
  for i:=1 to m do begin
    mul(n+1-i,1);
    mul(i,-1);
  end;

  c:=0;
  for i:=1 to primes do
    if count[i]>0 then inc(c);
  writeln(c);
end.
