program ural1103;
const
  maxn=4999;
  zero=1e-9;
var
  x,y:array[1..maxn]of extended;
  c:array[3..maxn]of extended;
  n,i,target:word;
  t,a2,b2,c2:extended;
function cross(a,b:word):extended;
  var
    x1,y1,x2,y2:extended;
  begin
    x1:=x[a]-x[1];y1:=y[a]-y[1];
    x2:=x[b]-x[1];y2:=y[b]-y[1];
    cross:=x1*y2-x2*y1;
  end;
procedure qsort(s,t:word);
  var
    p,i,j:word;
    tc,tx,ty:extended;
  begin
    if (s>=t) or (s>target) or (t<target) then exit;
    p:=s+random(t-s+1);
    tc:=c[p];tx:=x[p];ty:=y[p];
    c[p]:=c[s];x[p]:=x[s];y[p]:=y[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (c[j]>tc) do dec(j);
      if i=j then break;c[i]:=c[j];x[i]:=x[j];y[i]:=y[j];inc(i);
      while (i<j) and (c[i]<tc) do inc(i);
      if i=j then break;c[j]:=c[i];x[j]:=x[i];y[j]:=y[i];dec(j);
    until i=j;
    c[i]:=tc;x[i]:=tx;y[i]:=ty;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  read(n);target:=(n+3) shr 1;
  for i:=1 to n do begin
    read(x[i],y[i]);
    if (y[i]<y[1]) or (y[i]=y[1]) and (x[i]<x[1]) then begin
      t:=x[1];x[1]:=x[i];x[i]:=t;
      t:=y[1];y[1]:=y[i];y[i]:=t;
    end;
  end;

  for i:=3 to n do
    if cross(2,i)<-zero then begin
      t:=x[2];x[2]:=x[i];x[i]:=t;
      t:=y[2];y[2]:=y[i];y[i]:=t;
    end;

  c2:=sqr(x[1]-x[2])+sqr(y[1]-y[2]);
  for i:=3 to n do begin
    a2:=sqr(x[1]-x[i])+sqr(y[1]-y[i]);
    b2:=sqr(x[2]-x[i])+sqr(y[2]-y[i]);
    c[i]:=(a2+b2-c2)/(2*sqrt(a2)*sqrt(b2));
  end;

  qsort(3,n);

  writeln(x[1]:0:0,' ',y[1]:0:0);
  writeln(x[2]:0:0,' ',y[2]:0:0);
  writeln(x[target]:0:0,' ',y[target]:0:0);
end.
