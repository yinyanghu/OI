program migong;
const d:array[1..4,1..2] of -1..1=((1,0),(0,1),(-1,0),(0,-1));
var a:array[1..1000,1..1000] of 0..3;
    x1,y1,x2,y2,n:integer;
    i,j,total:integer;
procedure print;
 var i,j:integer;
 begin
     for i:=1 to n do begin
         for j:=1 to 8 do begin
             if a[i,j]=1 then write(#219);
             if a[i,j]=2 then write(' ');
             if a[i,j]=3 then write(#03);
             if a[i,j]=0 then write(' ');
         end;
         writeln;
     end;
     writeln;
     inc(total);
 end;

function ok(x,y,i:integer):boolean;
 var xx,yy:integer;
 begin
     ok:=true;
     xx:=x+d[i,1];
     yy:=y+d[i,2];
     if not ((xx in [1..8]) and (yy in [1..8])) then ok:=false;
     if a[xx,yy]=3 then ok:=false;
     if a[xx,yy]=1 then ok:=false;
 end;

procedure try(x,y:integer);
 var i,xx,yy:integer;
 begin
     for i:=1 to 4 do begin
         if ok(x,y,i) then begin
             xx:=x+d[i,1];
             yy:=y+d[i,2];
             a[xx,yy]:=3;
             if (xx=x2) and (yy=y2) then print
               else try(xx,yy);
             a[xx,yy]:=2;
         end;
     end;
 end;

begin
    assign(input,'migong.in'); reset(input);
    assign(output,'migong.out'); rewrite(output);
    total:=0;
    readln(n);
    for i:=1 to n do
      for j:=1 to n do read(a[i,j]);
    readln(x1,y1,x2,y2);
    a[x1,y1]:=3;
    try(x1,y1);
    writeln('Total=',total);
    close(input);
    close(output);
end.
