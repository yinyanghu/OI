program ural1034;
const
  maxn=50;
var
  p:array[1..maxn]of byte;
  n,i,j,k,t:shortint;
  ans:longint;
procedure check(a,b,c:byte);
  var
    i:byte;
  begin
    for i:=1 to n do begin
      if (i<>a) and (abs(i-a)=abs(p[i]-p[a])) then exit;
      if (i<>b) and (abs(i-b)=abs(p[i]-p[b])) then exit;
      if (i<>c) and (abs(i-c)=abs(p[i]-p[c])) then exit;
    end;
    inc(ans);
  end;
begin
  read(n);
  for i:=1 to n do
    read(j,p[j]);

  for i:=1 to n-2 do
    for j:=i+1 to n-1 do
      for k:=j+1 to n do begin
        t:=p[i];p[i]:=p[j];p[j]:=p[k];p[k]:=t;
        check(i,j,k);
        t:=p[i];p[i]:=p[j];p[j]:=p[k];p[k]:=t;
        check(i,j,k);
        t:=p[i];p[i]:=p[j];p[j]:=p[k];p[k]:=t;
      end;

  writeln(ans);
end.
