program ural1245;
const
  maxn=1000;
  minsize=100;
type
  spottype=record
    r,x,y:integer;
  end;
var
  spot:array[1..maxn]of spottype;
  l,r,lt,lb,rt,rb:array[1..maxn]of integer;
  n,i,t:integer;
  ans:longint;
function min(a,b:longint):longint;
  begin
    if a<b then min:=a else min:=b;
  end;
function max(a,b:longint):longint;
  begin
    if a>b then max:=a else max:=b;
  end;
procedure qsort(s,t:integer);
  var
    p,i,j:integer;
    ts:spottype;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    ts:=spot[p];spot[p]:=spot[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (spot[j].x>ts.x) do dec(j);
      if i=j then break;spot[i]:=spot[j];inc(i);
      while (i<j) and (spot[i].x<ts.x) do inc(i);
      if i=j then break;spot[j]:=spot[i];dec(j);
    until i=j;
    spot[i]:=ts;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
procedure solve;
  var
    i:integer;
  begin
    qsort(1,n);

    r[1]:=spot[1].x+spot[1].r;
    lt[1]:=spot[1].y+spot[1].r;
    lb[1]:=spot[1].y-spot[1].r;
    for i:=2 to n do begin
      r[i]:=max(r[i-1],spot[i].x+spot[i].r);
      lt[i]:=max(lt[i-1],spot[i].y+spot[i].r);
      lb[i]:=min(lb[i-1],spot[i].y-spot[i].r);
    end;

    l[n]:=spot[n].x-spot[n].r;
    rt[n]:=spot[n].y+spot[n].r;
    rb[n]:=spot[n].y-spot[n].r;
    for i:=n-1 downto 1 do begin
      l[i]:=min(l[i+1],spot[i].x-spot[i].r);
      rt[i]:=max(rt[i+1],spot[i].y+spot[i].r);
      rb[i]:=min(rb[i+1],spot[i].y-spot[i].r);
    end;

    for i:=2 to n do begin
      if r[i-1]>l[i] then continue;
      ans:=min(ans,max(minsize,r[i-1]-l[1])*max(minsize,lt[i-1]-lb[i-1])
                  +max(minsize,r[n]-l[i])*max(minsize,rt[i]-rb[i]));
    end;
  end;
begin
  ans:=maxlongint;

  read(n);
  for i:=1 to n do
    read(spot[i].r,spot[i].x,spot[i].y);

  solve;

  for i:=1 to n do begin
    t:=spot[i].x;spot[i].x:=spot[i].y;spot[i].y:=t;
  end;

  solve;

  ans:=min(ans,max(minsize,r[n]-l[1])*max(minsize,rt[1]-rb[1]));
  writeln(ans);
end.
