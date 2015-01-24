//Written on 6449 -- Dec 22, 2005
program quest4;
{$Q-,R-}
const
  max=120;
var
  map:array[1..max,1..max]of byte;
  vx,my:array[1..max]of byte;
  t,u,n,i,x,y:longint;
function aug(x:byte):boolean;
  var
    y:byte;
  begin
    aug:=false;
    if vx[x]=i then exit;
    vx[x]:=i;
    for y:=1 to max do
      if map[x,y]=u then
        if (my[y]=0) or aug(my[y]) then begin
          my[y]:=x;aug:=true;exit;
        end;
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(n);
    for i:=1 to n do begin
      read(x,y);map[x+1,y+1]:=u;
    end;

    fillchar(vx,sizeof(vx),0);
    fillchar(my,sizeof(my),0);
    n:=0;
    for i:=1 to max do
      if aug(i) then
        inc(n);
    writeln(n);
  end;
end.
