program ural1302;
var
  a,b,ra,rb,dl,dr,h:longint;
  da,db:boolean;
procedure calrd(var n,r:longint;var d:boolean);
  begin
    r:=trunc(sqrt(n-1));
    d:=odd(n-r*r);
  end;
begin
  read(a,b);if a>b then begin h:=a;a:=b;b:=h;end;
  calrd(a,ra,da);calrd(b,rb,db);
  if ra=rb then begin
    writeln(b-a);
    halt;
  end;
  dl:=(ra+rb)*(rb-ra);
  dr:=(ra+rb+2)*(rb-ra);
  h:=(rb-ra)*2;
  if da then begin inc(dl);dec(dr);dec(h);end;
  if db then begin dec(dl);inc(dr);inc(h);end;
  if b<a+dl then
    writeln(h+a+dl-b)
  else if b>a+dr then
    writeln(h+b-a-dr)
  else
    writeln(h);
end.
