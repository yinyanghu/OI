program question5;
var a,b,c:integer;
begin
    writeln;
    write('bai qian bai ji wen ti = ');
    for a:=1 to 33 do
     for b:=1 to 50 do
      for c:=1 to 300 do
       if (a*3+b*2+c/3=100) and (a+b+c=100) then write(a,' ',b,' ',c,'     ');
end.
