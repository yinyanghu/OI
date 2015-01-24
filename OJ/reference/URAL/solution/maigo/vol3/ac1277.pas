program ural1277;
const
  maxn=100;
  inf=65535;
var
  cap,flow:array[1..maxn*2,1..maxn*2]of word;
  lab:array[1..maxn*2]of integer;
  aug:array[1..maxn*2]of boolean;
  n,s,t:byte;
  k,m,i,j,x,y,d,maxflow:word;
  more:boolean;
function min(a,b:word):word;
  begin
    if a<b then min:=a else min:=b;
  end;
begin
  read(k,n,m,s,t);
  if s=t then begin
    writeln('NO');
    halt;
  end;
  inc(s,n);
  for i:=1 to n do begin
    read(x);
    cap[i,n+i]:=x;
  end;
  for i:=1 to m do begin
    read(x,y);
    cap[n+x,y]:=inf;
    cap[n+y,x]:=inf;
  end;

  repeat
    fillchar(lab,sizeof(lab),0);
    fillchar(aug,sizeof(aug),0);
    aug[s]:=true;
    repeat
      more:=false;
      for i:=1 to n*2 do
        if aug[i] then begin
          aug[i]:=false;
          for j:=1 to n*2 do
            if (lab[j]=0) and (flow[i,j]<cap[i,j]) then begin
              lab[j]:=i;aug[j]:=true;more:=true;
            end
            else if (lab[j]=0) and (flow[j,i]>0) then begin
              lab[j]:=-i;aug[j]:=true;more:=true;
            end;
         end;
    until (lab[t]<>0) or not more;
    if lab[t]<>0 then begin
      d:=maxint;j:=t;
      repeat
        i:=abs(lab[j]);
        if lab[j]>0 then
          d:=min(d,cap[i,j]-flow[i,j])
        else
          d:=min(d,flow[j,-i]);
        j:=i;
      until i=s;
      inc(maxflow,d);j:=t;
      repeat
        i:=abs(lab[j]);
        if lab[j]>0 then
          inc(flow[i,j],d)
        else
          dec(flow[j,-i]);
        j:=i;
      until i=s;
    end;
  until lab[t]=0;
  if maxflow>k then writeln('NO') else writeln('YES');
end.
