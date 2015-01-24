program ural1301;
const
  maxn=10;
  left:array[1..6{top},1..6{front}]of byte=((0,3,5,2,4,0),(4,0,1,6,0,3),
       (2,6,0,0,1,5),(5,1,0,0,6,2),(3,0,6,1,0,4),(0,4,2,5,3,0));
var
  u,d,l,r:array[1..maxn,1..maxn]of boolean;
  q:array[1..24*sqr(maxn)]of record
      top,front,x,y:byte;
    end;
  lv:array[1..6,1..6,1..maxn,1..maxn]of byte;
  w,h,x1,y1,x2,y2,m,n,p:byte;
  s:string;
  f,e:word;
  succeed:boolean;
procedure add(m,n,a,b,p:byte);
  begin
    if lv[m,n,a,b]<=p then exit;
    inc(e);
    with q[e] do begin
      top:=m;front:=n;x:=a;y:=b;
    end;
    lv[m,n,a,b]:=p;
    if (m=1) and (a=x2) and (b=y2) then succeed:=true;
  end;
begin
  readln(w,h,x1,y1,x2,y2);
  for m:=1 to w do
    for n:=1 to h do begin
      u[m,n]:=n<h;d[m,n]:=n>1;l[m,n]:=m>1;r[m,n]:=m<w;
    end;

  if not seekeof then begin
    readln;
    repeat
      readln(s);
      if s='h' then break;
      p:=pos(' ',s);
      val(copy(s,1,p-1),m,f);val(copy(s,p+1,length(s)-p),n,f);
      r[m,n]:=false;l[m+1,n]:=false;
    until seekeof;
    if s='h' then
      while not seekeof do begin
        read(m,n);
        u[m,n]:=false;d[m,n+1]:=false;
      end;
  end;

  fillchar(lv,sizeof(lv),255);
  with q[1] do begin top:=1;front:=2;x:=x1;y:=y1;end;
  lv[1,2,x1,y1]:=0;
  f:=0;e:=1;
  while (f<e) and not succeed do begin
    inc(f);
    m:=q[f].top;n:=q[f].front;x1:=q[f].x;y1:=q[f].y;p:=lv[m,n,x1,y1]+1;
    if u[x1,y1] then add(n,7-m,x1,y1+1,p);
    if d[x1,y1] then add(7-n,m,x1,y1-1,p);
    if l[x1,y1] then add(7-left[m,n],n,x1-1,y1,p);
    if r[x1,y1] then add(left[m,n],n,x1+1,y1,p);
  end;
  if succeed then writeln(lv[q[e].top,q[e].front,q[e].x,q[e].y]) else writeln('No solution');
end.
