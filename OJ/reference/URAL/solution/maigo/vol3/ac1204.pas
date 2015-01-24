program ural1204;
const
  primes=3401;
  maxds=9;
  maxas=512;
var
  prime:array[1..primes]of word;
  m:array[1..maxds]of longint;
  ans:array[1..maxas]of longint;
  k,n,t,a,b,i,j:longint;
  x,c:word;
procedure calprimes;
  var
    p,x,i:word;
    ok:boolean;
  begin
    p:=1;prime[1]:=2;
    x:=3;
    repeat
      ok:=true;
      for i:=2 to p do
        if x mod prime[i]=0 then begin
          ok:=false;break;
        end;
      if ok then begin
        inc(p);prime[p]:=x;
      end;
      inc(x,2);
    until p=primes;
  end;
function p(a,b:longint):longint;
  var
    c,d:longint;
  begin
    if a=1 then
      p:=1
    else begin
      c:=a-b mod a;
      d:=p(c,a);
      p:=d*(b div a+1)-d*c div a;
    end;
  end;
procedure cal;{Find the min x that satisfy (x mod a=0) and (x mod b=1)}
  begin
    if a=n then exit;
    b:=n div a;
    inc(c);
    ans[c]:=a*p(a mod b,b);
  end;
procedure search(l:byte);
  begin
    if l>j then
      cal
    else begin
      search(l+1);
      if m[l]>1 then begin
        a:=a*m[l];
        search(l+1);
        a:=a div m[l];
      end;
    end;
  end;
procedure qsort(s,t:word);
  var
    p,i,j:word;
    tmp:longint;
  begin
    if s>=t then exit;
    p:=s+random(t-s+1);
    tmp:=ans[p];ans[p]:=ans[s];
    i:=s;j:=t;
    repeat
      while (i<j) and (ans[j]>tmp) do dec(j);
      if i=j then break;ans[i]:=ans[j];inc(i);
      while (i<j) and (ans[i]<tmp) do inc(i);
      if i=j then break;ans[j]:=ans[i];dec(j);
    until i=j;
    ans[i]:=tmp;
    qsort(s,i-1);
    qsort(i+1,t);
  end;
begin
  calprimes;
  read(k);
  for i:=1 to k do begin
    read(n);
    t:=n;x:=1;j:=0;
    while (t>1) and (x<=primes) do
      if t mod prime[x]=0 then begin
        inc(j);m[j]:=1;
        while t mod prime[x]=0 do begin
          m[j]:=m[j]*prime[x];t:=t div prime[x];
        end;
      end
      else
        inc(x);
    if t>1 then begin
      inc(j);m[j]:=t;
    end;
    c:=1;a:=1;
    search(1);
    qsort(1,c);
    for j:=1 to c-1 do write(ans[j],' ');
    writeln(ans[c]);
  end;
end.
