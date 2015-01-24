program ural1306;
const
  maxn=250000;
var
  heap:array[1..maxn shr 1+2]of cardinal;
  n,i,x,h:cardinal;
  ans:real;
procedure ins(x:cardinal);
  var
    p,t:cardinal;
  begin
    inc(h);
    heap[h]:=x;
    p:=h;
    while (p>1) and (heap[p]<heap[p shr 1]) do begin
      t:=heap[p];heap[p]:=heap[p shr 1];p:=p shr 1;heap[p]:=t;
    end;
  end;
procedure del;
  var
    p,l,r,t:cardinal;
  begin
    heap[1]:=heap[h];
    dec(h);
    p:=1;
    repeat
      l:=p shl 1;r:=l+1;
      if (l<h) and (heap[r]<heap[p]) and (heap[r]<heap[l]) then begin
        t:=heap[p];heap[p]:=heap[r];p:=r;heap[p]:=t;
      end
      else if (l<=h) and (heap[l]<heap[p]) then begin
        t:=heap[p];heap[p]:=heap[l];p:=l;heap[p]:=t;
      end
      else
        break;
    until false;
  end;
begin
  read(n);
  for i:=1 to n shr 1+1 do begin
    read(x);
    ins(x);
  end;
  for i:=n shr 1+2 to n do begin
    read(x);
    ins(x);
    del;
  end;

  ans:=heap[1];
  if not odd(n) then begin
    if (h=2) or (heap[2]<heap[3]) then ans:=ans+heap[2] else ans:=ans+heap[3];
    ans:=ans/2;
  end;
  writeln(ans:0:1);
end.
