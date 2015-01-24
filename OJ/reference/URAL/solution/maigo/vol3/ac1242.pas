program ural1242;
const
  maxn=1000;
var
  ch,pr:array[1..maxn*2]of word;
  human,up,down:array[1..maxn]of boolean;
  n,m,i:word;
  s1,s2:string;
  first:boolean;
procedure goup(x:word);
  var
    i:word;
  begin
    if up[x] then exit;
    up[x]:=true;
    for i:=1 to m do
      if ch[i]=x then begin
        human[pr[i]]:=true;
        goup(pr[i]);
      end;
  end;
procedure godown(x:word);
  var
    i:word;
  begin
    if down[x] then exit;
    down[x]:=true;
    for i:=1 to m do
      if pr[i]=x then begin
        human[ch[i]]:=true;
        godown(ch[i]);
      end;
  end;
begin
  readln(n);
  repeat
    readln(s2);
    while s2[length(s2)]=' ' do delete(s2,length(s2),1);
    if s2='BLOOD' then break;
    i:=pos(' ',s2);
    s1:=copy(s2,1,i-1);
    delete(s2,1,i);
    inc(m);
    val(s1,ch[m],i);val(s2,pr[m],i);
  until false;

  repeat
    read(i);
    human[i]:=true;
    goup(i);
    godown(i);
  until seekeof;

  first:=true;
  for i:=1 to n do
    if not human[i] then begin
      if first then first:=false else write(' ');
      write(i);
    end;
  if first then writeln(0) else writeln;
end.
