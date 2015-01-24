program ural1080;
const
  maxn=98;
var
  c:array[1..maxn]of shortint;
  adj:array[1..maxn,1..maxn]of boolean;
  n,i,x:byte;
procedure fail;
  begin
    writeln(-1);
    halt;
  end;
procedure color(v:byte;x:shortint);
  var
    i:byte;
  begin
    if c[v]>-1 then
      if c[v]=x then exit else fail;
    c[v]:=x;
    for i:=1 to n do
      if adj[v,i] then begin
        adj[v,i]:=false;adj[i,v]:=false;
        color(i,1-x);
      end;
  end;
begin
  fillchar(c,sizeof(c),255);
  fillchar(adj,sizeof(adj),0);
  readln(n);
  for i:=1 to n do
    repeat
      read(x);
      if x=0 then break;
      adj[i,x]:=true;adj[x,i]:=true;
    until false;

  for i:=1 to n do
    if c[i]=-1 then color(i,0);

  for i:=1 to n do
    write(c[i]);
  writeln;
end.
