program ural1062;
const
  maxn=100;
  qsize=maxn*2+9;
  inf=9e9;
  zero=1e-12;
var
  u,v,w:array[1..maxn]of real;
  x,y:array[0..qsize-1]of real;
  n,i,now,f,r,oldr,t:longint;
  a,b,c:real;
  win:boolean;
procedure cut(p,q:longint);
  var
    t1,t2,lambda:real;
  begin
    t1:=a*x[p]+b*y[p]+c;t2:=a*x[q]+b*y[q]+c;
    if (t1>zero) and (t2<-zero) or (t1<-zero) and (t2>zero) then begin
      r:=(r+1) mod qsize;
      lambda:=-t1/t2;
      x[r]:=(x[p]+lambda*x[q])/(1+lambda);
      y[r]:=(y[p]+lambda*y[q])/(1+lambda);
    end;
    if t2<zero then begin r:=(r+1) mod qsize;x[r]:=x[q];y[r]:=y[q];end;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(f);u[i]:=1/f;
    read(f);v[i]:=1/f;
    read(f);w[i]:=1/f;
  end;

  for now:=1 to n do begin
    win:=true;
    f:=0;r:=4;
    x[1]:=0;y[1]:=0;x[2]:=inf;y[2]:=0;x[3]:=inf;y[3]:=inf;x[4]:=0;y[4]:=inf;
    for i:=1 to n do begin
      if i=now then continue;
      a:=u[now]-u[i];b:=v[now]-v[i];c:=w[now]-w[i];
      if (abs(a)<zero) and (abs(b)<zero) then
        if c<-zero then continue else begin win:=false;break;end;
      oldr:=r;f:=(f+1) mod qsize;cut(r,f);
      while f<>oldr do begin t:=(f+1) mod qsize;cut(f,t);f:=t;end;
      if (r-f+qsize) mod qsize<3 then begin win:=false;break;end;
    end;
    if win then writeln('Yes') else writeln('No');
  end;
end.
