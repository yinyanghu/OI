//Written on 6120 -- Jan 27, 2005
program cistfill;
const
  maxn=50000;
  zero=1e-6;
var
  b,h,s:array[1..maxn]of longint;
  k,u,n,v,i,total:longint;
  l,r,m,t,sum:extended;
begin
  read(k);
  for u:=1 to k do begin
    read(n);total:=0;
    for i:=1 to n do begin
      read(b[i],h[i],s[i],v);
      s[i]:=s[i]*v;
      inc(total,h[i]*s[i]);
    end;
    read(v);
    if v>total then begin
      writeln('OVERFLOW');
      continue;
    end;

    l:=0;r:=1040000;
    repeat
      m:=(l+r)/2;
      sum:=0;
      for i:=1 to n do begin
        if m<b[i] then continue;
        t:=m-b[i];
        if t>h[i] then sum:=sum+h[i]*s[i] else sum:=sum+(m-b[i])*s[i];
      end;
      if sum>=v then r:=m else l:=m;
    until r-l<1e-4;
    writeln(m:0:2);
  end;
end.
