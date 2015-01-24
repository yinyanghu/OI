program ural1265;
type
  bignum=array[-2..100]of integer;
    {b[-2]:1 for positive, 0 for zero, -1 for negative
     b[-1]:length}
var
  xa,ya,xb,yb,xm,ym,xn,yn,t:int64;
  m1,m2:boolean;
procedure rn(var x:int64);
  var
    r:real;
  begin
    read(r);
    x:=round(r*1000000);
  end;
procedure fail;
  begin
    writeln('INVISIBLE');
    halt;
  end;
function big(x:int64):bignum;
  var
    b:bignum;
  begin
    if x=0 then
      b[-2]:=0
    else begin
      if x>0 then b[-2]:=1 else begin b[-2]:=-1;x:=-x;end;
      b[-1]:=-1;
      while x>0 do begin
        inc(b[-1]);
        b[b[-1]]:=x mod 10;
        x:=x div 10;
      end;
    end;
    big:=b;
  end;
procedure mul(var a,b:bignum);
  var
    p:bignum;
    i,j:shortint;
  begin
    fillchar(p,sizeof(p),0);
    p[-2]:=a[-2]*b[-2];
    if p[-2]<>0 then begin
      p[-1]:=a[-1]+b[-1];
      for i:=0 to a[-1] do
        for j:=0 to b[-1] do
          inc(p[i+j],a[i]*b[j]);
      for i:=0 to p[-1]-1 do begin
        inc(p[i+1],p[i] div 10);
        p[i]:=p[i] mod 10;
      end;
      while p[p[-1]]>9 do begin
        p[p[-1]+1]:=p[p[-1]] div 10;
        p[p[-1]]:=p[p[-1]] mod 10;
        inc(p[-1]);
      end;
    end;
    a:=p;
  end;
function smaller(a,b:bignum):boolean;
  var
    t:bignum;
    i:shortint;
  begin
    if a[-2]<>b[-2] then
      smaller:=a[-2]<b[-2]
    else if a[-2]=0 then
      smaller:=false
    else begin
      if a[-2]<0 then begin
        t:=a;a:=b;b:=t;
      end;
      if a[-1]<>b[-1] then
        smaller:=a[-1]<b[-1]
      else begin
        for i:=a[-1] downto 0 do
          if a[i]<>b[i] then begin
            smaller:=a[i]<b[i];
            exit;
          end;
        smaller:=false;
      end;
    end;
  end;
procedure test;
  var
    a,b,u,v:bignum;
  begin
    u:=big((xa-xm)*(xn-xm)+(ya-ym)*(yn-ym));
    v:=big((xb-xm)*(xn-xm)+(yb-ym)*(yn-ym));
    if u[-2]+v[-2]<>0 then
      if u[-2]+v[-2]>0 then exit else fail
    else if u[-2]=0 then
      exit
    else begin
      a:=big(sqr(xb-xm)+sqr(yb-ym));
      mul(a,u);mul(a,u);
      b:=big(sqr(xa-xm)+sqr(ya-ym));
      mul(b,v);mul(b,v);
      if u[-2]>0 then
        if smaller(a,b) then fail else exit
      else
        if smaller(b,a) then fail;
    end;
  end;
begin
  rn(xa);rn(ya);rn(xb);rn(yb);rn(xm);rn(ym);rn(xn);rn(yn);
  m1:=(xn-xm)*(ya-ym)>(yn-ym)*(xa-xm);
  m2:=(xn-xm)*(yb-ym)>(yn-ym)*(xb-xm);
  if m1<>m2 then fail;
  test;
  t:=xm;xm:=xn;xn:=t;t:=ym;ym:=yn;yn:=t;
  test;
  writeln('VISIBLE');
end.
