program ural1189;
var
  sol:array[1..50{More than enough}]of longint;
  n,suf:longint;
  count,l,i,j:byte;
  s:string;
procedure insert(x:longint);
  var
    i,j:byte;
  begin
    i:=1;
    while i<=count do begin
      if sol[i]=x then exit;
      if sol[i]>x then break;
      inc(i);
    end;
    for j:=count downto i do
      sol[j+1]:=sol[j];
    sol[i]:=x;
    inc(count);
  end;
procedure divide(x:longint);
  var
    y:byte;
  begin
    if x=0 then exit;
    if x mod 11<10 then
      insert((x-x div 11)*power(10,l)+suf);
    if not odd(x) and (x>9) then begin
      y:=x mod 10 div 2;
      inc(l);
      inc(suf,y*power(10,l-1));
      divide(x div 10);
      inc(suf,5*power(10,l-1));
      divide(x div 10-1);
      dec(l);
      suf:=suf mod power(10,l);
    end;
  end;
begin
  readln(n);

  count:=0;suf:=0;l:=0;
  divide(n);

  writeln(count);
  for i:=1 to count do begin
    write(sol[i],' + ');
    str(sol[i],s);
    l:=length(s)-1;
    str(n-sol[i],s);
    for j:=1 to l-length(s) do
      write(0);
    writeln(s,' = ',n);
  end;
end.
