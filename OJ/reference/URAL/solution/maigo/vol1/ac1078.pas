program ural1078;
const
  maxn=499;
var
  seg:array[0..maxn,1..2]of integer;
  indeg,pre:array[1..maxn]of integer;
  q,dep:array[0..maxn]of integer;
  n,i,j,front,rear:integer;
function nest(a,b:integer):boolean;{True if a contains b}
  begin
    nest:=(seg[a,1]<seg[b,1]) and (seg[a,2]>seg[b,2]);
  end;
begin
  readln(n);
  for i:=1 to n do
    readln(seg[i,1],seg[i,2]);
  seg[0,1]:=-10001;seg[0,2]:=10001;

  for i:=1 to n do
    indeg[i]:=1;
  for i:=1 to n do
    for j:=1 to n do
      if nest(i,j) then inc(indeg[j]);

  front:=-1;rear:=0;q[0]:=0;dep[0]:=0;
  repeat
    inc(front);
    for i:=1 to n do
      if nest(q[front],i) then begin
        dec(indeg[i]);
        if indeg[i]=0 then begin
          inc(rear);
          q[rear]:=i;
          pre[q[rear]]:=q[front];
          dep[rear]:=dep[front]+1;
        end;
      end;
  until front=rear;

  writeln(dep[rear]);
  i:=q[rear];
  while pre[i]>0 do begin
    write(i,' ');
    i:=pre[i];
  end;
  writeln(i);
end.
