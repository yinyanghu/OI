program ural1333;
const
  maxn=10;
  parts=100000;
var
  x,y,r:array[1..maxn]of extended;
  line:array[1..maxn*2]of extended;
  start:array[1..maxn*2]of boolean;
  n,i:byte;
  p:longint;
  area:extended;
procedure cover(v:extended);
  var
    l,i,j:byte;
    t:extended;
    b:boolean;
  begin
    l:=0;
    for i:=1 to n do
      if abs(y[i]-v)<=r[i] then begin
        inc(l);line[l]:=x[i]-sqrt(sqr(r[i])-sqr(y[i]-v));start[l]:=true;
        inc(l);line[l]:=x[i]+sqrt(sqr(r[i])-sqr(y[i]-v));start[l]:=false;
      end;

    for i:=1 to l-1 do
      for j:=i+1 to l do
        if line[i]>line[j] then begin
          t:=line[i];line[i]:=line[j];line[j]:=t;
          b:=start[i];start[i]:=start[j];start[j]:=b;
        end;

    for i:=1 to l do
      if line[i]<0 then line[i]:=0 else if line[i]>1 then line[i]:=1;

    j:=0;
    for i:=1 to l do begin
      if j=0 then t:=line[i];
      if start[i] then inc(j) else dec(j);
      if j=0 then area:=area+line[i]-t;
    end;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(x[i],y[i],r[i]);
    x[i]:=x[i];y[i]:=y[i];r[i]:=r[i];
  end;

  for p:=1 to parts do
    cover((p-0.5)/parts);

  writeln(area*100/parts:0:6);
end.
