program ural1324;
const
  r:longint=750000000;
var
  l,m:longint;
  t:byte;
function remain(x,y:longint):longint;
  begin
    remain:=x div y+y-2+ord(x mod y=y-1);
  end;
function len(x:longint;out:boolean):byte;
  var
    res:byte;
    i,t,b,min:longint;
  begin
    res:=0;
    while x>1 do begin
      inc(res);min:=maxlongint;
      for i:=2 to x do begin
        t:=remain(x,i);
        if t<min then begin min:=t;b:=i;end;
        if t>min then break;
      end;
      if out then writeln(b);
      x:=min;
    end;
    len:=res;
  end;
begin
  read(l);
  t:=len(l,false);
  writeln(t);
  repeat
    m:=(l+r+1) div 2;
    if len(m,false)>t then r:=m-1 else l:=m;
  until l=r;
  t:=len(l,true);
end.
