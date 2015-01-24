program ural1207;
const
  maxn=10000;
type
  dot=record
    x,y:longint;
    num:word;
  end;
var
  d:array[1..maxn]of dot;
  n,i,target:word;
  td:dot;
function cross(a,b:dot):int64;
  var
    x1,y1,x2,y2:int64;
  begin
    x1:=a.x-d[1].x;y1:=a.y-d[1].y;
    x2:=b.x-d[1].x;y2:=b.y-d[1].y;
    cross:=x1*y2-x2*y1;
  end;
procedure qsort(s,t:word);
  var
    p,i,j:word;
  begin
    if (s>=t) or (s>target) or (t<target) then exit;
    p:=s+random(t-s+1);
    td:=d[p];d[p]:=d[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (cross(d[j],td)<0) do dec(j);
      if i=j then break;d[i]:=d[j];inc(i);
      while (i<j) and (cross(d[i],td)>0) do inc(i);
      if i=j then break;d[j]:=d[i];dec(j);
    until i=j;
    d[i]:=td;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  read(n);target:=n shr 1+1;
  for i:=1 to n do begin
    read(d[i].x,d[i].y);d[i].num:=i;
    if d[i].y<d[1].y then begin
      td:=d[1];d[1]:=d[i];d[i]:=td;
    end;
  end;

  qsort(2,n);

  writeln(d[1].num,' ',d[target].num);
end.
