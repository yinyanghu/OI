program ural1176;
const
  maxn=1000;
  maxl=32000;
  e:array[0..7]of byte=(1,2,4,8,16,32,64,128);
var
  ad:array[0..maxn*maxn shr 3-1]of byte;
  now:array[1..maxn]of word;
  s,r:array[0..maxl+1]of word;
  n,a,i,j:word;
  x:byte;
function p(x,y:word):longint;
  begin
    p:=(x-1)*maxn shr 3+(y-1) div 8;
  end;
procedure setedge(x,y:word);
  var
    q:longint;
  begin
    q:=p(x,y);
    ad[q]:=ad[q] or e[(y-1) mod 8];
  end;
function adj(x,y:word):boolean;
  var
    q:longint;
  begin
    q:=p(x,y);
    adj:=ad[q] and e[(y-1) mod 8]>0;
  end;
procedure next(x:word);
  begin
    repeat
      inc(now[x]);
    until (now[x]>n) or adj(x,now[x]);
  end;
begin
  read(n,a);
  for i:=1 to n do begin
    now[i]:=n+1;
    for j:=1 to n do begin
      read(x);
      if (i<>j) and (x=0) then begin
        setedge(i,j);
        if j<now[i] then now[i]:=j;
      end;
    end;
  end;

  s[0]:=1;s[1]:=a;
  repeat
    while now[s[s[0]]]<=n do begin
      s[s[0]+1]:=now[s[s[0]]];
      next(s[s[0]]);
      inc(s[0]);
    end;
    repeat
      inc(r[0]);
      r[r[0]]:=s[s[0]];
      dec(s[0]);
    until (s[0]=0) or (now[s[s[0]]]<=n);
  until s[0]=0;

  for i:=r[0] downto 2 do
    writeln(r[i],' ',r[i-1]);
end.
