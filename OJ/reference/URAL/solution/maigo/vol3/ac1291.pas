program ural1291;
const
  maxn=1000;
var
  cogs:array[1..maxn]of word;
  adj:array[1..maxn,1..maxn]of boolean;
  v:array[1..maxn]of boolean;
  numer,denom:array[1..maxn]of longint;
  n,i,x:word;
function gcd(a,b:longint):longint;
  var
    t:longint;
  begin
    if a<b then begin t:=a;a:=b;b:=t;end;
    while b>0 do begin
      t:=a mod b;a:=b;b:=t;
    end;
    gcd:=a;
  end;
procedure cal(x,y:word);
  var
    g:longint;
  begin
    numer[y]:=-numer[x]*cogs[x];
    denom[y]:=denom[x]*cogs[y];
    g:=gcd(abs(numer[y]),denom[y]);
    numer[y]:=numer[y] div g;
    denom[y]:=denom[y] div g;
  end;
procedure search(x:word);
  var
    i:word;
  begin
    for i:=1 to n do
      if adj[x,i] and not v[i] then begin
        cal(x,i);
        v[i]:=true;
        search(i);
      end;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(cogs[i]);
    repeat
      read(x);
      if x>0 then adj[i,x]:=true;
    until x=0;
  end;
  for i:=1 to n do
    denom[i]:=1;
  read(x,numer[x]);v[x]:=true;

  search(x);

  for i:=1 to n do
    writeln(numer[i],'/',denom[i]);
end.
