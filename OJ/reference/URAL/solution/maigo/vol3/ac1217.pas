program ural1217;
var
  a:array[0..5,0..45]of word;
  n:byte;
procedure cala(x:byte);
  var
    i,j,k:byte;
  begin
    fillchar(a,sizeof(a),0);
    a[0,0]:=1;
    for i:=1 to x do
      for j:=0 to 9 do
        for k:=j to 45 do
          inc(a[i,k],a[i-1,k-j]);
  end;
function b(x:byte):int64;
  var
    t:int64;
    i:byte;
  begin
    t:=0;
    for i:=0 to 45 do
      inc(t,sqr(a[x,i]));
    b:=t;
  end;
begin
  readln(n);
  if n mod 4=0 then begin
    cala(n div 4);
    writeln(sqr(b(n div 4)));
  end
  else begin
    cala((n+2) div 4);
    writeln(b((n-2) div 4)*b((n+2) div 4));
  end;
end.
