//Written on 6194 -- Apr 11, 2005
program tree2;
const
  maxl=30;
var
  b:array[1..maxl]of byte;
  t,u,a,l,i,c:longint;
begin
  read(t);
  for u:=1 to t do begin
    read(a);
    if a=0 then begin writeln(0);continue;end;
    l:=0;
    while a>0 do begin
      inc(l);b[l]:=a and 1;a:=a shr 1;
    end;
    i:=1;while b[i]=0 do inc(i);
    c:=0;
    while i<l do begin
      if b[i]=1 then begin b[i]:=0;inc(c);end
                else begin b[i]:=1;dec(c);break;end;
      inc(i);
    end;
    for i:=1 to c do
      b[i*2+1]:=1;
    a:=0;for i:=l downto 1 do a:=a*2+b[i];
    writeln(a);
  end;
end.
