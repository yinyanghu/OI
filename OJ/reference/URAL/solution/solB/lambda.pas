var
  sum,l,r:array[0..1001,0..1001] of longint;
  temp:array[1..1000] of boolean;
  a,b,c,n,m,max,t,left,right:longint;
begin
  readln(n,m);
  for a:=0 to n do sum[a][0]:=0;
  for a:=0 to m do sum[0][a]:=0;
  for a:=1 to n do begin
    for b:=1 to m do begin
      read(c);
      sum[a][b]:=c-sum[a-1][b-1]+sum[a][b-1]+sum[a-1][b];
      temp[b]:=(c=0);
    end;
    l[a][0]:=1;
    r[a][m+1]:=m;
    for b:=1 to m do
      if temp[b] then l[a][b]:=b+1 else l[a][b]:=l[a][b-1];
    for b:=m downto 1 do
      if temp[b] then r[a][b]:=b-1 else r[a][b]:=r[a][b+1];
  end;
  max:=0;
  for a:=1 to m do begin
    t:=1;
    left:=1;
    right:=m;
    for b:=1 to n do begin
      if l[b][a]>r[b][a] then begin
        t:=b+1;
        left:=1;
        right:=m;
      end else begin
        if left<l[b][a] then left:=l[b][a];
        if right>r[b][a] then right:=r[b][a];
      end;
      c:=sum[b][right]+sum[t-1][left-1]-sum[t-1][right]-sum[b][left-1];
      if max<c then max:=c;
    end;
  end;
  writeln(max);
end.
