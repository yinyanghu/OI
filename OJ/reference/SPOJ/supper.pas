//Written on 6196 -- Apr 13, 2005
program supper;
const
  tests=10;
  maxn=100000;
var
  a,b,l:array[1..maxn+1]of longint;
  u,n,i,maxl,s,t,m:longint;
begin
  for u:=1 to tests do begin
    read(n);for i:=1 to n do read(a[i]);

    l[1]:=1;maxl:=1;b[1]:=a[1];b[2]:=maxlongint;
    for i:=2 to n do begin
      s:=1;t:=maxl+1;
      repeat
        m:=(s+t) shr 1;
        if a[i]<b[m] then t:=m else s:=m+1;
      until s=t;
      l[i]:=s;b[s]:=a[i];
      if s>maxl then begin inc(maxl);b[maxl+1]:=maxlongint;end;
    end;

    inc(l[n]);maxl:=1;b[1]:=a[n];b[2]:=0;
    for i:=n-1 downto 1 do begin
      s:=1;t:=maxl+1;
      repeat
        m:=(s+t) shr 1;
        if a[i]>b[m] then t:=m else s:=m+1;
      until s=t;
      inc(l[i],s);b[s]:=a[i];
      if s>maxl then begin inc(maxl);b[maxl+1]:=0;end;
    end;

    for i:=1 to n do b[a[i]]:=i;
    s:=0;m:=0;
    for i:=1 to n do
      if l[b[i]]>m then begin
        m:=l[b[i]];s:=1;b[s]:=a[b[i]];
      end
      else if l[b[i]]=m then begin
        inc(s);b[s]:=a[b[i]];
      end;

    writeln(s);
    for i:=1 to s-1 do write(b[i],' ');
    writeln(b[s]);
  end;
end.
