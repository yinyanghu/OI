program ural1343;
const
  maxprimes=78498;
var
  p:array[1..maxprimes]of longint;
  n,primes,i,j,t:longint;
  x:int64;
  ok:boolean;
  s:string[12];
begin
  read(n);
  if n=0 then begin writeln('000000000002');halt;end;
  read(x);for i:=n to 11 do x:=x*10;
  if x<2 then begin writeln('000000000002');halt;end;
  primes:=0;
  for i:=2 to trunc(sqrt(x)) do begin
    ok:=true;t:=trunc(sqrt(i));
    for j:=1 to primes do
      if p[j]>t then break else
        if i mod p[j]=0 then begin ok:=false;break;end;
    if ok then begin inc(primes);p[primes]:=i;end;
  end;

  repeat
    ok:=true;
    for i:=1 to primes do
      if x mod p[i]=0 then begin ok:=false;break;end;
    if ok then begin
      str(x,s);
      for i:=length(s) to 11 do write(0);
      writeln(x);halt;
    end;
    inc(x);
  until false;
end.
