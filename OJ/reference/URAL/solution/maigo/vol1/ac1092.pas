program ural1092;
const
  maxn=41;
var
  map:array[1..maxn,1..maxn]of boolean;
  n,i,j,x:byte;
  c:char;
  o:boolean;
procedure switch(x1,x2,y1,y2:byte);
  var
    i:byte;
  begin
    map[x1,y1]:=not map[x1,y1];
    map[x1,y2]:=not map[x1,y2];
    map[x2,y1]:=not map[x2,y1];
    map[x2,y2]:=not map[x2,y2];
    for i:=1 to n do begin
      if i=x1 then write(y1) else if i=x2 then write(y2)
        else if i=y1 then write(x1) else if i=y2 then write(x2)
        else write(i);
      if i=n then writeln else write(' ');
    end;
    for i:=1 to n do begin
      if i=x1 then write(y2) else if i=x2 then write(y1)
        else if i=y1 then write(x1) else if i=y2 then write(x2)
        else write(i);
      if i=n then writeln else write(' ');
    end;
  end;
begin
  read(n);n:=n*2+1;
  for i:=1 to n do begin
    readln;
    for j:=1 to n do begin
      read(c);
      map[i,j]:=c='+';
      o:=o xor map[i,j];
    end;
  end;

  writeln('There is solution:');
  if o then begin
    for i:=1 to n-1 do begin
      write(i,' ');
      map[i,i]:=not map[i,i];
    end;
    writeln(n);map[n,n]:=not map[n,n];
  end;

  for i:=n downto 3 do begin
    x:=0;
    for j:=1 to i-1 do
      if map[i,j] then
        if x=0 then
          x:=j
        else begin
          switch(1,i,x,j);
          x:=0;
        end;
    if x>0 then begin switch(1,i,x,i);x:=0;end;
    for j:=1 to i-1 do
      if map[j,i] then
        if x=0 then
          x:=j
        else begin
          switch(x,j,1,i);
          x:=0;
        end;
    if (x>0) and map[i,i] then switch(x,i,1,i);
  end;
  if ord(map[1,1])+ord(map[1,2])+ord(map[2,1])+ord(map[2,2])>2 then switch(1,2,1,2);
end.
