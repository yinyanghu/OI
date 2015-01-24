//Written on 6130 -- Feb 6, 2005
program vonny;
const
  height=7;
  width=8;
var
  a:array[1..height,1..width]of byte;
  dir:array[1..height,1..width]of char;
  used:array[0..6,0..6]of boolean;
  t,u,i,j,count:longint;
procedure search(x,y:byte);
  procedure next;
    begin
      if y=width then
        if x=height then inc(count) else search(x+1,1)
      else
        search(x,y+1);
    end;
  begin
    if dir[x,y]>' ' then
      next
    else begin
      if (x<height) and not used[a[x,y],a[x+1,y]] then begin
        dir[x,y]:='D';dir[x+1,y]:='U';
        used[a[x,y],a[x+1,y]]:=true;used[a[x+1,y],a[x,y]]:=true;
        next;
        dir[x,y]:=' ';dir[x+1,y]:=' ';
        used[a[x,y],a[x+1,y]]:=false;used[a[x+1,y],a[x,y]]:=false;
      end;
      if (y<width) and (dir[x,y+1]=' ') and not used[a[x,y],a[x,y+1]] then begin
        dir[x,y]:='R';dir[x,y+1]:='L';
        used[a[x,y],a[x,y+1]]:=true;used[a[x,y+1],a[x,y]]:=true;
        next;
        dir[x,y]:=' ';dir[x,y+1]:=' ';
        used[a[x,y],a[x,y+1]]:=false;used[a[x,y+1],a[x,y]]:=false;
      end;
    end;
  end;
begin
  fillchar(dir,sizeof(dir),' ');
  read(t);
  for u:=1 to t do begin
    for i:=1 to height do
      for j:=1 to width do
        read(a[i,j]);
    count:=0;
    search(1,1);
    writeln(count);
  end;
end.
