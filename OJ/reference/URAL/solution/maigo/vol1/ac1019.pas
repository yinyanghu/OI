program ural1019;
const
  maxn=5000;
  treesize=6144;
  root=4096;
  maxd=root shr 1;
type
  event=record
    x:longint;
    level:word;
    delta:shortint;
  end;
  node=record
    exist:boolean;
    sum:word;
  end;
var
  color:array[1..maxn+1]of char;
  e:array[1..maxn*2+1]of event;
  tree:array[1..treesize]of node;
  n,i,max:word;
  s,t,a,l:longint;
  c:char;
procedure ins(u:word);
  var
    p,d:word;
  begin
    p:=root;d:=maxd;
    while p<>u do begin
      inc(tree[p].sum);
      if p<u then inc(p,d) else dec(p,d);
      d:=d shr 1;
    end;
    inc(tree[p].sum);tree[p].exist:=true;
    if u>max then max:=u;
  end;
procedure del(u:word);
  var
    p,d:word;
  begin
    p:=root;d:=maxd;
    while p<>u do begin
      dec(tree[p].sum);
      if p<u then inc(p,d) else dec(p,d);
      d:=d shr 1;
    end;
    dec(tree[p].sum);tree[p].exist:=false;

    if (u<max) or (u=1) then exit;
    p:=root;d:=maxd;
    while not tree[p].exist or (not odd(p) and (tree[p+d].sum>0)) do begin
      if tree[p+d].sum>0 then inc(p,d) else dec(p,d);
      d:=d shr 1;
    end;
    max:=p;
  end;
procedure qsort(s,t:word);
  var
    p,i,j:word;
    te:event;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    te:=e[p];e[p]:=e[s];
    i:=s;j:=t;
    repeat
      while (i<j) and ((e[j].x>te.x) or (e[j].x=te.x) and (e[j].delta<=te.delta)) do dec(j);
      if i=j then break;e[i]:=e[j];inc(i);
      while (i<j) and ((e[i].x<te.x) or (e[i].x=te.x) and (e[i].delta>=te.delta)) do inc(i);
      if i=j then break;e[j]:=e[i];dec(j);
    until i=j;
    e[i]:=te;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  read(n);
  with e[1] do begin x:=1000000000;level:=1;delta:=-1;end;color[1]:='w';
  for i:=1 to n do begin
    read(e[i*2].x,e[i*2+1].x,c{junk here},color[i+1]);
    e[i*2].level:=i+1;e[i*2+1].level:=i+1;
    e[i*2].delta:=1;e[i*2+1].delta:=-1;
  end;

  qsort(1,n*2+1);

  fillchar(tree,sizeof(tree),0);
  max:=1;ins(1);
  l:=0;s:=0;
  for i:=1 to n*2+1 do begin
    c:=color[max];
    if c='w' then begin
      t:=e[i].x;
      if t-s>l then begin
        a:=s;l:=t-s;
      end;
    end
    else
      s:=e[i].x;

    if e[i].delta=1 then
      ins(e[i].level)
    else
      del(e[i].level)
  end;

  writeln(a,' ',a+l);
end.
