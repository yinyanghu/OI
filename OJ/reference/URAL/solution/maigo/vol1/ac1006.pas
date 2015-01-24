program ural1006;
const
  c1=chr(218);c2=chr(191);c3=chr(192);c4=chr(217);
  hl=chr(196);vl=chr(179);any='?';
  line=[c1,c2,c3,c4,hl,vl];
  h=20;w=50;
var
  map:array[1..h,1..w]of char;
  l,r,u,d,hc,vc:array[0..h,0..w]of integer;
  ans:array[1..h*w]of record x,y,size:byte;end;
  lines,count,i,j:word;
function min(a,b:byte):byte;
  begin
    if a<b then min:=a else min:=b;
  end;
procedure precal;
  var
    i,j:byte;
  begin
    for i:=1 to h do
      for j:=1 to w do begin
        if map[i,j] in line then begin
          hc[i,j]:=hc[i,j-1]+1;vc[i,j]:=vc[i-1,j]+1;
        end
        else begin
          hc[i,j]:=hc[i,j-1];vc[i,j]:=vc[i-1,j];
        end;
        case map[i,j] of
          c1,c3:l[i,j]:=j;
          c2,c4,hl,any:if map[i,j-1] in [c1,c3,hl,any] then l[i,j]:=l[i,j-1] else l[i,j]:=j;
        end;
        case map[i,j] of
          c1,c2:u[i,j]:=i;
          c3,c4,vl,any:if map[i-1,j] in [c1,c2,vl,any] then u[i,j]:=u[i-1,j] else u[i,j]:=i;
        end;
      end;
    for i:=h downto 1 do
      for j:=w downto 1 do begin
        case map[i,j] of
          c2,c4:r[i,j]:=j;
          c1,c3,hl,any:if map[i,j+1] in [c2,c4,hl,any] then r[i,j]:=r[i,j+1] else r[i,j]:=j;
        end;
        case map[i,j] of
          c3,c4:d[i,j]:=i;
          c1,c2,vl,any:if map[i+1,j] in [c3,c4,vl,any] then d[i,j]:=d[i+1,j] else d[i,j]:=i;
        end;
      end;
  end;
procedure clear(x,y:byte);
  begin
    if map[x,y] in line then dec(lines);
    map[x,y]:=any;
  end;
function saveans(a,b,c:byte):boolean;
  var
    i,j:byte;
    t:word;
  begin
    t:=lines;
    for i:=a to a+c do begin
      clear(i,b);clear(i,b+c);
    end;
    for i:=b+1 to b+c-1 do begin
      clear(a,i);clear(a+c,i);
    end;
    if lines=t then
      saveans:=false
    else begin
      inc(count);
      with ans[count] do begin x:=b-1;y:=a-1;size:=c+1;end;
      saveans:=true;
    end;
  end;
procedure find;
  var
    i,j,k:byte;
  begin
    for i:=1 to h-1 do
      for j:=1 to w-1 do
        if map[i,j] in [c1,any] then
          for k:=1 to min(d[i,j]-i,r[i,j]-j) do
            if (map[i,j+k] in [c2,any]) and
               (map[i+k,j] in [c3,any]) and
               (map[i+k,j+k] in [c4,any]) and
               (u[i+k,j+k]<=i) and (l[i+k,j+k]<=j) and
               ((vc[i+k,j]>vc[i-1,j]) or (hc[i,j+k]>hc[i,j-1])) then
              if saveans(i,j,k) then exit;
  end;
begin
  for i:=1 to h do begin
    for j:=1 to w do begin
      read(map[i,j]);
      if map[i,j] in line then inc(lines);
    end;
    readln;
  end;

  while lines>0 do begin
    precal;
    find;
  end;

  writeln(count);
  for i:=count downto 1 do
    writeln(ans[i].x,' ',ans[i].y,' ',ans[i].size);
end.
