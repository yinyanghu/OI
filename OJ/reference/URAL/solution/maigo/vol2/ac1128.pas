program ural1128;
const
  maxn=7163;
var
  e:array[1..maxn,1..3]of word;
  t:array[0..maxn]of byte;
  s:array[1..maxn]of word;
  v:array[1..maxn]of boolean;
  n,i,j,c,k:word;
  first:boolean;
procedure bfs(x:word);
  var
    f,r,i:word;
  begin
    f:=0;r:=1;s[1]:=x;t[x]:=1;
    repeat
      inc(f);
      for i:=1 to 3 do begin
        if e[s[f],i]=0 then break;
        if t[e[s[f],i]]=0 then begin
          inc(r);s[r]:=e[s[f],i];t[e[s[f],i]]:=3-t[s[f]];
        end;
      end;
    until f=r;
  end;
function bad(x:word):boolean;
  var
    i,u:byte;
  begin
    u:=0;
    for i:=1 to 3 do begin
      if e[x,i]=0 then break;
      if t[e[x,i]]=t[x] then inc(u);
    end;
    bad:=u>1;
  end;
procedure push(x:word);
  begin
    if v[x] then exit;
    inc(c);s[c]:=x;v[x]:=true;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(c);
    for j:=1 to c do
      read(e[i,j]);
  end;

  for i:=1 to n do
    if t[i]=0 then bfs(i);

  c:=0;
  for i:=1 to n do
    if bad(i) then push(i);

  while c>0 do begin
    k:=s[c];v[k]:=false;dec(c);
    if bad(k) then begin
      t[k]:=3-t[k];
      for i:=1 to 3 do
        if bad(e[k,i]) then push(e[k,i]);
    end;
  end;

  for i:=1 to n do
    if t[i]=1 then inc(c);
  if (c<n-c) or (c=n-c) and (t[1]=1) then
    k:=1
  else begin
    k:=2;
    c:=n-c;
  end;
  writeln(c);
  if c=0 then halt;
  first:=true;
  for i:=1 to n do
    if t[i]=k then begin
      if first then first:=false else write(' ');
      write(i);
    end;
  writeln;
end.
