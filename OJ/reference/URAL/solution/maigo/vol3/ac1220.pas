program ural1220;
const
  maxn=100000;
  stacks=1000;
var
  a:array[1..maxn]of longint;
  p:array[1..maxn]of word;
  last:array[1..stacks]of longint;
  n,i,s,v:longint;
  c:char;
begin
  readln(n);
  for i:=1 to n do begin
    read(c,c,c,c);
    case c of
      'H':begin
            readln(s,v);
            a[i]:=v shl 1+last[s] and 1;
            p[i]:=last[s] shr 1;
            last[s]:=i;
          end;
      ' ':begin
            readln(s);
            writeln(a[last[s]] shr 1);
            last[s]:=p[last[s]] shl 1+a[last[s]] and 1;
          end;
    end;
  end;
end.
