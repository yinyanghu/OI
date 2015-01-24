//Written on 6435 -- Dec 8, 2005
program babtwr;
const
  maxm=90;
var
  x,y,h,best:array[1..maxm]of longint;
  n,m,i,j,a,b,c:longint;
procedure qsort(s,t:longint);
  var
    p,i,j,tx,ty,th:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tx:=x[p];x[p]:=x[s];ty:=y[p];y[p]:=y[s];th:=h[p];h[p]:=h[s];
    i:=s;j:=t;
    repeat
      while (i<j) and ((x[j]>tx) or (x[j]=tx) and (y[j]>=ty)) do dec(j);
      if i=j then break;x[i]:=x[j];y[i]:=y[j];h[i]:=h[j];inc(i);
      while (i<j) and ((x[i]<tx) or (x[i]=tx) and (y[i]<=ty)) do inc(i);
      if i=j then break;x[j]:=x[i];y[j]:=y[i];h[j]:=h[i];dec(j);
    until i=j;
    x[i]:=tx;y[i]:=ty;h[i]:=th;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  repeat
    read(n);if n=0 then halt;
    m:=0;
    for i:=1 to n do begin
      read(a,b,c);
      inc(m);if a<b then begin x[m]:=a;y[m]:=b;end else begin x[m]:=b;y[m]:=a;end;h[m]:=c;
      inc(m);if a<c then begin x[m]:=a;y[m]:=c;end else begin x[m]:=c;y[m]:=a;end;h[m]:=b;
      inc(m);if b<c then begin x[m]:=b;y[m]:=c;end else begin x[m]:=c;y[m]:=b;end;h[m]:=a;
    end;
    qsort(1,m);

    fillchar(best,sizeof(best),0);a:=0;
    for i:=m downto 1 do begin
      for j:=i+1 to m do
        if (x[i]<x[j]) and (y[i]<y[j]) and (best[j]>best[i]) then best[i]:=best[j];
      inc(best[i],h[i]);
      if best[i]>a then a:=best[i];
    end;
    writeln(a);
  until false;
end.
