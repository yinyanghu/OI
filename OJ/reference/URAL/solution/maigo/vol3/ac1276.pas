program ural1276;
const
  maxn=40;
var
  dp:array[boolean,-1..maxn,-1..maxn,-1..maxn,'A'..'B']of int64;
  loco,s:string[2];
  n,m,aa,ab,ba,bb,i,j,k,l:byte;
  ans:int64;
begin
  readln(n,m);
  readln(loco);
  for i:=1 to n do begin
    readln(s);
    if s='AA' then inc(aa) else if s='AB' then inc(ab) else if s='BA' then inc(ba) else inc(bb);
  end;

  dp[false,0,0,0,loco[2]]:=1;
  for i:=0 to aa do
    for j:=0 to ab do
      for k:=0 to ba do
        for l:=0 to bb do begin
          if i+j+k+l=0 then continue;
          dp[odd(i),j,k,l,'A']:=dp[not odd(i),j,k,l,'A']+dp[odd(i),j,k-1,l,'B'];
          dp[odd(i),j,k,l,'B']:=dp[odd(i),j-1,k,l,'A']+dp[odd(i),j,k,l-1,'B'];
          if i+j+k+l=m then
            inc(ans,dp[odd(i),j,k,l,loco[1]]);
        end;

  if ans=0 then
    writeln('NO')
  else begin
    writeln('YES');
    writeln(ans);
  end;
end.
