//Written on 6123 -- Jan 30, 2005
program jasiek;
const
  tests=10;
  dx:array[1..4]of shortint=(1,-1,0,0);
  left:array[1..4,1..4]of boolean=((false,false,false,false),(true,false,true,false),(true,false,true,true),(false,false,true,false));
  right:array[1..4,1..4]of boolean=((false,true,false,true),(false,false,false,false),(false,false,false,true),(false,true,true,true));
var
  come,go,first:char;
  u,x,c:longint;
function num(d:char):byte;
  begin
   case d of
     'E':num:=1;
     'W':num:=2;
     'S':num:=3;
     'N':num:=4;
   end;
  end;
begin
  for u:=1 to tests do begin
    readln;
    readln(first);
    if first='K' then begin
      writeln(1);
      continue;
    end;
    go:=first;
    x:=dx[num(first)];c:=0;
    repeat
      come:=go;readln(go);
      if go='K' then break;
      if left[num(come),num(go)] then dec(c,x);
      if right[num(come),num(go)] then inc(c,x+1);
      inc(x,dx[num(go)]);
    until false;
    if left[num(come),num(first)] then dec(c,x);
    if right[num(come),num(first)] then inc(c,x+1);
    writeln(c);
  end;
end.
