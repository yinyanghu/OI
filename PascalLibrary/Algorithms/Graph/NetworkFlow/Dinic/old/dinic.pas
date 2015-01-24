program dinic;
const limitsize=1000;
      infinity=10000000;
type point=^node;
     node=record
	 u,remain:longint;
	 next,inv:point;
     end;
var head,tail,s,t:longint;
    edgelist,pointer:array[1..limitsize] of point;
    queue,level:array[1..limitsize] of longint;
procedure addedge(a,b,cap:longint);
 var p,q:point;
 begin
     new(p); new(q);
     p^.u:=b; p^.remain:=cap; p^.inv:=q;
     p^.next:=edgelist[a]; edgelist[a]:=p;
     q^.u:=a; q^.remain:=0; q^.inv:=p;
     q^.next:=edgelist[b]; edgelist[b]:=q;
 end;

procedure init;
 var i,a,b,cap,n,m:longint;
 begin
     readln(m,n);
     s:=1; t:=n;
     for i:=s to t do edgelist[i]:=nil;
     for i:=1 to m do begin
         readln(a,b,cap);
	 addedge(a,b,cap);
     end;
 end;

function marklevel:boolean;
 var u,i:longint;
     p:point;
 begin
     fillchar(level,sizeof(level),255);
     head:=0; tail:=1; queue[1]:=s;
     level[s]:=0;
     for i:=s to t do pointer[i]:=edgelist[i];
     while (head<tail) do begin
	inc(head); u:=queue[head];
	p:=edgelist[u];
	while (p<>nil) do begin
	    if (p^.remain>0) and (level[p^.u]<0) then begin
	        level[p^.u]:=level[u]+1;
	        inc(tail); queue[tail]:=p^.u;
	    end;
            p:=p^.next;
        end;
	if level[t]>0 then break;
     end;
     marklevel:=level[t]>0;
 end;

function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;

function extendflow(u,delta:longint):longint;
 var p:point;
     d,flow:longint;
 begin
     if u=t then exit(delta);
     p:=pointer[u]; flow:=0;
     while (p<>nil) do begin
         if (p^.remain>0) and (level[p^.u]=level[u]+1) then begin
	     d:=extendflow(p^.u,min(delta,p^.remain));
	     if d>0 then begin
	         p^.remain:=p^.remain-d;
	         p^.inv^.remain:=p^.inv^.remain+d;
	         delta:=delta-d;
		 flow:=flow+d;
	     end;
	 end;
	 if delta=0 then break;
         p:=p^.next;
     end;
     extendflow:=flow;
 end;

procedure netflow;
 var flow,d:longint;
 begin
     flow:=0;
     while (marklevel) do begin
	 d:=extendflow(s,infinity);
	 while (d>0) do begin
	     flow:=flow+d;
	     d:=extendflow(s,infinity);
	 end;
     end;
     writeln(flow);
 end;

begin
    init;
    netflow;
end.

