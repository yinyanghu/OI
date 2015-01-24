program ural1152;
const
  maxn=20;
var
  a,prev,prev2,next,next2:array[1..maxn]of byte;
  n,i:byte;
  min,now,left:longint;
procedure search;
  var
    l,x,y,z,r,i:byte;
  begin
    for i:=1 to n do begin
      x:=a[prev[i]];y:=a[i];z:=a[next[i]];
      if x+y+z=0 then continue;
      l:=a[prev2[i]];r:=a[next2[i]];
      if (l>0) and (z=0) or (x=0) and (r>0) then continue;
      if now+left-x-y-z>=min then continue;
      a[prev[i]]:=0;a[i]:=0;a[next[i]]:=0;
      dec(left,x+y+z);
      if left>0 then begin
        inc(now,left);
        search;
        dec(now,left);
      end
      else
        if now<min then min:=now;
      inc(left,x+y+z);
      a[prev[i]]:=x;a[i]:=y;a[next[i]]:=z;
    end;
  end;
begin
  read(n);
  for i:=1 to n do begin
    read(a[i]);inc(left,a[i]);
  end;
  for i:=1 to n do begin
    if i=1 then prev[i]:=n else prev[i]:=i-1;
    if i=1 then prev2[i]:=n-1 else if i=2 then prev2[i]:=n else prev2[i]:=i-2;
    if i=n then next[i]:=1 else next[i]:=i+1;
    if i=n then next2[i]:=2 else if i=n-1 then next2[i]:=1 else next2[i]:=i+2;
  end;

  min:=maxlongint;
  search;
  writeln(min);
end.
