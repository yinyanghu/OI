program ural1146;
const
  maxn=100;
var
  x,y:array[1..maxn,1..maxn]of longint;
  s:array[1..maxn]of longint;
  n,i,j,k:byte;
  m:longint;
function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;
begin
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      read(x[i,j]);

  fillchar(y,sizeof(y),0);
  m:=-maxlongint;
  for k:=1 to n do begin
    for i:=1 to n+1-k do
      for j:=1 to n do
        inc(y[i+k-1,j],x[i,j]);

    for i:=k to n do begin
      s[1]:=y[i,1];
      if s[1]>m then m:=s[1];
      for j:=2 to n do begin
        s[j]:=max(s[j-1],0)+y[i,j];
        if s[j]>m then m:=s[j];
      end;
    end;
  end;

  writeln(m);
end.
