program ural1165;
{$Q-,R-}
const
  maxl=200;
type
  bignum=array[-1..210]of integer;
var
  sum:array[0..maxl]of bignum;
  match:array[2..maxl+1]of byte;
  s:string;
  n,i,j:longint;
  ans:bignum;
//Basical procs & funcs for bignums & strings
procedure out(a:bignum);
  var
    i:longint;
  begin
    for i:=a[-1] downto 0 do write(a[i]);writeln;
  end;
procedure big_minus_small(var a:bignum;b:longint);
  var
    i,t:longint;
  begin
    dec(a[0],b);i:=0;
    while a[i]<0 do begin
      t:=(9-a[i]) div 10;
      dec(a[i+1],t);inc(a[i],t*10);
      inc(i);
    end;
    while (a[-1]>0) and (a[a[-1]]=0) do dec(a[-1]);
  end;
function smaller(a,b:bignum):boolean;
  var
    i:longint;
  begin
    if a[-1]<>b[-1] then
      smaller:=a[-1]<b[-1]
    else begin
      for i:=a[-1] downto 0 do
        if a[i]<>b[i] then begin
          smaller:=a[i]<b[i];exit;
        end;
      smaller:=false;
    end;
  end;
procedure prevnum(var s:string);
  var
    i:longint;
  begin
    i:=length(s);
    while s[i]='0' do begin s[i]:='9';dec(i);end;
    dec(s[i]);if s[1]='0' then delete(s,1,1);
  end;
procedure nextnum(var s:string);
  var
    i:longint;
  begin
    i:=length(s);
    while (i>0) and (s[i]='9') do begin s[i]:='0';dec(i);end;
    if i>0 then inc(s[i]) else s:='1'+s;
  end;
//Procs & funcs for this prob
function posi(s:string):bignum;
  var
    a:bignum;
    l,i:longint;
  begin
    l:=length(s);dec(s[1]);
    a:=sum[l-1];
    for i:=1 to l do
      inc(a[l-i],(ord(s[i])-48)*l);
    inc(a[0]);
    i:=0;
    while (i<a[-1]) or (a[i]>9) do begin
      inc(a[i+1],a[i] div 10);a[i]:=a[i] mod 10;inc(i);
    end;
    a[-1]:=i;
    posi:=a;
  end;
procedure complete(st,ed:longint);
  var
    a:bignum;
    p,q:string;
    i:longint;
  begin
    p:=copy(s,st,ed-st+1);a:=posi(p);
    if (a[-1]<3) and (a[2]*100+a[1]*10+a[0]<st) then exit;
    big_minus_small(a,st-1);
    if not smaller(a,ans) then exit;

    q:=p;
    while st>1 do begin
      prevnum(p);
      for i:=length(p) downto 1 do begin
        dec(st);if s[st]<>p[i] then exit;
        if st=1 then break;
      end;
    end;
    while ed<n do begin
      nextnum(q);
      for i:=1 to length(q) do begin
        inc(ed);if s[ed]<>q[i] then exit;
        if ed=n then break;
      end;
    end;
    ans:=a;
  end;
procedure incomplete(mid:longint);
  var
    p:string;
    h,i,j,l:longint;
    a:bignum;
  begin
    p:=copy(s,1,mid);
    h:=length(p);
    while (h>0) and (p[h]='9') do begin p[h]:='0';dec(h);end;
    if h>0 then begin inc(p[h]);dec(h);end;

    j:=n-mid+2;if j<mid+2 then j:=mid+2;
    for i:=j to n+1 do begin
      if match[i]>h then continue;
      l:=match[i];
      if l=h then while (i-1+l<n) and (s[i+l]=p[l+1]) do inc(l);
      if i+l<=n then continue;
      a:=posi(copy(s,mid+1,n-mid-l)+p);
      big_minus_small(a,mid);
      if smaller(a,ans) then ans:=a;
    end;
  end;
begin
  for i:=1 to maxl do begin
    sum[i]:=sum[i-1];
    inc(sum[i][i-1],9*i);
    j:=i-1;
    while sum[i][j]>9 do begin
      inc(sum[i][j+1],sum[i][j] div 10);sum[i][j]:=sum[i][j] mod 10;inc(j);
    end;
    sum[i][-1]:=j;
  end;

  readln(s);n:=length(s);
  j:=0;for i:=1 to n do if s[i]>'0' then begin j:=1;break;end;
  if j=0 then begin
    ans:=posi('1'+s);
    i:=0;while ans[i]=9 do begin ans[i]:=0;inc(i);end;
    inc(ans[i]);if i>ans[-1] then ans[-1]:=i;
    out(ans);halt;
  end;

  ans[-1]:=maxint;
  for i:=1 to n do if s[i]>'0' then
    for j:=i to n do if (j=n) or (s[j+1]>'0') then
      complete(i,j);
  for i:=2 to n do
    while (i+match[i]<=n) and (s[i+match[i]]=s[match[i]+1]) do inc(match[i]);
  for i:=1 to n-1 do
    if s[i+1]>'0' then incomplete(i);

  out(ans);
end.
