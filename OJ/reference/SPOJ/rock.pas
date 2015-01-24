//Written on 6153 -- Mar 1, 2005
program rock;
const
  maxn=200;
var
  c0,c1:array[0..maxn]of byte;
  best:array[0..maxn]of byte;
  t,u,n,i,j,x:longint;
  c:char;
begin
  read(t);
  for u:=1 to t do begin
    readln(n);
    for i:=1 to n do begin
      read(c);
      case c of
        '0':begin c0[i]:=c0[i-1]+1;c1[i]:=c1[i-1];end;
        '1':begin c0[i]:=c0[i-1];c1[i]:=c1[i-1]+1;end;
      end;
      best[i]:=0;
      for j:=0 to i-1 do begin
        if c1[i]-c1[j]>c0[i]-c0[j] then x:=best[j]+i-j else x:=best[j];
        if x>best[i] then best[i]:=x;
      end;
    end;
    writeln(best[n]);
  end;
end.
