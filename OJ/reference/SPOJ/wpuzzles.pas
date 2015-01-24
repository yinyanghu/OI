//Written on 6469 -- Jan 11, 2006
program wpuzzles;
{$Q-,R-}
const
  size=1000;
  maxw=1000;
  triesize=size*maxw;
  dx:array['A'..'H']of shortint=(-1,-1,0,1,1,1,0,-1);
  dy:array['A'..'H']of shortint=(0,1,1,1,0,-1,-1,-1);
var
  map:array[0..size-1,0..size-1]of char;
  letter:array[1..triesize]of char;
  first,next,suf,q:array[0..triesize]of longint;
  id:array[0..triesize]of word;
  place:array[1..maxw]of longint;
  wx,wy:array[1..maxw]of word;
  dir:array[1..maxw]of char;
  tests,u,n,m,w,i,j,nodes:longint;
  nowdir:char;
function child(p:longint;c:char):longint;
  var
    t:longint;
  begin
    repeat
      t:=first[p];while (t>0) and (letter[t]<>c) do t:=next[t];
      if (t>0) or (p=0) then break;
      p:=suf[p];
    until false;
    child:=t;
  end;
procedure add_word;
  var
    c:array[1..size]of char;
    l,p,t:longint;
  begin
    l:=0;repeat inc(l);read(c[l]);until eoln;readln;
    p:=0;
    repeat
      t:=first[p];while (t>0) and (letter[t]<>c[l]) do t:=next[t];
      if t=0 then begin
        inc(nodes);
        letter[nodes]:=c[l];first[nodes]:=0;next[nodes]:=first[p];id[nodes]:=0;
        first[p]:=nodes;
        p:=nodes;
      end
      else
        p:=t;
      dec(l);
    until l=0;
    id[p]:=i;place[i]:=p;
  end;
procedure build_graph;
  var
    f,r:longint;
  begin
    f:=-1;r:=0;q[0]:=0;
    repeat
      inc(f);if first[q[f]]=0 then continue;
      inc(r);q[r]:=first[q[f]];
      repeat
        if f=0 then
          suf[q[r]]:=0
        else begin
          suf[q[r]]:=child(suf[q[f]],letter[q[r]]);
          if (id[q[r]]=0) and (id[suf[q[r]]]>0) then id[q[r]]:=id[suf[q[r]]];
        end;
        if next[q[r]]=0 then break;
        inc(r);q[r]:=next[q[r-1]];
      until false;
    until f=r;
  end;
procedure scan(x,y:longint);
  var
    p,t:longint;
  begin
    p:=0;
    repeat
      p:=child(p,map[x,y]);t:=id[p];
      while t>0 do begin
        wx[t]:=x;wy[t]:=y;dir[t]:=nowdir;
        t:=id[suf[place[t]]];
      end;
      dec(x,dx[nowdir]);dec(y,dy[nowdir]);
    until (x<0) or (x>n) or (y<0) or (y>m);
  end;
begin
  read(tests);
  for u:=1 to tests do begin
    if u>1 then writeln;
    readln(n,m,w);dec(n);dec(m);
    for i:=0 to n do begin
      for j:=0 to m do read(map[i,j]);
      readln;
    end;
    nodes:=0;first[0]:=0;
    for i:=1 to w do
      add_word;
    build_graph;

    nowdir:='A';for i:=0 to m do scan(0,i);
    nowdir:='B';for i:=0 to n-1 do scan(i,m);for i:=1 to m-1 do scan(0,i);
    nowdir:='C';for i:=0 to n do scan(i,m);
    nowdir:='D';for i:=1 to n do scan(i,m);for i:=1 to m-1 do scan(n,i);
    nowdir:='E';for i:=0 to m do scan(n,i);
    nowdir:='F';for i:=1 to n do scan(i,0);for i:=1 to m-1 do scan(n,i);
    nowdir:='G';for i:=0 to n do scan(i,0);
    nowdir:='H';for i:=0 to n-1 do scan(i,0);for i:=1 to m-1 do scan(0,i);

    for i:=1 to w do
      writeln(wx[i],' ',wy[i],' ',dir[i]);
  end;
end.
