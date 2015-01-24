program ural1105;
const
  maxn=9999;
var
  a,b:array[1..maxn+1]of real;
  c:array[1..maxn]of word;
  g:array[1..maxn]of byte;
  n,i,p,c1,c2:word;
  s,t,l,s1,s2:real;
procedure qsort(s,t:word);
  var
    p,i,j,tc:word;
    ta,tb:real;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    ta:=a[p];tb:=b[p];tc:=c[p];a[p]:=a[s];b[p]:=b[s];c[p]:=c[s];
    i:=s;j:=t;
    repeat
      while (i<j) and ((a[j]>ta) or (a[j]=ta) and (b[j]>=tb)) do dec(j);
      if i=j then break;a[i]:=a[j];b[i]:=b[j];c[i]:=c[j];inc(i);
      while (i<j) and ((a[i]<ta) or (a[i]=ta) and (b[i]<=tb)) do inc(i);
      if i=j then break;a[j]:=a[i];b[j]:=b[i];c[j]:=c[i];dec(j);
    until i=j;
    a[i]:=ta;b[i]:=tb;c[i]:=tc;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
procedure out(x:byte);
  var
    i:word;
  begin
    for i:=1 to n do
      if g[i]=x then writeln(c[i]);
  end;
begin
  read(s,t);l:=(t-s)*2/3;
  read(n);
  for i:=1 to n do begin
    read(a[i],b[i]);
    c[i]:=i;
  end;
  a[n+1]:=t;

  qsort(1,n);

  g[1]:=1;p:=1;c1:=1;c2:=0;s1:=b[1]-a[1];s2:=0;
  if b[1]<t then
    for i:=2 to n+1 do begin
      if b[p]>a[i] then continue;
      g[i-1]:=3-g[p];
      p:=i-1;
      if g[p]=1 then begin
        inc(c1);
        s1:=s1+b[p]-a[p];
      end
      else begin
        inc(c2);
        s2:=s2+b[p]-a[p];
      end;
      if b[p]=t then break;
    end;

  if s1>=l then begin
    writeln(c1);
    out(1);
  end
  else if s2>=l then begin
    writeln(c2);
    out(2);
  end
  else begin
    writeln(c1+c2);
    out(1);out(2);
  end;
end.
