program ural1028;
const
  maxn=15000;
  maxa=32767;
  root=maxa shr 1+1;
var
  sum:array[1..maxa]of word;
  lv:array[0..maxn-1]of word;
  n,i,x,y:word;
function less(x:word):word;
  var
    p,d,c:word;
  begin
    c:=0;p:=root;d:=root shr 1;
    while p<>x do begin
      if p<x then begin
        inc(c,sum[p]-sum[p+d]);
        inc(sum[p]);
        inc(p,d);
      end
      else begin
        inc(sum[p]);
        dec(p,d);
      end;
      d:=d shr 1;
    end;
    if odd(p) then inc(c,sum[p]) else inc(c,sum[p]-sum[p+d]);
    inc(sum[p]);
    less:=c;
  end;
begin
  fillchar(sum,sizeof(sum),0);
  fillchar(lv,sizeof(lv),0);
  read(n);
  for i:=1 to n do begin
    read(x,y);{y is useless}
    y:=less(x+1);{0 is a danger}
    inc(lv[y]);
  end;
  for i:=0 to n-1 do
    writeln(lv[i]);
end.
