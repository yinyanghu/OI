program area;
const d:array[0..1,1..4] of integer=((0,1,0,-1),(-1,0,1,0));
var q:array[0..1,1..100] of integer;
    a:array[1..10,1..10] of 0..2;
    sum,n,i,j,k,tail,start,x,y:longint;
begin
    assign(input,'area.in'); reset(input);
    assign(output,'area.out'); rewrite(output);
    readln(n);
    sum:=0;
    for i:=1 to n do
      for j:=1 to n do begin
          read(a[i,j]);
          if a[i,j]>0 then inc(sum);
      end;
    x:=1; y:=5; start:=1; tail:=1;
    q[0,1]:=y; a[1,1]:=2;
    repeat
       for i:=1 to 4 do begin
           x:=q[0,start]+d[0,i];
           y:=q[1,start]+d[1,i];
           if (x>0) and (x<=n) and (y>0) and (y<=n) then
             if a[x,y]=0 then begin
                 inc(tail);
                 a[x,y]:=2;
                 q[0,tail]:=x;
                 q[1,tail]:=y;
             end;
       end;
       inc(start);
    until start>tail;
    writeln('Area=',n*n-sum-tail);
    close(input);
    close(output);
end.
