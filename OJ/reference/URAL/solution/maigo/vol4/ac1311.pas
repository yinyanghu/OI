program ural1311;
const
  maxk=1000;
type
  centre=record numer,denom:qword;end;
  centrelist=array[1..maxk]of centre;
var
  list:array[0..1]of centrelist;
  len:array[0..1]of word;
  h,k,i,j,l,r,p:word;
  now,pre:byte;
procedure fail;
  begin
    writeln('No');
    halt;
  end;
begin
  read(h);
  for i:=1 to h do begin
    now:=i mod 2;pre:=1-now;
    read(k);
    len[now]:=0;
    p:=1;
    for j:=1 to k do begin
      read(l,r);l:=l shl 1;r:=r shl 1;
      if (p<=len[pre]) and (list[pre,p].numer<=list[pre,p].denom*l) then fail;
      inc(len[now]);
      with list[now,len[now]] do begin denom:=r-l;numer:=(r+l) div 2*denom;end;
      while (p<=len[pre]) and (list[pre,p].numer<list[pre,p].denom*r) do begin
        inc(list[now,len[now]].numer,list[pre,p].numer);
        inc(list[now,len[now]].denom,list[pre,p].denom);
        inc(p);
      end;
    end;
    if p<=len[pre] then fail;
  end;
  writeln('Yes');
end.
