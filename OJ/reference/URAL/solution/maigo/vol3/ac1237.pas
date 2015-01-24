program ural1237;
const
  max=100;
var
  bx,by,bn,bf,sx,sy,sn,sf:array[1..max]of integer;
  cost,flow:array[1..max,1..max]of integer;
  bp,sp:array[1..max]of byte;
  bd,sd:array[0..max]of cardinal;
  n,m,i,j,l:byte;
  t:integer;
  origin,now:longint;
  more:boolean;
function min(a,b:integer):integer;
  begin
    if a<b then min:=a else min:=b;
  end;
begin
  read(n,m);
  for i:=1 to n do
    read(bx[i],by[i],bn[i]);
  for i:=1 to m do
    read(sx[i],sy[i],sn[i]);
  for i:=1 to n do
    for j:=1 to m do begin
      cost[i,j]:=abs(bx[i]-sx[j])+abs(by[i]-sy[j]);
      read(t);
      inc(origin,cost[i,j]*t);
    end;

  sd[0]:=maxlongint;
  repeat
    for i:=1 to n do
      if bf[i]=bn[i] then bd[i]:=maxlongint else bd[i]:=0;
    for i:=1 to m do
      sd[i]:=maxlongint;
    fillchar(bp,sizeof(bp),0);
    repeat
      more:=false;
      for i:=1 to n do
        for j:=1 to m do begin
          if ((bp[i]>0) or (bf[i]<bn[i])) and (flow[i,j]<min(bn[i],sn[j])) and (bd[i]+cost[i,j]<sd[j]) then begin
            sd[j]:=bd[i]+cost[i,j];sp[j]:=i;more:=true;
          end;
          if (flow[i,j]>0) and (sd[j]-cost[i,j]<bd[i]) then begin
            bd[i]:=sd[j]-cost[i,j];bp[i]:=j;more:=true;
          end;
        end;
    until not more;
    l:=0;
    for i:=1 to m do
      if sf[i]<sn[i] then
        if sd[i]<sd[l] then l:=i;
    if l=0 then break;
    t:=sn[l]-sf[l];j:=l;
    repeat
      i:=sp[j];t:=min(t,min(bn[i],sn[j])-flow[i,j]);
      if bp[i]=0 then break;
      j:=bp[i];t:=min(t,flow[i,j]);
    until false;
    t:=min(t,bn[i]-bf[i]);
    inc(sf[l],t);
    repeat
      i:=sp[l];inc(flow[i,l],t);
      if bp[i]=0 then break;
      l:=bp[i];dec(flow[i,l],t);
    until false;
    inc(bf[i],t);
  until false;

  for i:=1 to n do
    for j:=1 to m do
      inc(now,cost[i,j]*flow[i,j]);
  if now=origin then
    writeln('OPTIMAL')
  else begin
    writeln('SUBOPTIMAL');
    for i:=1 to n do begin
      for j:=1 to m-1 do
        write(flow[i,j],' ');
      writeln(flow[i,m]);
    end;
  end;
end.
