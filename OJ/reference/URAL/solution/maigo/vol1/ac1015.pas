program ural1015;
const
  maxn=100000;
var
  last:array[2..3{top},2..6{left},2..6{right},2..6{bottom}]of longint;
  next:array[1..maxn]of longint;
  n,i,s,p,t:longint;
  left,right,top,front,bottom,back:byte;
begin
  fillchar(last,sizeof(last),0);
  fillchar(next,sizeof(next),0);
  s:=0;
  readln(n);
  for i:=1 to n do begin
    readln(left,right,top,front,bottom,back);

    if left=1 then begin
      left:=back;back:=right;right:=front;front:=1;
    end
    else if right=1 then begin
      right:=back;back:=left;left:=front;front:=1;
    end
    else if top=1 then begin
      top:=back;back:=bottom;bottom:=front;front:=1;
    end
    else if bottom=1 then begin
      bottom:=back;back:=top;top:=front;front:=1;
    end
    else if back=1 then begin
      back:=left;left:=right;right:=back;back:=front;front:=1;
    end;

    if back=2 then t:=3 else t:=2;
    if left=t then begin
      left:=bottom;bottom:=right;right:=top;top:=t;
    end
    else if right=t then begin
      right:=bottom;bottom:=left;left:=top;top:=t;
    end
    else if bottom=t then begin
      bottom:=left;left:=right;right:=bottom;bottom:=top;top:=t;
    end;

    if last[top,left,right,bottom]=0 then
      inc(s)
    else
      next[last[top,left,right,bottom]]:=i;
    last[top,left,right,bottom]:=i;
  end;

  writeln(s);
  for i:=1 to n do begin
    if next[i]=-1 then continue;
    p:=i;
    while next[p]>0 do begin
      write(p,' ');
      t:=next[p];
      next[p]:=-1;
      p:=t;
    end;
    writeln(p);
    next[p]:=-1;
  end;
end.
