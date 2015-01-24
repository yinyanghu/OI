program ural1018;
const
  maxn=100;
var
  v1,v2:array[1..maxn]of byte;
  apple:array[1..maxn]of word;
  dp:array[1..maxn,0..maxn]of longint;
  v:array[1..maxn]of boolean;
  n,q,i:byte;
procedure dfs(x:byte);
  var
    i,j,c1,c2:byte;
    t:longint;
  begin
    v[x]:=true;c1:=0;c2:=0;
    for i:=1 to n do
      if (v1[i]=x) or (v2[i]=x) then begin
        t:=v1[i]+v2[i]-x;
        if v[t] then
          dp[x,1]:=apple[i]
        else begin
          if c1=0 then c1:=t else c2:=t;
          dfs(t);
        end;
      end;

    if c1>0 then
      for i:=1 to q do
        for j:=0 to i-1 do begin
          t:=dp[x,1]+dp[c1,j]+dp[c2,i-1-j];
          if t>dp[x,i] then dp[x,i]:=t;
        end;
  end;
begin
  read(n,q);inc(q);
  for i:=1 to n-1 do
    read(v1[i],v2[i],apple[i]);

  dfs(1);

  writeln(dp[1,q]);
end.
