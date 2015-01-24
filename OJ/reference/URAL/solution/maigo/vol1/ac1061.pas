program ural1061;
const
  maxn=100000;
var
  b:array[1..maxn]of char;
  n,k,i,min,l,p,s:longint;
begin
  readln(n,k);
  if n<k then begin
    writeln('0');
    halt;
  end;

  min:=maxlongint;l:=0;p:=0;s:=0;
  for i:=1 to n do begin
    read(b[i]);
    if eoln then readln;
    if b[i]='*' then begin
      p:=i;
      s:=0;
    end
    else begin
      inc(s,ord(b[i])-48);
      if i-p=k then begin
        inc(p);
        if s<min then begin
          min:=s;
          l:=p;
        end;
        dec(s,ord(b[p])-48);
      end;
    end;
  end;

  writeln(l);
end.
