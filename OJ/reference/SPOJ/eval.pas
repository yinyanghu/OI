//Written on 6176 -- Mar 24, 2005
program eval;
const
  weight=10000;
  out=10000;
  error=10;
  indeed=out+error;
var
  a,b:array[-1..indeed]of cardinal;
  x,i:longint;
begin
  a[0]:=2;b[-1]:=0;b[0]:=1;
  x:=1;
  repeat
    inc(x);
    for i:=b[-1] to indeed-1 do begin
      inc(b[i+1],b[i] mod x*weight);
      b[i]:=b[i] div x;
    end;
    b[indeed]:=trunc(b[indeed]/x+0.5);
    while b[b[-1]]=0 do inc(b[-1]);
    for i:=indeed downto b[-1] do begin
      inc(a[i],b[i]);
      if a[i]>=weight then begin
        inc(a[i-1]);dec(a[i],weight);
      end;
    end;
    i:=b[-1]-1;
    while a[i]>=weight do begin
      inc(a[i-1]);dec(a[i],weight);dec(i);
    end;
  until b[-1]>out;

  write('2.');
  for i:=1 to out do
    write(a[i] div 1000,a[i] div 100 mod 10,a[i] div 10 mod 10,a[i] mod 10);
  writeln;
end.
