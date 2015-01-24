program ural1060;
var
  v:array[0..65535]of boolean;
  q:array[0..65535]of word;
  l:array[0..65535]of byte;
  map:array[1..4,1..4]of boolean;
  front,rear,s:word;
  i,j,x,y:byte;
  c:char;
procedure flip(x,y:byte);
  begin
    if (x>0) and (x<5) and (y>0) and (y<5) then
      map[x,y]:=not map[x,y];
  end;
begin
  q[0]:=0;
  for i:=1 to 4 do begin
    for j:=1 to 4 do begin
      read(c);
      q[0]:=q[0]*2;
      if c='b' then inc(q[0]);
    end;
    readln;
  end;

  fillchar(v,sizeof(v),0);
  front:=0;rear:=0;v[q[0]]:=true;l[q[0]]:=0;
  repeat
    for i:=1 to 4 do
      for j:=1 to 4 do begin
        s:=q[front];
        for x:=4 downto 1 do
          for y:=4 downto 1 do begin
            map[x,y]:=odd(s);
            s:=s div 2;
          end;
        flip(i,j);flip(i-1,j);flip(i+1,j);flip(i,j-1);flip(i,j+1);
        s:=0;
        for x:=1 to 4 do
          for y:=1 to 4 do
            s:=s*2+ord(map[x,y]);
        if not v[s] then begin
          v[s]:=true;
          inc(rear);
          q[rear]:=s;
          l[s]:=l[q[front]]+1;
        end;
      end;
    inc(front);
  until (front>rear) or v[0] or v[65535];

  if front>rear then
    writeln('Impossible')
  else
    if v[0] then writeln(l[0]) else writeln(l[65535]);
end.
