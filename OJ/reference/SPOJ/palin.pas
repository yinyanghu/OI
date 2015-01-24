//Written on 6107 -- Jan 14, 2005
program palin;
const
  maxl=1000000;
var
  a:array[1..maxl]of char;
  t,u,l,i:longint;
  all9:boolean;
function needinc:boolean;
  begin
    for i:=l shr 1 downto 1 do
      if a[i]<a[l+1-i] then begin
        needinc:=true;exit;
      end
      else if a[i]>a[l+1-i] then begin
        needinc:=false;exit;
      end;
    needinc:=true;
  end;
procedure inc1;
  begin
    i:=(l+1) shr 1;
    while a[i]='9' do begin
      a[i]:='0';dec(i);
    end;
    inc(a[i]);
  end;
begin
  readln(t);
  for u:=1 to t do begin
    l:=0;all9:=true;
    repeat
      inc(l);read(a[l]);if a[l]<'9' then all9:=false;
    until seekeoln;
    readln;

    if all9 then begin
      write('1');for i:=1 to l-1 do write('0');writeln('1');
    end
    else begin
      if needinc then inc1;
      for i:=1 to (l+1) shr 1 do write(a[i]);
      for i:=l shr 1 downto 1 do write(a[i]);
      writeln;
    end;
  end;
end.
