program dinic;
const limitsize=200;
      infinity=10000000;
var f:array[0..limitsize,0..limitsize] of longint;
    level:array[0..limitsize] of longint;
    queue:array[1..limitsize*10] of longint;
    source,sink,head,tail:longint;

procedure init;
 var i,x,y,k,m,n:longint;
 begin
     fillchar(f,sizeof(f),0);
     readln(m,n);
     source:=1; sink:=n;
     for i:=1 to m do begin
	 readln(x,y,k);
         inc(f[x,y],k);
     end;
 end;

function marklevel:boolean;
 var u,i:longint;
 begin
     fillchar(level,sizeof(level),255);
     head:=0; tail:=1; queue[1]:=source; level[source]:=0;
     while (head<tail) do begin
	 inc(head); u:=queue[head];
	 for i:=source to sink do
	    if (f[u,i]>0) and (level[i]<0) then begin
		level[i]:=level[u]+1;
		inc(tail); queue[tail]:=i;
	    end;
	if level[sink]>0 then break;
     end;
     marklevel:=level[sink]>0;
 end;

function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

function extendflow(u,delta:longint):longint;
 var d,flow,i:longint;
 begin
     if u=sink then exit(delta);
     flow:=0;
     for i:=source to sink do begin
	 if (f[u,i]>0) and (level[i]=level[u]+1) then begin
	     d:=extendflow(i,min(delta,f[u,i]));
	     if d>0 then begin
		 f[u,i]:=f[u,i]-d;
		 f[i,u]:=f[i,u]+d;
	 	 delta:=delta-d;
	 	 flow:=flow+d;
	     end;
	 end;
	 if delta=0 then break;
     end;
     extendflow:=flow;
 end;

procedure netflow;
 var flow,d:longint;
 begin
     flow:=0;
     while (marklevel) do begin
	 d:=extendflow(source,infinity);
	 while (d>0) do begin
	     flow:=flow+d;
	     d:=extendflow(source,infinity);
	 end;
     end;
     writeln(flow);
 end;

begin
    init;
    netflow;
end.
