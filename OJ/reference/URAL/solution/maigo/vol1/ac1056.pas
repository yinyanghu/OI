program ural1056;
const
  maxn=10000;
var
  pr,u,d1,d2,c1,cen:array[1..maxn]of word;
  n,i,min,count,t:word;
procedure submit(d,c,x:word);
  begin
    if d>d1[x] then begin
      d2[x]:=d1[x];d1[x]:=d;c1[x]:=c;
    end
    else if d>d2[x] then begin
      d2[x]:=d;c2[x]:=c;
    end;
  end;
function max(a,b:word):word;
  begin
    if a>b then max:=a else max:=b;
  end;
begin
  read(n);
  for i:=2 to n do
    read(pr[i]);

  for i:=n downto 2 do
    submit(d1[i]+1,i,pr[i]);

  for i:=2 to n do begin
    if i=c1[pr[i]] then u[i]:=d2[pr[i]]+1 else u[i]:=d1[pr[i]]+1;
    if u[pr[i]]+1>u[i] then u[i]:=u[pr[i]]+1;
  end;

  min:=maxint;
  for i:=1 to n do begin
    t:=max(u[i],d1[i]);
    if t<min then begin min:=t;count:=0;end;
    if t=min then begin inc(count);cen[count]:=i;end;
  end;

  for i:=1 to count-1 do
    write(cen[i],' ');
  writeln(cen[count]);
end.
