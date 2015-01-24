program ural1076;
const
  maxn=150;
var
  w:array[1..maxn,1..maxn]of byte;
  link,lx,ly:array[1..maxn]of byte;{link[i]=j means xj matches yi}
  x,y:array[1..maxn]of boolean;{True if the vertex is in the interlaced tree}
  n,i,j:byte;
  total:longint;
function find(v:byte):boolean;
  var
    i:byte;
  begin
    x[v]:=true;
    for i:=1 to n do
      if not y[i] and (lx[v]+ly[i]=w[v,i]) then begin
        y[i]:=true;
        if (link[i]=0) or find(link[i]) then begin
          find:=true;link[i]:=v;exit;
        end;
      end;
    find:=false;
  end;
procedure KM;
  var
    i,j,k,d:byte;
  begin
    fillchar(lx,sizeof(lx),0);fillchar(ly,sizeof(ly),0);
    for i:=1 to n do
      for j:=1 to n do
        if w[i,j]>lx[i] then lx[i]:=w[i,j];
    for k:=1 to n do
      repeat
        fillchar(x,sizeof(x),0);fillchar(y,sizeof(y),0);
        if find(k) then break;
        d:=255;
        for i:=1 to n do
          if x[i] then
            for j:=1 to n do
              if not y[j] then
                if lx[i]+ly[j]-w[i,j]<d then
                  d:=lx[i]+ly[j]-w[i,j];
        for i:=1 to n do
          if x[i] then dec(lx[i],d);
        for i:=1 to n do
          if y[i] then inc(ly[i],d);
      until false;
  end;
begin
  readln(n);
  total:=0;
  for i:=1 to n do
    for j:=1 to n do begin
      read(w[i,j]);
      inc(total,w[i,j]);
    end;

  KM;

  for i:=1 to n do
    dec(total,w[link[i],i]);
  writeln(total);
end.
