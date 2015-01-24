{$INLINE ON}
{$i-,s-,r-,q-}
var
                c       :       array[0..33000] of longint;
                ans     :       array[0..15000] of longint;

function lowbit(x:longint):longint;inline;
begin
  exit(x and (x xor (x-1)));
end;

function getsum(x:longint):longint;inline;
var
        i       :       longint;
begin
  i:=0;
  while x>0 do
    begin
      inc(i,c[x]);
      x:=x-lowbit(x);
    end;
  exit(i);
end;

procedure change(x:longint);inline;
begin
  while x<=33000 do
    begin
      inc(c[x]);
      x:=x+lowbit(x);
    end;
end;

var
        i,j,k,n,useless  :       longint;
begin
  fillchar(ans,sizeof(ans),0);
  fillchar(c,sizeof(c),0);
  readln(n);
  for i:=1 to n do
    begin
      readln(j,useless);
      inc(j);
      k:=getsum(j);
      inc(ans[k]);
      change(j);
    end;
  for i:=0 to n-1 do
    writeln(ans[i]);
end.