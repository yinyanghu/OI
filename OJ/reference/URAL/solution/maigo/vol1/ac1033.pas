program ural1033;
const
  maxn=33;
  dx:array[1..4]of shortint=(1,-1,0,0);
  dy:array[1..4]of shortint=(0,0,1,-1);
var
  map:array[0..maxn+1,0..maxn+1]of char;
  v:array[1..maxn,1..maxn]of boolean;
  qx,qy:array[1..maxn*maxn]of byte;
  n,i,j,x,y:byte;
  front,rear:integer;
  s:integer;
begin
  readln(n);
  for i:=1 to n do begin
    map[0,i]:='#';
    map[i,0]:='#';
    map[n+1,i]:='#';
    map[i,n+1]:='#';
  end;
  for i:=1 to n do begin
    for j:=1 to n do
      read(map[i,j]);
    readln;
  end;

  fillchar(v,sizeof(v),0);
  front:=0;rear:=2;
  qx[1]:=1;qy[1]:=1;v[1,1]:=true;
  qx[2]:=n;qy[2]:=n;v[n,n]:=true;
  s:=0;
  repeat
    inc(front);
    for i:=1 to 4 do begin
      x:=qx[front]+dx[i];y:=qy[front]+dy[i];
      if map[x,y]='#' then
        inc(s)
      else if not v[x,y] then begin
        inc(rear);qx[rear]:=x;qy[rear]:=y;v[x,y]:=true;
      end;
    end;
  until front=rear;
  writeln((s-4)*9);
end.
