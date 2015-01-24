program ural1099;
{$Q-,R-}
const
  maxn=444;
var
  adj:array[1..maxn,1..maxn]of boolean;
  match,stack,loop,pre0,pre1,belong:array[0..maxn]of word;
  v:array[1..maxn]of byte;
  n,nn,i,j,src,top,ans:longint;
procedure aug(x:word);
  var
    y,i,t:word;
  begin
    repeat
      y:=pre0[x];
      while y>n do
        for i:=1 to y-1 do
          if (belong[i]=y) and adj[i,x] then begin
            y:=i;break;
          end;
      match[x]:=y;match[y]:=x;
      if y=src then break;
      x:=pre1[y];
      while x>n do begin
        t:=pre0[x];
        for i:=1 to x-1 do
          if (belong[i]=x) and (v[i]=3) then begin
            x:=i;break;
          end;
        if adj[x,t] then
          pre0[x]:=t
        else begin
          i:=x;
          while not adj[i,t] and (pre0[i]<>x) do
            i:=pre1[pre0[i]];
          if adj[i,t] then
            pre0[i]:=t
          else begin
            pre0[x]:=i;
            i:=x;while not adj[i,t] do i:=pre1[pre0[i]];
            pre0[i]:=t;
          end;
        end;
      end;
    until false;
    inc(ans);
  end;
procedure absorb(x:word);
  var
    i:word;
  begin
    for i:=1 to nn-1 do
      if adj[x,i] then begin
        adj[nn,i]:=true;adj[i,nn]:=true;
      end;
    belong[x]:=nn;v[x]:=2;
  end;
procedure contract(tar:word);
  var
    a,b,c:word;
  begin
    inc(nn);
    for a:=1 to nn-1 do begin adj[nn,a]:=false;adj[a,nn]:=false;end;
    pre0[nn]:=pre0[tar];pre1[nn]:=pre1[tar];
    pre0[stack[top]]:=tar;absorb(tar);
    while stack[top]<>tar do begin
      c:=stack[top];b:=pre1[c];a:=pre0[b];
      pre1[b]:=c;pre0[a]:=b;
      absorb(b);absorb(c);
      dec(top);
    end;
    v[stack[top]]:=3;stack[top]:=nn;v[nn]:=1;
  end;
procedure find;
  var
    now,i:longint;
  begin
    fillchar(pre0,sizeof(pre0),0);
    fillchar(pre1,sizeof(pre1),0);
    fillchar(v,sizeof(v),0);
    fillchar(belong,sizeof(belong),0);
    top:=1;stack[1]:=src;loop[top]:=n+1;nn:=n;
    repeat
      now:=stack[top];i:=loop[top];v[now]:=1;
      while i>1 do begin
        dec(i);loop[top]:=i;
        if (v[i]<2) and adj[now,i] and (pre0[i]=0) then
          if v[i]=1 then begin
            contract(i);now:=stack[top];i:=nn+1;
          end
          else if match[i]=0 then begin
            pre0[i]:=now;aug(i);exit;
          end
          else begin
            pre0[i]:=now;pre1[match[i]]:=i;
            inc(top);stack[top]:=match[i];now:=stack[top];
            v[i]:=1;v[now]:=1;i:=nn+1;
          end;
      end;
      v[stack[top]]:=2;v[match[stack[top]]]:=2;dec(top);
    until top=0;
  end;
begin
  read(n);
  while not seekeof do begin
    read(i,j);adj[i,j]:=true;adj[j,i]:=true;
  end;

  for src:=1 to n do
    if match[src]=0 then
      find;

  writeln(ans*2);
  for i:=1 to n do
    if match[i]>i then writeln(i,' ',match[i]);
end.
