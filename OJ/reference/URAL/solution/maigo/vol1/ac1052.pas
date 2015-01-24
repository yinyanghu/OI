program ural1052;
const
  maxn=200;
type
  dot=record
        x,y:integer;
      end;
var
  r:array[1..maxn]of dot;
  n,i,j,k,c,ans:byte;
function line(a,b,c:dot):boolean;
  var
    x1,y1,x2,y2:integer;
  begin
    x1:=b.x-a.x;y1:=b.y-a.y;x2:=c.x-a.x;y2:=c.y-a.y;
    line:=x1*y2=x2*y1;
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(r[i].x,r[i].y);

  ans:=0;
  for i:=1 to n-1 do
    for j:=i+1 to n do begin
      c:=2;
      for k:=1 to n do begin
        if (k=i) or (k=j) then continue;
        if line(r[i],r[j],r[k]) then inc(c);
      end;
      if c>ans then ans:=c;
    end;

  writeln(ans);
end.
