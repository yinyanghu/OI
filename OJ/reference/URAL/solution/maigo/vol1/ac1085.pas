program ural1085;
const
  max=100;
  price=4;
  inf=65535;
var
  cost:array[1..max,1..max]of word;
  money:array[1..max]of word;
  stop:array[1..max]of byte;
  mt:array[1..max]of boolean;
  n,m,l,k,ans,i,j:byte;
  min,total:longint;
  ok:boolean;
begin
  {Make graph}
  fillchar(cost,sizeof(cost),255);
  readln(n,m);
  for i:=1 to m do begin
    read(l);
    for j:=1 to l do
      read(stop[j]);
    for j:=1 to l-1 do
      for k:=j+1 to l do begin
        cost[stop[j],stop[k]]:=price;
        cost[stop[k],stop[j]]:=price;
      end;
  end;
  for i:=1 to n do
    cost[i,i]:=0;

  {Floyd}
  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        if (cost[i,k]<inf) and (cost[k,j]<inf) then
          if cost[i,k]+cost[k,j]<cost[i,j] then
            cost[i,j]:=cost[i,k]+cost[k,j];

  {Friends info}
  readln(k);
  for i:=1 to k do begin
    readln(money[i],stop[i],j);
    mt[i]:=j=1;
  end;

  {Main}
  ans:=0;min:=maxlongint;
  for i:=1 to n do begin
    total:=0;ok:=true;
    for j:=1 to k do
      if (cost[stop[j],i]=inf) or not mt[j] and (cost[stop[j],i]>money[j]) then begin
        ok:=false;
        break;
      end
      else if not mt[j] then
        inc(total,cost[stop[j],i]);
    if ok then
      if total<min then begin
        ans:=i;
        min:=total;
      end;
  end;

  {Output}
  if ans=0 then
    writeln(0)
  else
    writeln(ans,' ',min);
end.
