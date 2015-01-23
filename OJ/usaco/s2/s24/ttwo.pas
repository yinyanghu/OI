{
ID:lijianx1
PROG:ttwo
LANG:PASCAL
}
program ttwo;
const maxn=10;
      dx:array[1..4] of longint=(-1,0,1,0);
      dy:array[1..4] of longint=(0,1,0,-1);
type node=record
         x,y,k:longint;
     end;
var ans:longint;
    flag:array[1..maxn,1..maxn] of boolean;
    a:array[1..2] of node;
procedure init;
 var i,j:longint;
     ch:char;
 begin
     assign(input,'ttwo.in'); reset(input);
     fillchar(flag,sizeof(flag),true);
     for i:=1 to maxn do begin
         for j:=1 to maxn do begin
             read(ch);
             case ch of
                 'C':begin
                         a[1].x:=i; a[1].y:=j; a[1].k:=1;
                     end;
                 'F':begin
                         a[2].x:=i; a[2].y:=j; a[2].k:=1;
                     end;
                 '*':flag[i,j]:=false;
             end;
         end;
         readln;
     end;
     close(input);
 end;
 
procedure main;
 var i,x,y:longint;
 begin
     ans:=0;
     repeat
        for i:=1 to 2 do begin
            x:=a[i].x+dx[a[i].k];
            y:=a[i].y+dy[a[i].k];
            if (x>=1) and (x<=maxn) and (y>=1) and (y<=maxn) and (flag[x,y]) then begin
                a[i].x:=x; a[i].y:=y;
            end else a[i].k:=a[i].k mod 4+1;
        end;
        inc(ans);
     until ((a[1].x=a[2].x) and (a[1].y=a[2].y)) or (ans>160000);
     assign(output,'ttwo.out'); rewrite(output);
     if (a[1].x=a[2].x) and (a[1].y=a[2].y) then writeln(ans) else writeln(0);
     close(output);
 end;
 
begin
    init;
    main;
end.