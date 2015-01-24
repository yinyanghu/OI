program ural1045;
const
  maxn=1000;
var
  e:array[1..maxn,0..20]of integer;
  v:array[1..maxn]of boolean;
  n,k,i,x,y:integer;
function win(x:integer):boolean;
  var
    i:byte;
  begin
    v[x]:=true;
    for i:=1 to e[x,0] do
      if not v[e[x,i]] then
        if not win(e[x,i]) then begin
          win:=true;
          exit;
        end;
    win:=false;
  end;
begin
  fillchar(e,sizeof(e),0);
  fillchar(v,sizeof(v),0);
  readln(n,k);
  for i:=1 to n-1 do begin
    readln(x,y);
    inc(e[x,0]);e[x,e[x,0]]:=y;
    inc(e[y,0]);e[y,e[y,0]]:=x;
  end;
  for x:=1 to e[k,0]-1 do
    for y:=x+1 to e[k,0] do
      if e[k,x]>e[k,y] then begin
        i:=e[k,x];e[k,x]:=e[k,y];e[k,y]:=i;
      end;

  v[k]:=true;
  for i:=1 to e[k,0] do
    if not v[e[k,i]] then
      if not win(e[k,i]) then begin
        writeln('First player wins flying to airport ',e[k,i]);
        halt;
      end;
  writeln('First player loses');
end.
