program ural1193;
const
  maxn=100;
var
  t1,t2,t3:array[1..maxn]of integer;
  n,i,j:byte;
  t,ans:integer;
function max(a,b:integer):integer;
  begin
    if a>b then max:=a else max:=b;
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(t1[i],t2[i],t3[i]);

  for i:=1 to n-1 do
    for j:=i+1 to n do
      if t1[i]>t1[j] then begin
        t:=t1[i];t1[i]:=t1[j];t1[j]:=t;
        t:=t2[i];t2[i]:=t2[j];t2[j]:=t;
        t:=t3[i];t3[i]:=t3[j];t3[j]:=t;
      end;

  t:=0;ans:=0;
  for i:=1 to n do begin
    t:=max(t,t1[i])+t2[i];
    ans:=max(ans,t-t3[i]);
  end;
  writeln(ans);
end.
