program ural1124;
const
  maxm=500;
var
  g:array[1..maxm,1..maxm]of boolean;
  indeg,outdeg:array[1..maxm]of byte;
  compo:array[0..maxm]of byte;
  v:array[1..maxm]of boolean;
  m,n,i,j,x,ans:word;
  exist:boolean;
procedure floodfill(x:word);
  var
    i:byte;
  begin
    inc(compo[0]);compo[compo[0]]:=x;
    v[x]:=true;
    for i:=1 to m do
      if not v[i] and g[x,i] then floodfill(i);
  end;
begin
  read(m,n);
  for i:=1 to m do
    for j:=1 to n do begin
      read(x);
      if x<>i then begin
        inc(ans);g[x,i]:=true;g[i,x]:=true;inc(outdeg[i]);inc(indeg[x]);
      end;
    end;

  for i:=1 to m do
    if not v[i] then begin
      compo[0]:=0;floodfill(i);
      if compo[0]>1 then begin
        exist:=true;
        x:=0;
        for j:=1 to compo[0] do
          if outdeg[compo[j]]>indeg[compo[j]] then
            inc(x,outdeg[compo[j]]-indeg[compo[j]]);
        if x=0 then inc(ans) else inc(ans,x);
      end;
   end;

  writeln(ans-ord(exist));
end.
