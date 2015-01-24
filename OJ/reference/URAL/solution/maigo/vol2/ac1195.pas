program ural1195;
const
  charset='XO#';
var
  map:array[1..9]of char;
  i,j,k,t:byte;
procedure winX;
  begin
    writeln('Crosses win');
    halt;
  end;
procedure winO;
  begin
    writeln('Ouths win');
    halt;
  end;
function win(c:char):boolean;
  function line(x,y,z:byte):boolean;
    begin
      line:=(map[x]=c) and (map[y]=c) and (map[z]=c);
    end;
  begin
    win:=line(1,2,3) or line(4,5,6) or line(7,8,9) or
         line(1,4,7) or line(2,5,8) or line(3,6,9) or
         line(1,5,9) or line(3,5,7);
  end;
begin
  for i:=1 to 9 do
    repeat
      read(map[i]);
    until pos(map[i],charset)>0;

  i:=1;while map[i]<>'#' do inc(i);
  j:=i+1;while map[j]<>'#' do inc(j);
  k:=j+1;while map[k]<>'#' do inc(k);

  map[i]:='X';if win('X') then winX;map[i]:='#';
  map[j]:='X';if win('X') then winX;map[j]:='#';
  map[k]:='X';if win('X') then winX;map[k]:='#';

  t:=0;
  map[i]:='O';if win('O') then inc(t);map[i]:='#';
  map[j]:='O';if win('O') then inc(t);map[j]:='#';
  map[k]:='O';if win('O') then inc(t);map[k]:='#';
  if t>=2 then winO;

  t:=0;
  map[i]:='X';map[j]:='X';map[k]:='O';if win('X') and not win('O') then inc(t);
  map[j]:='O';map[k]:='X';if win('X') and not win('O') then inc(t);
  map[i]:='O';map[j]:='X';if win('X') and not win('O') then inc(t);
  if t>=2 then winX;

  writeln('Draw');
end.
