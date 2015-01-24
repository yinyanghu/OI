program ural1041;
const
  maxm=2000;
  maxn=50;
  zero=1e-6;
type
  intvec=array[1..maxn]of integer;
  realvec=array[1..maxn]of real;
var
  vec:array[1..maxm]of intvec;
  price,order:array[1..maxm]of word;
  buy:array[1..maxm]of boolean;
  uni:array[1..maxm]of realvec;
  now:realvec;
  m,n,i,j,k,count,cost:longint;
  r:real;
procedure qsort(s,t:word);
  var
    p,i,j,tmp:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=order[p];order[p]:=order[s];
    i:=s;j:=t;
    repeat
      while (i<j) and ((price[order[j]]>price[tmp]) or (price[order[j]]=price[tmp]) and (order[j]>tmp)) do dec(j);
      if i=j then break;order[i]:=order[j];
      while (i<j) and ((price[order[i]]<price[tmp]) or (price[order[i]]=price[tmp]) and (order[i]<tmp)) do inc(i);
      if i=j then break;order[j]:=order[i];
    until i=j;
    order[i]:=tmp;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  read(m,n);
  for i:=1 to m do for j:=1 to n do read(vec[i,j]);
  for i:=1 to m do begin read(price[i]);order[i]:=i;end;
  qsort(1,m);

  for i:=1 to m do begin
    for j:=1 to n do now[j]:=vec[order[i],j];
    for j:=1 to count do begin
      r:=0;
      for k:=1 to n do r:=r+vec[order[i],k]*uni[j,k];
      for k:=1 to n do now[k]:=now[k]-uni[j,k]*r;
    end;
    r:=0;
    for j:=1 to n do r:=r+sqr(now[j]);r:=sqrt(r);
    if r>zero then begin
      buy[order[i]]:=true;inc(cost,price[order[i]]);
      inc(count);for j:=1 to n do uni[count,j]:=now[j]/r;
    end;
  end;

  if count=n then begin
    writeln(cost);
    for i:=1 to m do if buy[i] then writeln(i);
  end
  else
    writeln(0);
end.
