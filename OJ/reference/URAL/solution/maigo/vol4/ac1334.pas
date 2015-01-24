program ural1334;
const
  dx:array[1..8]of shortint=(-1,-1,-1,0,1,1,1,0);
  dy:array[1..8]of shortint=(-1,0,1,1,1,0,-1,-1);
var
  a:array[0..9,0..9]of byte;
  i,x,y,d:byte;
  c:char;
begin
  fillchar(a,sizeof(a),2);
  for i:=1 to 32 do begin
    readln(c,y);
    x:=ord(c)-96;
    for d:=1 to 8 do
      if a[x+dx[d],y+dy[d]]+i and 1=1 then begin
        writeln(i);
        halt;
      end;
    a[x,y]:=i and 1;
  end;
  writeln('Draw');
end.
