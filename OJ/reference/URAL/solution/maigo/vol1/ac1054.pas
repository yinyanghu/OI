program ural1054;
const
  maxn=31;
var
  p:array[1..maxn]of longint;
  d:array[1..maxn]of byte;
  n,i,source,target,temp:byte;
  ans:longint;
procedure exchange(var a,b:byte);
  var
    t:byte;
  begin
    t:=a;a:=b;b:=t;
  end;
begin
  readln(n);
  p[1]:=1;read(d[1]);
  for i:=2 to n do begin
    p[i]:=p[i-1]*2;
    read(d[i]);
  end;

  source:=1;target:=2;temp:=3;
  ans:=0;
  for i:=n downto 1 do
    if d[i]=temp then begin
      ans:=-1;
      break;
    end
    else if d[i]=target then begin
      inc(ans,p[i]);
      exchange(source,temp);
    end
    else
      exchange(target,temp);

  writeln(ans);
end.
