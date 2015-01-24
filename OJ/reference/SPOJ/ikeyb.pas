//Written on 6359 -- Sep 23, 2005
{$Q-,R-}
program ikeyb;
const
  max=90;
var
  key,letter:string[max];
  freq:array[1..max]of longint;
  sum,cost,cut:array[1..max,1..max]of longint;
  n,u,k,l,i,j,e,f,x,t:longint;
procedure out(k,l:longint);
  var
    i:longint;
  begin
    if k>1 then out(k-1,cut[k,l]);
    write(key[k],': ');
    for i:=cut[k,l]+1 to l do write(letter[i]);writeln;
  end;
begin
  read(n);
  for u:=1 to n do begin
    readln(k,l);readln(key);readln(letter);
    for i:=1 to l do read(freq[i]);

    for i:=1 to l do begin
      sum[i,i]:=freq[i];
      for j:=i+1 to l do
        sum[i,j]:=sum[i,j-1]+freq[j]*(j-i+1);
    end;

    for j:=1 to l do begin
      cost[1,j]:=sum[1,j];
    end;
    for i:=2 to k do
      for j:=l downto i do begin
        cost[i,j]:=maxlongint;
        e:=cut[i-1,j];if e<i-1 then e:=i-1;
        if j=l then f:=l-1 else begin f:=cut[i,j+1];if f>j-1 then f:=j-1;end;
        for x:=e to f do begin
          t:=cost[i-1,x]+sum[x+1,j];
          if t<cost[i,j] then begin cost[i,j]:=t;cut[i,j]:=x;end;
        end;
        if i=k then break;
      end;

    writeln('Keypad #',u,':');
    out(k,l);
    writeln;
  end;
end.
