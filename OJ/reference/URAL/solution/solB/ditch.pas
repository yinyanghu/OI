{
LANG:PASCAL
ID:canly.x1
PROB:ditch
}
const
        maxn    =       200;

var
        f,c               :       array[1..maxn,1..maxn] of longint;
        last              :       array[1..maxn]         of longint;
        check             :       array[1..maxn]         of boolean;
        n,m,s,t           :       longint;

procedure prepare;
var
        i,a,b,cc   :       longint;
begin
  assign(input,'ditch.in');reset(input);
  fillchar(c,sizeof(c),0);
  fillchar(f,sizeof(f),0);
  readln(m,n);
  for i:=1 to m do
    begin
      readln(a,b,cc);
      if a<>b then
      inc(c[a,b],cc);
    end;
  s:=1;
  t:=n;
  close(input);
end;

function getpoint:longint;
var
        i       :       longint;
begin
  for i:=1 to n do
    if (last[i]<>0) and not(check[i]) then exit(i);
  exit(0);
end;

function find:boolean;
var
        i,j,k           :       longint;
begin
  fillchar(last,sizeof(last),0);
  fillchar(check,sizeof(check),false);
  last[s]:=-1;
  repeat
    i:=getpoint;
    if i=0 then exit(false);
    for j:=1 to n do
      if not check[j] then
        if (c[i,j]-f[i,j]>0) or (f[j,i]>0) then
          if c[i,j]-f[i,j]>0 then last[j]:=i
                             else last[j]:=-i;
    check[i]:=true;
  until last[t]<>0;
  if last[t]<>0 then exit(true) else exit(false);
end;

procedure update;
var
        min,i,j     :       longint;
begin
  min:=maxlongint;
  j:=t;
  while j<>s do
    begin
      i:=abs(last[j]);
      if last[j]<0 then
        if f[j,i]<min then min:=f[j,i];
      if last[j]>0 then
        if c[i,j]-f[i,j]<min then min:=c[i,j]-f[i,j];
        j:=i;
    end;
  j:=t;
  while j<>s do
    begin
      i:=abs(last[j]);
      if last[j]<0 then dec(f[j,i],min)
                   else inc(f[i,j],min);
      j:=i;
    end;
end;

procedure work;
begin
  while
  find
  do
  update;
end;

procedure print;
var
        i,sum   :       longint;
begin
  sum:=0;
  for i:=1 to n do
    if f[s,i]>0 then inc(sum,f[s,i]);
  assign(output,'ditch.out');rewrite(output);
  writeln(sum);
  close(output);
end;

begin
  prepare;
  work;
  print;
end.

