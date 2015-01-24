program ural1065;
const
  maxn=50;
  maxm=1000;
  inf=3e38;
var
  x,y:array[1..maxn+maxm]of integer;
  ok:array[1..maxn,1..maxn]of boolean;
  dp:array[1..maxn,1..maxn]of real;
  n,m,i,j,k,t,u:integer;
  ans:real;
function prev(x:integer):integer;
  begin
    if x=1 then prev:=n else prev:=x-1;
  end;
function cross(a,b,c:integer):longint;
  var
    x1,y1,x2,y2:integer;
  begin
    x1:=x[b]-x[a];y1:=y[b]-y[a];
    x2:=x[c]-x[a];y2:=y[c]-y[a];
    cross:=x1*y2-x2*y1;
  end;
begin
  read(n,m);
  for i:=1 to n+m do
    read(x[i],y[i]);

  for i:=1 to n do begin
    k:=prev(i);j:=prev(k);
    while (j<>i) and (cross(i,j,k)=0) do j:=prev(j);
    k:=n+1;
    while (j<>i) and (k<=n+m) do
      if cross(i,j,k)<0 then inc(k) else j:=prev(j);
    while j<>i do begin
      ok[i,j]:=true;
      j:=prev(j);
    end;
  end;

  for i:=1 to n-1 do
    for j:=1 to n do begin
      t:=j+i;if t>n then dec(t,n);
      if ok[j,t] then
        dp[j,t]:=sqrt(sqr(x[j]-x[t])+sqr(y[j]-y[t]))
      else begin
        dp[j,t]:=inf;
        for k:=1 to i-1 do begin
          u:=j+k;if u>n then dec(u,n);
          if dp[j,u]+dp[u,t]<dp[j,t] then dp[j,t]:=dp[j,u]+dp[u,t];
        end;
      end;
    end;

  ans:=inf;
  for i:=1 to n-2 do
    for j:=i+1 to n-1 do
      for k:=j+1 to n do
        if dp[i,j]+dp[j,k]+dp[k,i]<ans then
          ans:=dp[i,j]+dp[j,k]+dp[k,i];
  writeln(ans:0:2);
end.
