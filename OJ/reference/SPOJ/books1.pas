//Written on 6138 -- Feb 14, 2005
program books1;
const
  range=500;
var
  book:array[1..range]of longint;
  slash:array[1..range-1]of boolean;
  t,u,m,k,i,c:word;
  l,r,x,s:int64;
procedure divide(x:int64);
  begin
    s:=book[m];c:=1;
    for i:=m-1 downto 1 do begin
      inc(s,book[i]);
      if s>x then begin
        slash[i]:=true;s:=book[i];inc(c);
      end
      else
        slash[i]:=false;
    end;
  end;
begin
  read(t);
  for u:=1 to t do begin
    read(m,k);
    l:=0;r:=0;
    for i:=1 to m do begin
      read(book[i]);
      if book[i]>l then l:=book[i];
      inc(r,book[i]);
    end;

    repeat
      x:=(l+r) shr 1;
      divide(x);
      if c>k then l:=x+1 else r:=x;
    until l=r;

    divide(l);i:=0;
    while c<k do begin
      repeat inc(i);until not slash[i];
      slash[i]:=true;inc(c);
    end;

    for i:=1 to m-1 do begin
      write(book[i],' ');
      if slash[i] then write('/ ');
    end;
    writeln(book[m]);
  end;
end.
