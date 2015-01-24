program ural1138;
const
  maxn=10000;
var
  l:array[1..maxn]of integer;
  n,s,i,t:integer;
  p:longint;
begin
  fillchar(l,sizeof(l),0);
  readln(n,s);

  l[s]:=1;
  for i:=s to n-1 do begin
    p:=101;
    while i*p/100<=n do begin
      if i*p mod 100=0 then begin
        t:=i*p div 100;
        if (l[i]>0) and (l[i]+1>l[t]) then
          l[t]:=l[i]+1;
      end;
      inc(p);
    end;
  end;

  t:=0;
  for i:=s to n do
    if l[i]>t then t:=l[i];
  writeln(t);
end.
