var
        f,d,h        :       array[1..10000] of longint;
        num,n,ans,no :       longint;
        s            :       string;
function find(x:longint):longint;
var
        i       :       longint;
begin
  for i:=1 to num do
    if h[i]=x then exit(i);
  inc(num);
  h[num]:=x;
  exit(num);
end;

function getfather(x:longint):longint;
var
        t       :       longint;
begin
  if (f[x]=x) or (f[x]=0) then exit(x);
  t:=f[x];
  f[x]:=getfather(f[x]);
  getfather:=f[x];
  d[x]:=(d[x]+d[t]) mod 2;
end;

procedure merge(x,y:longint);
var
        fx,fy   :       longint;
begin
  fx:=getfather(x);
  fy:=getfather(y);
  if fx=fy then exit;
  f[fy]:=fx;
  d[fy]:=(no+d[x]+d[y]) mod 2;
end;

function check(x,y:longint):boolean;
var
        fx,fy     :       longint;
begin
  fx:=getfather(x);
  fy:=getfather(y);
  if fx=fy then
    if (d[x]+d[y]) mod 2<>no then exit(false);
  exit(true);
end;

procedure work;
var
        i,j,k,fx,fy     :     longint;
        ch              :     char;
begin
  fillchar(d,sizeof(d),0);
  fillchar(f,sizeof(f),0);
  fillchar(h,sizeof(h),0);
  readln(n);
  ans:=0;
  num:=0;
  for i:=1 to n do
    begin
      read(j,k,ch);
      dec(j);
      readln(s);
      if s='even' then no:=0 else no:=1;
      fx:=find(j);
      fy:=find(k);
      if check(fx,fy) then
         merge(fx,fy) else
        begin
          ans:=i-1;
          break;
        end;
    end;
  for j:=i+1 to n do readln(s);
  if ans=0 then writeln(n) else writeln(ans);
end;

begin
//  assign(input,'parity.in');reset(input);
  repeat
    readln(n);
    if n=-1 then halt;
    work;
  until false;
  close(input);
end.
