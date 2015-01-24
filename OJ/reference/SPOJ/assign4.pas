//Written on 6491 -- Feb 2, 2006
program assign4;
{$Q-,R-}
const
  maxm=200;
  maxn=200;
var
  cx,lx:array[1..maxm]of integer;
  cy,ly,slack,sy:array[1..maxn]of integer;
  px:array[1..maxm]of byte;
  py:array[1..maxn]of byte;
  cost,flow:array[1..maxm,1..maxn]of word;
  q:array[1..maxm]of byte;
  t,u,m,n,h,i,j,k,f,r,d,last,ans:longint;
procedure find;
  begin
    repeat
      inc(f);
      if q[f]>0 then begin
        h:=q[f];
        for j:=1 to n do
          if py[j]=0 then begin
            d:=cost[h,j]-lx[h]-ly[j];
            if d=0 then begin
              py[j]:=h;
              if cy[j]>0 then begin last:=j;exit;end;
              for i:=1 to m do
                if (px[i]=0) and (flow[i,j]>0) then begin
                  px[i]:=j;inc(r);q[r]:=i;
                end;
            end
            else
              if d<slack[j] then begin slack[j]:=d;sy[j]:=h;end;
          end;
      end;
    until f=r;
  end;
procedure modify;
  begin
    d:=maxint;for j:=1 to n do if (py[j]=0) and (slack[j]<d) then d:=slack[j];
    for i:=1 to m do if px[i]>0 then inc(lx[i],d);
    for j:=1 to n do if py[j]>0 then dec(ly[j],d) else dec(slack[j],d);
    for j:=1 to n do
      if slack[j]=0 then begin
        py[j]:=sy[j];
        if cy[j]>0 then begin last:=j;exit;end;
        for i:=1 to m do
          if (px[i]=0) and (flow[i,j]>0) then begin
            px[i]:=j;inc(r);q[r]:=i;
          end;
      end;
  end;
procedure aug;
  begin
    j:=last;i:=py[j];d:=cy[j];
    while i<>k do begin
      j:=px[i];if flow[i,j]<d then d:=flow[i,j];
      i:=py[j];
    end;
    if cx[i]<d then d:=cx[i];

    j:=last;i:=py[j];
    dec(cx[k],d);dec(cy[j],d);inc(flow[i,j],d);
    while i<>k do begin
      j:=px[i];dec(flow[i,j],d);
      i:=py[j];inc(flow[i,j],d);
    end;
  end;
begin
  readln(t);
  for u:=1 to t do begin
    read(m,n);
    for i:=1 to m do read(cx[i]);
    for i:=1 to n do read(cy[i]);
    for i:=1 to m do begin
      lx[i]:=maxint;
      for j:=1 to n do begin
        read(cost[i,j]);
        if cost[i,j]<lx[i] then lx[i]:=cost[i,j];
      end;
    end;
    fillchar(ly,sizeof(ly),0);

    fillchar(flow,sizeof(flow),0);
    for k:=1 to m do
      while cx[k]>0 do begin
        for j:=1 to n do slack[j]:=maxint;
        fillchar(px,sizeof(px),0);
        fillchar(py,sizeof(py),0);
        f:=0;r:=1;q[1]:=k;px[k]:=k;
        last:=0;
        repeat
          find;
          if last=0 then modify;
        until last>0;
        aug;
      end;

    ans:=0;
    for i:=1 to m do
      for j:=1 to n do
        inc(ans,cost[i,j]*flow[i,j]);
    writeln(ans);
  end;
end.
