program ural1046;
const
  maxn=50;
var
  xm,ym,angle,a1,b1,c1,a2,b2,c2:array[1..maxn+1]of real;
  n,i:longint;
  si,co,u1,v1,w1,u2,v2,w2,x,y:real;
procedure out(x:real);
  var
    t:longint;
  begin
    t:=round(x*100);
    if t mod 100=0 then write(t div 100)
      else if t mod 10=0 then write(x:0:1)
      else write(x:0:2);
  end;
begin
  read(n);
  for i:=1 to n do read(xm[i],ym[i]);
  for i:=1 to n do begin read(angle[i]);angle[i]:=angle[i]*pi/180;end;

  a1[1]:=1;b2[1]:=1;
  for i:=1 to n do begin
    si:=sin(angle[i]);co:=cos(angle[i]);
    a1[i+1]:=a1[i]*co-a2[i]*si;
    b1[i+1]:=b1[i]*co-b2[i]*si;
    c1[i+1]:=(c1[i]-xm[i])*co-(c2[i]-ym[i])*si+xm[i];
    a2[i+1]:=a1[i]*si+a2[i]*co;
    b2[i+1]:=b1[i]*si+b2[i]*co;
    c2[i+1]:=(c1[i]-xm[i])*si+(c2[i]-ym[i])*co+ym[i];
  end;

  u1:=a1[n+1]-1;v1:=b1[n+1];w1:=-c1[n+1];
  u2:=a2[n+1];v2:=b2[n+1]-1;w2:=-c2[n+1];
  x:=(w1*v2-w2*v1)/(u1*v2-u2*v1);
  y:=(w1*u2-w2*u1)/(v1*u2-v2*u1);
  for i:=1 to n do begin
    out(a1[i]*x+b1[i]*y+c1[i]);write(' ');
    out(a2[i]*x+b2[i]*y+c2[i]);writeln;
  end;
end.
