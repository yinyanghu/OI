program ural1069;
const
  maxn=7500;
var
  a:array[1..maxn]of word;
  p:array[1..maxn]of word;
  h:array[1..maxn]of longint;
  e:array[1..(maxn-1)*2]of longint;
  n,i,x,y,hsize,t:word;
procedure up(v:word);
  var
    u,t:longint;
  begin
    u:=v shr 1;
    while (v>1) and (h[v]<h[u]) do begin
      p[h[u] mod 8192]:=v;p[h[v] mod 8192]:=u;
      t:=h[u];h[u]:=h[v];h[v]:=t;
      v:=u;u:=v shr 1;
    end;
  end;
procedure ins(x:longint);
  begin
    inc(hsize);h[hsize]:=x;p[x mod 8192]:=hsize;up(hsize);
  end;
procedure del;
  var
    v,l,r,t:longint;
  begin
    h[1]:=h[hsize];dec(hsize);v:=1;
    repeat
      l:=v shl 1;r:=l+1;
      if (l<hsize) and (h[v]>h[r]) and (h[r]<h[l]) then begin
        p[h[v] mod 8192]:=r;p[h[r] mod 8192]:=v;
        t:=h[v];h[v]:=h[r];h[r]:=t;
        v:=r;
      end
      else if (l<=hsize) and (h[v]>h[l]) then begin
        p[h[v] mod 8192]:=l;p[h[l] mod 8192]:=v;
        t:=h[v];h[v]:=h[l];h[l]:=t;
        v:=l;
      end
      else
        break;
    until false;
  end;
function pop:word;
  begin
    pop:=h[1] mod 8192;
    if h[1]<8192 then del else dec(h[1],8192);
  end;
procedure qsort(s,t:word);
  var
    p,i,j:word;
    te:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    te:=e[p];e[p]:=e[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (e[j]>te) do dec(j);
      if i=j then break;e[i]:=e[j];inc(i);
      while (i<j) and (e[i]<te) do inc(i);
      if i=j then break;e[j]:=e[i];dec(j);
    until i=j;
    e[i]:=te;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  n:=1;
  repeat
    read(a[n]);
    inc(p[a[n]]);
    inc(n);
  until seekeof;

  for i:=1 to n do
    ins(p[i] shl 13+i);
  for i:=1 to n do
    p[h[i] mod 8192]:=i;

  for i:=1 to n-1 do begin
    x:=pop;
    dec(h[p[a[i]]],8192);up(p[a[i]]);
    e[i*2-1]:=a[i] shl 13+x;
    e[i*2]:=x shl 13+a[i];
  end;

  qsort(1,(n-1)*2);

  for i:=1 to (n-1)*2 do begin
    x:=e[i] shr 13;y:=e[i] mod 8192;
    if x>t then begin
      if t>0 then writeln;
      write(x,':');
      t:=x;
    end;
    write(' ',y);
  end;
  writeln;
end.
