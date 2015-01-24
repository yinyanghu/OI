//Written on 6418 -- Nov 21, 2005
program brckts;
{$Q-,R-}
const
  tests=10;
  maxn=30000;
  treesize=65535;
var
  brac:array[1..maxn]of char;
  delta,min:array[1..treesize]of longint;
  u,n,m,i,sum,x:longint;
procedure init(p,l,r:longint);
  var
    m:longint;
  begin
    if l=r then begin
      read(brac[l]);
      if brac[l]='(' then inc(sum) else dec(sum);
      delta[p]:=0;min[p]:=sum;
    end
    else begin
      delta[p]:=0;
      m:=(l+r) shr 1;
      init(p*2,l,m);min[p]:=min[p*2];
      if m<r then begin init(p*2+1,m+1,r);if min[p*2+1]<min[p] then min[p]:=min[p*2+1];end;
    end;
  end;
procedure modify(p,l,r,x,d:longint);
  var
    m:longint;
  begin
    if (l<r) and (delta[p]<>0) then begin
      inc(delta[p*2],delta[p]);inc(min[p*2],delta[p]);
      inc(delta[p*2+1],delta[p]);inc(min[p*2+1],delta[p]);
      delta[p]:=0;
    end;
    if x=l then begin delta[p]:=d;inc(min[p],d);exit;end;
    m:=(l+r) shr 1;
    if x>m then
      modify(p*2+1,m+1,r,x,d)
    else begin
      modify(p*2,l,m,x,d);
      modify(p*2+1,m+1,r,m+1,d);
    end;
    min[p]:=min[p*2];
    if (m<r) and (min[p*2+1]<min[p]) then min[p]:=min[p*2+1];
  end;
begin
  for u:=1 to tests do begin
    writeln('Test ',u,':');
    readln(n);sum:=0;
    init(1,1,n);
    read(m);
    for i:=1 to m do begin
      read(x);
      if x=0 then
        if (sum=0) and (min[1]>=0) then writeln('YES') else writeln('NO')
      else
        case brac[x] of
          '(':begin brac[x]:=')';dec(sum,2);modify(1,1,n,x,-2);end;
          ')':begin brac[x]:='(';inc(sum,2);modify(1,1,n,x,2);end;
        end;
    end;
  end;
end.
