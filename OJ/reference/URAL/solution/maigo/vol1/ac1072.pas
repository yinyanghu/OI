program ural1072;
const
  maxn=90;
  maxk=5;
var
  count:array[1..maxn]of byte;
  code:array[1..maxn,1..maxk]of cardinal;
  adj:array[1..maxn,1..maxn]of boolean;
  q,pre:array[1..maxn]of byte;
  v:array[1..maxn]of boolean;
  n,k,i,j,p,f,r:byte;
  s:string;
function value(s:string):cardinal;
  var
    i,p,x:byte;
    a:cardinal;
  begin
    s:=s+'.';a:=0;p:=0;
    for i:=1 to 4 do begin
      x:=0;
      repeat
        inc(p);
        if s[p]='.' then a:=a shl 8+x else x:=x*10+ord(s[p])-48;
      until s[p]='.';
    end;
    value:=a;
  end;
begin
  read(n);
  for i:=1 to n do begin
    readln(count[i]);
    for j:=1 to count[i] do begin
      readln(s);
      p:=pos(' ',s);
      code[i,j]:=value(copy(s,1,p-1)) and value(copy(s,p+1,length(s)-p));
    end;
  end;

  for i:=1 to n-1 do
    for j:=i+1 to n do
      for k:=1 to count[i] do begin
        for p:=1 to count[j] do
          if code[i,k]=code[j,p] then begin
            adj[i,j]:=true;adj[j,i]:=true;
            break;
          end;
        if adj[i,j] then break;
      end;

  read(j,k);
  q[1]:=k;v[k]:=true;f:=0;r:=1;
  repeat
    inc(f);
    for i:=1 to n do
      if not v[i] and adj[q[f],i] then begin
        inc(r);q[r]:=i;pre[i]:=q[f];v[i]:=true;
      end;
  until v[j] or (f=r);

  if not v[j] then
    writeln('No')
  else begin
    writeln('Yes');
    while j<>k do begin
      write(j,' ');
      j:=pre[j];
    end;
    writeln(j);
  end;
end.
