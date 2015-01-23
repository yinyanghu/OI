program blank;
const maxn=1024;
var a:array[1..maxn,1..maxn] of boolean;
    n,m,k,x,y:integer;

procedure init;
 var i:integer;
 begin
     assign(input,'blank.in'); reset(input);
     assign(output,'blank.out'); rewrite(output);
     readln(k);
     n:=1;
     for i:=1 to k do n:=n*2;
     fillchar(a,sizeof(a),true);
     readln(x,y);
     a[x,y]:=false;
     close(input);
 end;

function find(x1,y1,x2,y2:integer):integer;
 var i,j:integer;
 begin
     for i:=x1 to (x1+x2) div 2 do
       for j:=y1 to (y1+y2) div 2 do
         if not a[i,j] then exit(1)
           else if not a[x2-i+1,j] then exit(3)
             else if not a[i,y2-j+1] then exit(2)
               else if not a[x2-i+1,y2-j+1] then exit(4);

 end;

procedure work(x1,y1,x2,y2:integer);
 var i,j,s:integer;
 begin
     if x2-x1=1 then begin
         s:=0;
         for i:=x1 to x2 do
           for j:=y1 to y2 do begin
               inc(s);
               if not a[i,j] then
                 case s of
                     1:writeln(x2,' ',y2,' ',s);
                     2:writeln(x2,' ',y1,' ',s);
                     3:writeln(x1,' ',y2,' ',s);
                     4:writeln(x1,' ',y1,' ',s);
                 end;
           end;
     end else begin
         s:=find(x1,y1,x2,y2);
         case s of
             1:begin
                   a[(x1+x2) div 2+1,(y1+y2) div 2+1]:=false;
                   a[(x1+x2) div 2,(y1+y2) div 2+1]:=false;
                   a[(x1+x2) div 2+1,(y1+y2) div 2]:=false;
                   writeln((x1+x2) div 2+1,' ',(y1+y2) div 2+1,' ',1);
               end;
             2:begin
                   a[(x1+x2) div 2+1,(y1+y2) div 2]:=false;
                   a[(x1+x2) div 2,(y1+y2) div 2]:=false;
                   a[(x1+x2) div 2+1,(y1+y2) div 2+1]:=false;
                   writeln((x1+x2) div 2+1,' ',(y1+y2) div 2,' ',2);
               end;
             3:begin
                   a[(x1+x2) div 2,(y1+y2) div 2+1]:=false;
                   a[(x1+x2) div 2,(y1+y2) div 2]:=false;
                   a[(x1+x2) div 2+1,(y1+y2) div 2+1]:=false;
                   writeln((x1+x2) div 2,' ',(y1+y2) div 2+1,' ',3);
               end;
             4:begin
                   a[(x1+x2) div 2,(y1+y2) div 2]:=false;
                   a[(x1+x2) div 2,(y1+y2) div 2+1]:=false;
                   a[(x1+x2) div 2+1,(x1+x2) div 2]:=false;
                   writeln((x1+x2) div 2,' ',(y1+y2) div 2,' ',4);
               end;
         end;
         work(x1,y1,(x1+x2) div 2,(y1+y2) div 2);
         work(x1,(y1+y2) div 2+1,(x1+x2) div 2,y2);
         work((x1+x2) div 2+1,y1,x2,(y1+y2) div 2);
         work((x1+x2) div 2+1,(y1+y2) div 2+1,x2,y2);
     end;
 end;

begin
    init;
    work(1,1,n,n);
    close(output);
end.
