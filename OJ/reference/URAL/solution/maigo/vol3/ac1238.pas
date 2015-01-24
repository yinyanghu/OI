program ural1238;
const
  maxn=100;
var
  best:array[0..5050]of string[100];
  len,i,j:byte;
  s:string;
function p(x,y:byte):word;
  begin
    if x>y then p:=0 else p:=y*(y-1) div 2+x;
  end;
function cstr(x:byte):string;
  begin
    str(x,cstr);
  end;
procedure calbest(x,y:byte);
  var
    i:byte;
    t:string;
  function rep(l:byte):boolean;
    var
      m:byte;
    begin
      m:=x+l;
      repeat
        if copy(s,m,l)<>copy(s,x,l) then begin
          rep:=false;
          exit;
        end;
        inc(m,l);
      until m>y;
      rep:=true;
    end;
  begin
    best[p(x,y)]:=copy(s,x,y-x+1);
    for i:=x to y-1 do begin
      t:=best[p(x,i)]+best[p(i+1,y)];
      if length(t)<length(best[p(x,y)]) then best[p(x,y)]:=t;
    end;
    for i:=1 to (y-x+1) div 2 do
      if (y-x+1) mod i=0 then
        if rep(i) then begin
          t:=cstr((y-x+1) div i)+'('+best[p(x,x+i-1)]+')';
          if length(t)<length(best[p(x,y)]) then best[p(x,y)]:=t;
        end;
  end;
begin
  readln(s);len:=length(s);
  best[0]:='';
  for i:=1 to len do
    for j:=i downto 1 do
      calbest(j,i);
  writeln(best[p(1,len)]);
end.
