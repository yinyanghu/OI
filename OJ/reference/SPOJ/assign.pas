//Written on 6432 -- Dec 5, 2005
program assignments;
{$Q-,R-}
const
  maxn=20;
var
  e:array[1..maxn]of longint;
  like:array[1..maxn,0..maxn]of byte;
  count:array[0..1 shl maxn-1]of int64;
  t,u,n,i,j,x,ones:longint;
procedure search(l:longint);
  var
    i:byte;
  begin
    if l=0 then begin
      for i:=1 to like[ones,0] do
        if (x and e[like[ones,i]]>0) then
          inc(count[x],count[x-e[like[ones,i]]]);
      inc(x);
    end
    else begin
      search(l-1);
      inc(ones);
      search(l-1);
      dec(ones);
    end;
  end;
begin
  e[1]:=1;for i:=2 to maxn do e[i]:=e[i-1]*2;
  read(t);
  for u:=1 to t do begin
    read(n);
    for i:=1 to n do begin
      like[i,0]:=0;
      for j:=1 to n do begin
        read(x);
        if x=1 then begin
          inc(like[i,0]);like[i,like[i,0]]:=j;
        end;
      end;
    end;
    fillchar(count,sizeof(count),0);count[0]:=1;x:=0;
    search(n);
    writeln(count[1 shl n-1]);
  end;
end.
