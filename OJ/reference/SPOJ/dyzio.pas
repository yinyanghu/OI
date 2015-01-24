//Written on 6182 -- Mar 30, 2005
program dyzio;
const
  tests=10;
  maxdepth=10000;
var
  s:array[1..maxdepth]of byte;
  u,n,i,depth,count,ansd,ansc:word;
  c:char;
begin
  for u:=1 to tests do begin
    readln(n);depth:=1;s[1]:=0;count:=0;ansd:=0;ansc:=0;
    for i:=1 to n do begin
      read(c);inc(s[depth]);
      case c of
        '0':begin
              if depth>ansd then begin
                ansd:=depth;ansc:=count;
              end;
              while s[depth]=2 do dec(depth);
            end;
        '1':begin
              inc(depth);
              s[depth]:=0;
              inc(count);
            end;
      end;
    end;
    writeln(ansc);
  end;
end.
