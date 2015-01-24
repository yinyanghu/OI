//Written on 6182 -- Mar 30, 2005
program tree1;
var
  t,u,n:byte;
  base,hi,lo:qword;
  s:string;
procedure c(a,b:byte);
  var
    i,t:byte;
  begin
    for i:=1 to b do begin
      t:=a-b+i;
      hi:=hi*t;lo:=lo*t;
      lo:=(lo+hi mod i*base) div i;
      hi:=hi div i;
      inc(hi,lo div base);
      lo:=lo mod base;
    end;
  end;
procedure tree(s,t:byte);
  var
    x:byte;
  begin
    read(x);
    c(t-s,x-s);
    if s<x then tree(s,x-1);
    if x<t then tree(x+1,t);
  end;
begin
  base:=1000000;base:=sqr(base);
  read(t);
  for u:=1 to t do begin
    read(n);
    lo:=1;hi:=0;
    tree(1,n);
    if hi=0 then
      writeln(lo)
    else begin
      str(lo,s);
      write(hi);
      for n:=length(s) to 11 do write(0);
      writeln(lo);
    end;
  end;
end.
