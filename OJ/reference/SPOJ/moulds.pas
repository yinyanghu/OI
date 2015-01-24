//Written on 6373 -- Oct 7, 2005
program moulds;
const
  size=250;
var
  cut:array[1..size,1..size]of byte;
  t,u,x,y,depth,dx,dy,n,i,sign:longint;
  c:char;
procedure getnum(var n:longint);
  begin
    read(c);
    if c='-' then sign:=-1 else sign:=1;
    if c in ['+','-'] then n:=0 else n:=ord(c)-48;
    repeat
      read(c);
      if c=';' then break;
      n:=n*10+ord(c)-48;
    until false;
    n:=n*sign;
  end;
begin
  readln(t);
  for u:=1 to t do begin
    fillchar(cut,sizeof(cut),0);
    x:=1;y:=size;depth:=-1;
    repeat
      read(c);
      case c of
        '^':begin
              getnum(n);inc(depth,n);
              if depth>cut[x,y] then cut[x,y]:=depth;
            end;
        '@':begin
              read(c);
              case c of
                'N':begin dx:=0;dy:=1;end;
                'S':begin dx:=0;dy:=-1;end;
                'W':begin dx:=-1;dy:=0;end;
                'E':begin dx:=1;dy:=0;end;
              end;
              getnum(n);
              for i:=1 to n do begin
                inc(x,dx);inc(y,dy);
                if (x>0) and (x<=size) and (y>0) and (y<=size) and
                   (depth>cut[x,y]) then cut[x,y]:=depth;
              end;
            end;
      end;
    until seekeoln;

    readln;n:=0;
    for x:=1 to size do
      for y:=1 to size do
        inc(n,cut[x,y]);
    writeln(n);
  end;
end.
