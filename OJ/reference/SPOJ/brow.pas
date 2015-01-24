//Written on 6450 -- Dec 23, 2005
program brow;
{$Q-,R-}
const
  maxn=10000;
var
  z:array[0..maxn-1]of word;
  d:array[0..maxn]of longint;
  t,u,n,i,opp,x,l,r:longint;
  now,best:int64;
begin
  read(t);
  for u:=1 to t do begin
    read(n);now:=0;
    for i:=0 to n-1 do begin
      read(z[i],x);
      d[i+1]:=d[i]+x;
    end;

    now:=0;opp:=1;r:=0;
    while d[opp]*2<d[n] do begin
      inc(now,z[opp]*d[opp]);
      inc(r,z[opp]);
      inc(opp);
    end;
    l:=z[0];
    for i:=opp to n-1 do begin
      inc(now,z[i]*(d[n]-d[i]));
      inc(l,z[i]);
    end;
    if opp=n then opp:=0;
    best:=now;

    for i:=1 to n-1 do begin
      inc(now,int64(l-r)*(d[i]-d[i-1]));
      inc(l,z[i]);dec(r,z[i]);
      repeat
        x:=d[i]-d[opp];if x<=0 then inc(x,d[n]);
        if x*2<d[n] then break;
        dec(now,z[opp]*(x+x-d[n]));
        dec(l,z[opp]);inc(r,z[opp]);
        opp:=(opp+1) mod n;
      until l=z[i];
      if now<best then best:=now;
    end;
    writeln(best);
  end;
end.
