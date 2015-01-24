program ural1361;
{$Q-,R-}
const
  maxn=100000;
var
  next:array[1..2,1..maxn]of longint;
  start,back,count,period:array[1..2]of longint;
  v:array[1..maxn]of longint;
  n,i,x,y,base,gcd,s,t:longint;
  inf,lcm,ans:int64;
function ext_gcd(a,b:longint;var s,t:longint):longint;
  var
    r:longint;
  begin
    if b=0 then begin
      ext_gcd:=a;
      s:=1;t:=0;
    end
    else begin
      ext_gcd:=ext_gcd(b,a mod b,r,s);
      t:=r-a div b*s;
    end;
  end;
procedure check(a,b:longint);
  var
    p:int64;
  begin
    if (a-b) mod gcd<>0 then exit;
    p:=(int64(period[2])*t*(a-b) div gcd+b-base) mod lcm;
    if p<0 then inc(p,lcm);
    inc(p,base);
    if p<ans then ans:=p;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(next[1,i]);
    next[2,i]:=next[1,i];
    repeat
      read(x);if x=0 then break;
      next[2,i]:=x;
    until false;
  end;

  for i:=1 to 2 do begin
    fillchar(v,sizeof(v),255);
    read(start[i]);x:=start[i];count[i]:=0;v[x]:=0;
    repeat
      x:=next[i,x];
      if v[x]>=0 then break;
      inc(count[i]);
      v[x]:=count[i];
    until false;
    back[i]:=x;
    period[i]:=count[i]+1-v[x];
    dec(count[i],period[i]);
  end;

  x:=start[1];y:=start[2];
  for i:=0 to count[1] do begin
    if x=y then begin writeln(i);halt;end;
    x:=next[1,x];y:=next[2,y];
  end;
  gcd:=ext_gcd(period[1],period[2],s,t);lcm:=int64(period[1] div gcd)*period[2];
  if count[1]>count[2] then base:=count[1]+1 else base:=count[2]+1;
  inf:=maxlongint;inf:=sqr(inf);ans:=inf;
  for i:=count[1]+1 to count[1]+period[1] do begin
    y:=v[x];
    if y>=0 then
      if y>count[2] then check(i,y) else if (i=y) and (i<ans) then ans:=i;
    x:=next[1,x];
  end;
  if ans<inf then writeln(ans) else writeln(-1);
end.
