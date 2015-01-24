program ural1202;
var
  n,i,l,r,b1,t1,b2,t2,y,step:longint;
begin
  read(n);
  read(l,b2,r,t2);y:=b2+1;
  for i:=2 to n do begin
    b1:=b2;t1:=t2;
    read(r,b2,r,t2);
    if (t2-b1<2) or (t1-b2<2) then begin
      writeln(-1);
      halt;
    end;
    if y<=b2 then begin
      inc(step,b2+1-y);
      y:=b2+1;
    end
    else if y>=t2 then begin
      inc(step,y-t2+1);
      y:=t2-1;
    end;
  end;
  writeln(step+abs(t2-1-y)+r-l-2);
end.
