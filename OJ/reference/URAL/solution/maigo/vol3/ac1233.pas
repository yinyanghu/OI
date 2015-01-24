program ural1233;
var
  pow:array[0..19]of qword;
  a,b,d:qword;
  l,e:byte;
procedure fail;
  begin
    writeln(0);
    halt;
  end;
procedure judgefail(a,b:qword);
  var
    p:byte;
  begin
    p:=1;
    while a mod 10=0 do begin
      a:=a div 10;
      inc(p);
    end;
    if a=1 then if b<>p then fail;
  end;
begin
  pow[0]:=1;for e:=1 to 19 do pow[e]:=pow[e-1]*10;

  read(a,b);
  judgefail(a,b);
  l:=1;while a>=pow[l] do inc(l);
  e:=0;
  repeat
    inc(e);
    if e<=l then
      d:=a div pow[l-e]-pow[e-1]+1
    else
      d:=a*pow[e-l]-pow[e-1];
    if (e<l) and (d>=b) or (e=l) and (d>b) then fail;
    if d>b then d:=b;
    dec(b,d);
  until b=0;
  writeln(pow[e-1]-1+d);
end.
