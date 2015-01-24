//Written on 6196 -- Apr 13, 2005
program empty;
const
  maxn=5000;
  size=1000000;
type
  list=array[0..maxn+1]of longint;
var
  x,y,z,dot,lx,ly,h:list;
  t,u,n,i,j,p,ansx,ansy,ansz:longint;
  v,ans:int64;
procedure qsortdot(s,t:word);
  var
    p,i,j,tmp,tx,ty:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=dot[p];tx:=x[tmp];ty:=y[tmp];dot[p]:=dot[s];
    i:=s;j:=t;
    repeat
      while (i<j) and ((x[dot[j]]>tx) or (x[dot[j]]=tx) and (y[dot[j]]>ty)) do dec(j);
      if i=j then break;dot[i]:=dot[j];inc(i);
      while (i<j) and ((x[dot[i]]<tx) or (x[dot[i]]=tx) and (y[dot[i]]<ty)) do inc(i);
      if i=j then break;dot[j]:=dot[i];dec(j);
    until i=j;
    dot[i]:=tmp;
    qsortdot(s,i-1);
    qsortdot(i+1,t);
  end;
procedure qsortl(var l:list;s,t:word);
  var
    p,i,j,tmp:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=l[p];l[p]:=l[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (l[j]>tmp) do dec(j);
      if i=j then break;l[i]:=l[j];inc(i);
      while (i<j) and (l[i]<tmp) do inc(i);
      if i=j then break;l[j]:=l[i];dec(j);
    until i=j;
    l[i]:=tmp;
    qsortl(l,s,i-1);
    qsortl(l,i+1,t);
  end;
procedure makel(var l:list);
  var
    i:longint;
  begin
    qsortl(l,1,n);
    l[0]:=1;
    for i:=2 to n do
      if l[i]>l[i-1] then begin inc(l[0]);l[l[0]]:=l[i];end;
    inc(l[0]);l[l[0]]:=size;
  end;
begin
  h[0]:=size;
  read(t);
  for u:=1 to t do begin
    read(n);
    for i:=1 to n do begin
      read(x[i],y[i],z[i]);
      lx[i]:=x[i];ly[i]:=y[i];
    end;
    for i:=1 to n do dot[i]:=i;qsortdot(1,n);
    makel(lx);makel(ly);

    if lx[1]>ly[1] then begin
      ans:=int64(lx[1])*size*size;ansx:=lx[1];ansy:=size;
    end
    else begin
      ans:=int64(ly[1])*size*size;ansx:=size;ansy:=ly[1];
    end;
    ansz:=size;p:=1;
    for i:=1 to ly[0] do h[i]:=size;
    for i:=1 to lx[0]-1 do
      for j:=1 to ly[0]-1 do begin
        if h[j-1]<h[j] then h[j]:=h[j-1];
        while (p<=n) and (x[dot[p]]=lx[i]) and (y[dot[p]]=ly[j]) do begin
          if z[dot[p]]<h[j] then h[j]:=z[dot[p]];inc(p);
        end;
        v:=int64(h[j])*lx[i+1]*ly[j+1];
        if v>ans then begin
          ans:=v;ansx:=lx[i+1];ansy:=ly[j+1];ansz:=h[j];
        end;
      end;
    writeln(ansx,' ',ansy,' ',ansz);
  end;
end.
