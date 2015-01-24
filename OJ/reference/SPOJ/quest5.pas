//Written on 6455 -- Dec 28, 2005
program quest5;
const
  maxn=10010;
var
  x:array[1..maxn*2]of longint;
  event:array[1..maxn*2]of integer;
  flag:array[1..maxn]of word;
  t,u,n,i,c:longint;
procedure qsort(s,t:word);
  var
    p,i,j,tx,te:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tx:=x[p];te:=event[p];x[p]:=x[s];event[p]:=event[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (x[j]>=tx) do dec(j);
      if i=j then break;x[i]:=x[j];event[i]:=event[j];inc(i);
      while (i<j) and (x[i]<=tx) do inc(i);
      if i=j then break;x[j]:=x[i];event[j]:=event[i];dec(j);
    until i=j;
    x[i]:=tx;event[i]:=te;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(n);
    for i:=1 to n do begin
      read(c);x[i*2-1]:=c*2-1;event[i*2-1]:=i;
      read(c);x[i*2]:=c*2;event[i*2]:=-i;
    end;
    qsort(1,n*2);

    fillchar(flag,sizeof(flag),0);c:=1;
    for i:=1 to n*2 do
      if event[i]>0 then
        flag[event[i]]:=c
      else if flag[-event[i]]=c then
        inc(c);
    writeln(c-1);
  end;
end.
