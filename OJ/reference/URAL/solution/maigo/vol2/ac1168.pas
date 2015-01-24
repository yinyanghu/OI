program ural1168;
const
  maxsize=50;
  maxk=1000;
  zero=1e-6;
var
  map:array[1..maxsize,1..maxsize]of word;
  station:array[1..maxsize,1..maxsize]of boolean;
  x,y:array[1..maxk]of byte;
  r:array[1..maxk]of real;
  m,n,k,i,j,p,ans:longint;
  min,max,t,h:real;
begin
  read(m,n,k);
  for i:=1 to m do
    for j:=1 to n do
      read(map[i,j]);
  for i:=1 to k do begin
    read(x[i],y[i],t);
    r[i]:=t*t;station[x[i],y[i]]:=true;
  end;

  for i:=1 to m do
    for j:=1 to n do begin
      if station[i,j] then continue;
      min:=map[i,j];max:=9e9;
      for p:=1 to k do begin
        t:=r[p]-sqr(x[p]-i)-sqr(y[p]-j);
        if t<0 then break;
        t:=sqrt(t);
        h:=map[x[p],y[p]]-t;if h>min then min:=h;
        h:=map[x[p],y[p]]+t;if h<max then max:=h;
        if min-max>zero then break;
      end;
      if (t<0) or (min-max>zero) then continue;
      if abs(max-round(max))<zero then inc(ans,round(max)) else inc(ans,trunc(max));
      if abs(min-round(min))<zero then dec(ans,round(min)-1) else dec(ans,trunc(min));
    end;
  writeln(ans);
end.
