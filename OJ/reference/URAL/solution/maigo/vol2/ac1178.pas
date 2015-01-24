program ural1178;
const
  maxn=10000;
type
  point=record
    num:word;
    x:longint;
  end;
var
  p:array[1..maxn]of point;
  n,i:word;
  y:longint;{This is even useless}
procedure qsort(s,t:integer);
  var
    c,i,j:integer;
    tp:point;
  begin
    if s>=t then exit;
    c:=s+random(t-s+1);
    tp:=p[c];p[c]:=p[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (p[j].x>=tp.x) do dec(j);
      if i=j then break;
      p[i]:=p[j];inc(i);
      while (i<j) and (p[i].x<=tp.x) do inc(i);
      if i=j then break;
      p[j]:=p[i];dec(j);
    until i=j;
    p[i]:=tp;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  readln(n);
  for i:=1 to n do begin
    p[i].num:=i;
    readln(p[i].x,y);
  end;

  qsort(1,n);

  for i:=1 to n do begin
    write(p[i].num);
    if odd(i) then write(' ') else writeln;
  end;
end.
