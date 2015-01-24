//Written on 6443 -- Dec 16, 2005
program bac;
{$Q-,R-}
const
  maxn=100;
  qsize=maxn+9;
  zero=1e-6;
var
  sx,sy:array[1..maxn]of word;
  x,y:array[0..qsize-1]of real;
  order:array[1..maxn]of byte;
  area:array[1..maxn]of real;
  w,h,n,i,j,f,r,oldr,t:longint;
  first:boolean;
procedure cut(a,b:byte);
  var
    x0,y0,p1,p2:real;
  begin
    x0:=(sx[i]+sx[j])/2;y0:=(sy[i]+sy[j])/2;
    p1:=(x[a]-x0)*(sx[i]-x0)+(y[a]-y0)*(sy[i]-y0);
    p2:=(x[b]-x0)*(sx[j]-x0)+(y[b]-y0)*(sy[j]-y0);
    if p1*p2>zero then begin
      r:=(r+1) mod qsize;
      x[r]:=(x[a]*p2+x[b]*p1)/(p1+p2);
      y[r]:=(y[a]*p2+y[b]*p1)/(p1+p2);
    end;
    if p2<zero then begin
      r:=(r+1) mod qsize;x[r]:=x[b];y[r]:=y[b];
    end;
  end;
procedure add_area(a,b:byte);
  begin
    area[i]:=area[i]+(x[a]-sx[i])*(y[b]-sy[i])-(x[b]-sx[i])*(y[a]-sy[i]);
  end;
procedure qsort(s,t:byte);
  var
    p,i,j,tmp:byte;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=order[p];order[p]:=order[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (area[order[j]]<=area[tmp]) do dec(j);
      if i=j then break;order[i]:=order[j];inc(i);
      while (i<j) and (area[order[i]]>=area[tmp]) do inc(i);
      if i=j then break;order[j]:=order[i];dec(j);
    until i=j;
    order[i]:=tmp;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  first:=true;
  repeat
    read(w,h);if w*h=0 then halt;
    read(n);
    for i:=1 to n do read(sx[i],sy[i]);
    fillchar(area,sizeof(area),0);

    for i:=1 to n do begin
      f:=0;r:=4;
      x[1]:=0;y[1]:=0;x[2]:=w;y[2]:=0;x[3]:=w;y[3]:=h;x[4]:=0;y[4]:=h;
      for j:=1 to n do begin
        if j=i then continue;
        oldr:=r;f:=(f+1) mod qsize;cut(r,f);
        while f<>oldr do begin t:=(f+1) mod qsize;cut(f,t);f:=t;end;
      end;
      f:=(f+1) mod qsize;add_area(r,f);
      while f<>r do begin t:=(f+1) mod qsize;add_area(f,t);f:=t;end;
    end;

    for i:=1 to n do order[i]:=i;
    qsort(1,n);
    if first then first:=false else writeln;
    for i:=1 to n do
      writeln(order[i] div 100,order[i] div 10 mod 10,order[i] mod 10,area[order[i]]/2:14:2);
  until false;
end.
