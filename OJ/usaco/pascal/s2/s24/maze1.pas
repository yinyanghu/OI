{
ID:lijianx1
PROG:maze1
LANG:PASCAL
}
program maze1;
const maxh=100;
      maxw=38;
      dx:array[1..4] of longint=(0,0,1,-1);
      dy:array[1..4] of longint=(1,-1,0,0);
type node=record
	 x,y:longint;
     end;
var a:array[1..2*maxh+1,1..2*maxw+1] of boolean;
    f:array[1..2*maxh+1,1..2*maxw+1] of longint;
    h,w:longint;
procedure init;
 var i,j:longint;
     ch:char;
 begin
     assign(input,'maze1.in'); reset(input);
     readln(w,h);
     h:=2*h+1; w:=2*w+1;
     for i:=1 to h do begin
	 for j:=1 to w do begin
	     read(ch);
	     if ch=' ' then a[i,j]:=true else a[i,j]:=false;
	 end;
          readln;
     end;
     close(input);
 end;
procedure bfs(x,y:longint);
 var i,l,r,xx,yy:longint;
     q:array[1..20000] of node;
     v:array[1..2*maxh+1,1..2*maxw+1] of boolean;
 begin
     l:=1; r:=1; f[x,y]:=1;
     fillchar(v,sizeof(v),true);
     q[l].x:=x; q[l].y:=y; v[x,y]:=false;
     while l<=r do begin
	 for i:=1 to 4 do begin
	     xx:=dx[i]+q[l].x;
	     yy:=dy[i]+q[l].y;
	     if (a[xx,yy]) and (v[xx,yy]) and (f[q[l].x,q[l].y]+1<f[xx,yy]) then begin
		 inc(r);
		 q[r].x:=xx; q[r].y:=yy;
		 f[xx,yy]:=f[q[l].x,q[l].y]+1;
		 v[xx,yy]:=false;
	     end;
	 end;
	 inc(l);
     end; 
 end;

procedure main;
 var i,j,max:longint;
 begin
     fillchar(f,sizeof(f),127);
     for i:=2 to h-1 do
	if a[i,1] then bfs(i,1);
     for i:=2 to h-1 do
	if a[i,w] then bfs(i,w);
     for i:=1 to w do
	if a[1,i] then bfs(1,i);
     for i:=1 to w do
	if a[h,i] then bfs(h,i);
     max:=0;
     for i:=1 to h do
	for j:=1 to w do 
	   if (i mod 2=0) and (j mod 2=0) and (f[i,j]>max) then max:=f[i,j];
     assign(output,'maze1.out'); rewrite(output);
     writeln(max div 2);
     close(output);
 end;

begin
    init;
    main;
end.