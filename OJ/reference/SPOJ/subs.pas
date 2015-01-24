//Written on 6455 -- Dec 28, 2005
program subs;
{$Q-,R-}
const
  maxl=500010;
var
  x,y:array[1..maxl]of char;
  t,u,lx,ly,l,r,m,i,p,c:longint;
begin
  readln(t);
  for u:=1 to t do begin
    lx:=0;repeat inc(lx);read(x[lx]);until eoln;readln;
    ly:=0;repeat inc(ly);read(y[ly]);until eoln;readln;
    l:=0;r:=ly div lx;
    while l<r do begin
      m:=(l+r+1) shr 1;
      p:=1;c:=1;
      for i:=1 to ly do
        if y[i]=x[p] then
          if c<m then
            inc(c)
          else begin
            inc(p);
            if p>lx then break;
            c:=1;
          end;
      if p>lx then l:=m else r:=m-1;
    end;
    writeln(l);
  end;
end.
