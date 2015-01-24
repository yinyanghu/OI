//Written on 6448 -- Dec 21, 2005
program lsort;
{$Q-,R-}
const
  maxn=1000;
var
  p1,p2:array[1..maxn]of word;
  cost:array[boolean,1..maxn]of cardinal;
  t,u,n,i,j,p,x:longint;
  b1,b2:boolean;
begin
  read(t);
  for u:=1 to t do begin
    read(n);
    for i:=1 to n do begin
      read(j);p1[j]:=i;
    end;

    for i:=n downto 1 do begin
      b1:=odd(i);b2:=not b1;
      fillchar(cost[b2],sizeof(cost[b2]),255);
      cost[b1,i]:=p1[i];
      p2[i]:=p1[i];
      for j:=i+1 to n do
        if p1[i]<p1[j] then dec(p2[j]);
      //p2[j+1] means the position of j+1 in the sequence with i..j removed
      if i>1 then p:=p1[i-1];
      for j:=i to n do begin
        if i>1 then begin
          if p2[j]<p then dec(p);
          //p means the position of i-1 in the sequence with i..j removed
          x:=cost[b1,j]+p*(j-i+2);
          if x<cost[b2,j] then cost[b2,j]:=x;
        end;
        if j<n then begin
          x:=cost[b1,j]+p2[j+1]*(j-i+2);
          if x<cost[b1,j+1] then cost[b1,j+1]:=x;
        end;
      end;
    end;
    writeln(cost[b1,n]);
  end;
end.
