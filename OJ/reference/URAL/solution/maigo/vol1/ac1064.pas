program ural1064;
const
  maxn=10000;
var
  int:array[1..maxn,1..2]of integer;
  i,ints,n:integer;
  l:byte;
  b:boolean;
function bsearch(x:integer):byte;
  var
    p,q,i,l:integer;
  begin
    p:=0;q:=n-1;l:=0;
    repeat
      i:=(p+q) div 2;
      inc(l);
      if i=x then begin
        bsearch:=l;
        exit;
      end;
      if x<i then
        q:=i-1
      else
        p:=i+1;
    until false;
  end;
begin
  readln(i,l);
  ints:=0;b:=false;
  for n:=i+1 to 10000 do
    if bsearch(i)=l then begin
      if not b then begin
        inc(ints);
        int[ints,1]:=n;
        b:=true;
      end;
    end
    else
      if b then begin
        int[ints,2]:=n-1;
        b:=false;
      end;
  if b then
    int[ints,2]:=maxn;

  writeln(ints);
  for n:=1 to ints do
    writeln(int[n,1],' ',int[n,2]);
end.
