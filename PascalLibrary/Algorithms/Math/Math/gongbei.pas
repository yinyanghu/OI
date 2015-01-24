program gongbei;
var i,j:integer;
function lcm(a,b:integer):integer;
 begin
     if a>0 then lcm:=a;
     while (lcm mod b>0) do inc(lcm,a);
 end;
 {
  var i:integer;
  begin
      i:=b;
      while (i mod a>0) do i:=i+b;
      lcm:=i;
  end;
 }
begin
    write('Enter two numbers=');
    readln(i,j);
    writeln('Min Gong Bei Shu:=',lcm(i,j));
end.