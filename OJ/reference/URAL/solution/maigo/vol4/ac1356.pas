//I didn't think that much --
//  I just assumed that any non-largest prime in the result shouldn't exceed
//  the largest prime in the stored prime list.
//Someone else says the range can be all the more reduced.
//  But to what degree... that's a question worth researching.
program ural1356;
const
  maxn=1000000000;
var
  p:array[1..3401]of word;
  s:array[2..3]of longint;
  primes,t,u,n,i,d:longint;
  found:boolean;
function prime(x:longint):boolean;
  var
    i:word;
  begin
    prime:=true;
    for i:=1 to primes do begin
      if sqr(p[i])>x then exit;
      if x mod p[i]=0 then begin prime:=false;exit;end;
    end;
  end;
procedure search(l,x,y:longint);
  var
    i:word;
  begin
    if l>1 then
      for i:=y to primes do begin
        if p[i]*l>x then exit;
        s[l]:=i;
        search(l-1,x-p[i],i);
        if found then exit;
      end
    else if prime(x) then begin
      for i:=d downto 2 do
        write(p[s[i]],' ');
      writeln(x);
      found:=true;
    end;
  end;
begin
  for i:=2 to trunc(sqrt(maxn)) do
    if prime(i) then begin
      inc(primes);p[primes]:=i;
    end;
  read(t);
  for u:=1 to t do begin
    read(n);d:=0;found:=false;
    repeat
      inc(d);search(d,n,1);
    until found;
  end;
end.
