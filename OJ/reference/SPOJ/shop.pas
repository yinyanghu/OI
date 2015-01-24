//Written on 6130 -- Feb 6, 2005
program shop;
const
  maxsize=25;
  dx:array[1..4]of shortint=(0,0,1,-1);
  dy:array[1..4]of shortint=(1,-1,0,0);
var
  map:array[1..maxsize,1..maxsize]of char;
  dist:array[1..maxsize,1..maxsize]of word;
  v:array[0..maxsize+1,0..maxsize+1]of boolean;
  w,h,i,j,sx,sy,tx,ty,td:word;
begin
  repeat
    readln(w,h);
    if w=0 then halt;

    fillchar(v,sizeof(v),0);
    for i:=0 to w+1 do begin v[0,i]:=true;v[h+1,i]:=true;end;
    for i:=1 to h do begin v[i,0]:=true;v[i,w+1]:=true;end;
    for i:=1 to h do begin
      for j:=1 to w do begin
        read(map[i,j]);
        case map[i,j] of
          'S':begin sx:=i;sy:=j;end;
          'D':map[i,j]:='0';
          'X':v[i,j]:=true;
        end;
      end;
      readln;
    end;

    fillchar(dist,sizeof(dist),255);
    dist[sx,sy]:=0;
    repeat
      v[sx,sy]:=true;
      for i:=1 to 4 do begin
        tx:=sx+dx[i];ty:=sy+dy[i];
        if v[tx,ty] then continue;
        td:=dist[sx,sy]+ord(map[tx,ty])-48;
        if td<dist[tx,ty] then dist[tx,ty]:=td;
      end;
      td:=maxint;
      for i:=1 to h do
        for j:=1 to w do
          if not v[i,j] and (dist[i,j]<td) then begin
            td:=dist[i,j];tx:=i;ty:=j;
          end;
      sx:=tx;sy:=ty;
    until map[sx,sy]='0';
    writeln(dist[sx,sy]);
  until false;
end.
