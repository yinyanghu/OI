program ural1008;
const
  size=10;
var
  map:array[1..size,1..size]of boolean;
  qx,qy:array[1..size*size]of byte;
  n,i,x,y,front,rear:byte;
  d:char;
procedure check(x,y:byte;d:char);
  begin
    if (x=0) or (x=11) or (y=0) or (y=11) then exit;
    if map[x,y] then begin
      map[x,y]:=false;
      inc(rear);
      qx[rear]:=x;qy[rear]:=y;
      write(d);
    end;
  end;
begin
  fillchar(map,sizeof(map),0);
  read(n);
  if eoln then begin{Given the first representation}
    readln(qx[1],qy[1]);
    for i:=2 to n do begin
       readln(x,y);
      map[x,y]:=true;
    end;

    writeln(qx[1],' ',qy[1]);
    front:=0;rear:=1;
    repeat
      inc(front);
      check(qx[front]+1,qy[front],'R');
      check(qx[front],qy[front]+1,'T');
      check(qx[front]-1,qy[front],'L');
      check(qx[front],qy[front]-1,'B');
      if front=rear then writeln('.') else writeln(',');
    until front=rear;
  end

  else begin{Given the second representation}
    qx[1]:=n;readln(qy[1]);
    front:=0;rear:=1;
    repeat
      inc(front);
      map[qx[front],qy[front]]:=true;
      repeat
        read(d);
        if d='.' then break;
        if d=',' then begin
          readln;
          break;
        end;
        inc(rear);
        case d of
          'R':begin qx[rear]:=qx[front]+1;qy[rear]:=qy[front];end;
          'T':begin qx[rear]:=qx[front];qy[rear]:=qy[front]+1;end;
          'L':begin qx[rear]:=qx[front]-1;qy[rear]:=qy[front];end;
          'B':begin qx[rear]:=qx[front];qy[rear]:=qy[front]-1;end;
        end;
      until false;
    until front=rear;

    writeln(rear);
    for x:=1 to 10 do
      for y:=1 to 10 do
        if map[x,y] then writeln(x,' ',y);
  end;
end.
