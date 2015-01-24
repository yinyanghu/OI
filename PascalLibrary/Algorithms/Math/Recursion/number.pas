program number;
var s:longint;
    n:integer;
procedure change(n:longint);
  var i:integer;
  begin
      inc(s);
      for i:=1 to n div 2 do change(i);
  end;

begin
    assign(input,'number.in'); reset(input);
    assign(output,'number.out'); rewrite(output);
    read(n);
    s:=0;
    change(n);
    writeln(s);
    close(input);
    close(output);
end.
