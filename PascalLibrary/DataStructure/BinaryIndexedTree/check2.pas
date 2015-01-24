program check;
const maxn=1000;
var a:array[1..maxn,1..maxn] of longint;
    i,j,k,m,n,total,x,y,x1,x2,y1,y2:longint;
    step:char;
procedure change(var a,b:longint);
 var k:longint;
 begin
     k:=a; a:=b; b:=k;
 end;

begin
    assign(input,'bitree2.in'); reset(input);
    assign(output,'test2.out'); rewrite(output);
    readln(n);
    for i:=1 to n do
      for j:=1 to n do read(a[i,j]);
    readln(m);
    for i:=1 to m do begin
        read(step);
        if step='M' then begin
            while step<>' ' do read(step);
            readln(x1,y1,k);
            a[x1,y1]:=k;
        end;
        if step='S' then begin
            while step<>' ' do read(step);
            readln(x1,y1,x2,y2);
            if x1>x2 then change(x1,x2);
            if y1>y2 then change(y1,y2);
            total:=0;
            for x:=x1 to x2 do
              for y:=y1 to y2 do total:=total+a[x,y];
            writeln(total);
        end;
    end;
    close(input);
    close(output);
end.