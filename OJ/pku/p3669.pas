program p3669;
const maxn=400;
      maxqueue=100000;
      infinity=1000000000;
type node=record
	 x,y,t:longint;
     end;
var a:array[0..maxn,0..maxn] of longint;
    flag:array[0..maxn,0..maxn] of boolean;
    q:array[1..maxqueue] of node;
    m,final,ans,i,j,x,y,k:longint;
procedure bfs;
 var head,tail,xx,yy:longint;
 begin
     fillchar(flag,sizeof(flag),true);
     head:=0; tail:=1; q[1].x:=0; q[1].y:=0; q[1].t:=0;
     while head<>tail do begin
         inc(head); if head>maxqueue then head:=1;
         xx:=q[head].x; yy:=q[head].y;
         if flag[xx,yy] then flag[xx,yy]:=false else continue;
	 if a[xx,yy]=infinity then begin
	     ans:=q[head].t;
	     exit;
	 end;
	 if (flag[xx+1,yy]) and (a[xx+1,yy]>q[head].t+1) then begin
             inc(tail); if tail>maxqueue then tail:=1;
	     q[tail].x:=xx+1; q[tail].y:=yy; q[tail].t:=q[head].t+1;
	 end;
	 if (xx-1>=0) and (flag[xx-1,yy]) and (a[xx-1,yy]>q[head].t+1) then begin
             inc(tail); if tail>maxqueue then tail:=1;
	     q[tail].x:=xx-1; q[tail].y:=yy; q[tail].t:=q[head].t+1;
	 end;
	 if (flag[xx,yy+1]) and (a[xx,yy+1]>q[head].t+1) then begin
             inc(tail); if tail>maxqueue then tail:=1;
	     q[tail].x:=xx; q[tail].y:=yy+1; q[tail].t:=q[head].t+1;
	 end;
	 if (yy-1>=0) and (flag[xx,yy-1]) and (a[xx,yy-1]>q[head].t+1) then begin
             inc(tail); if tail>maxqueue then tail:=1;
	     q[tail].x:=xx; q[tail].y:=yy-1; q[tail].t:=q[head].t+1;
	 end;
     end;
 end;

begin
    readln(m);
    for i:=0 to maxn do
	for j:=0 to maxn do a[i,j]:=infinity;
    final:=-1;
    for i:=1 to m do begin
        readln(x,y,k);
	if k>final then final:=k;
	if k<a[x,y] then a[x,y]:=k;
	if (x-1>=0) and (k<a[x-1,y]) then a[x-1,y]:=k;
	if (y-1>=0) and (k<a[x,y-1]) then a[x,y-1]:=k;
	if (k<a[x+1,y]) then a[x+1,y]:=k;
	if (k<a[x,y+1]) then a[x,y+1]:=k;
    end;
    ans:=-1;
    if a[0,0]=0 then begin
        writeln(ans);
	halt;
    end;
    bfs;
    writeln(ans);
end.
