//Written on 6448 -- Dec 21, 2005
program vocv;
const
  maxn=100010;
  modulo=10007;
var
  v2,pre:array[1..maxn*2-2]of longint;
  last,yes,cyes,no,cno:array[1..maxn]of longint;
  v:array[1..maxn]of byte;
  t,u,n,e,i,x,y:longint;
procedure cal(x:longint);
  var
    y:longint;
  begin
    v[x]:=u;
    yes[x]:=1;cyes[x]:=1;
    no[x]:=0;cno[x]:=1;
    while last[x]>0 do begin
      y:=v2[last[x]];
      if v[y]<u then begin
        cal(y);
        if no[y]<yes[y] then begin inc(yes[x],no[y]);cyes[x]:=cyes[x]*cno[y] mod modulo;end
          else if yes[y]<no[y] then begin inc(yes[x],yes[y]);cyes[x]:=cyes[x]*cyes[y] mod modulo;end
          else begin inc(yes[x],no[y]);cyes[x]:=cyes[x]*(cyes[y]+cno[y]) mod modulo;end;
        inc(no[x],yes[y]);cno[x]:=cno[x]*cyes[y] mod modulo;
      end;
      last[x]:=pre[last[x]];
    end;
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(n);e:=0;
    for i:=1 to n-1 do begin
      read(x,y);
      inc(e);v2[e]:=y;pre[e]:=last[x];last[x]:=e;
      inc(e);v2[e]:=x;pre[e]:=last[y];last[y]:=e;
    end;
    cal(1);
    if no[1]<yes[1] then writeln(no[1],' ',cno[1])
    else if yes[1]<no[1] then writeln(yes[1],' ',cyes[1])
      else writeln(no[1],' ',(cyes[1]+cno[1]) mod modulo);
  end;
end.
