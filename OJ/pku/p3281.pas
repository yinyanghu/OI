program p3281;
const maxn=402;
      infinity=1000000000;
type point=^node;
     node=record
         u,remain:longint;
	 next,inv:point;
     end;
var head,tail,source,sink:longint;
    edgelist,pointer:array[1..maxn] of point;
    queue,level:array[1..maxn] of longint;
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
 var n,d,f,a,b,k,i,j:longint;
 begin
     readln(n,f,d);
     source:=1; sink:=f+d+2*n+2;
     for i:=1 to f do addedge(source,i+1,1);
     for i:=1 to d do addedge(i+f+2*n+1,sink,1);
     for i:=1 to n do addedge(i+f+1,i+f+n+1,1);
     for i:=1 to n do begin
         read(a,b);
	 for j:=1 to a do begin
	     read(k);
	     addedge(k+1,f+1+i,1);
	 end;
	 for j:=1 to b do begin
	     read(k);
	     addedge(n+f+i+1,2*n+f+1+k,1);
	 end;
	 readln;
     end;
 end;
 
function marklevel:boolean;
 var u,i:longint;
     p:point;
 begin
     fillchar(level,sizeof(level),255);
     head:=0; tail:=1; queue[1]:=source;
     level[source]:=0;
     for i:=source to sink do pointer[i]:=edgelist[i];
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
	if level[sink]>0 then break;
     end;
     marklevel:=level[sink]>0;
 end;
 
function min(a,b:longint):longint;
 begin
     if a<b then min:=a else min:=b;
 end;
 
function extendflow(u,delta:longint):longint;
 var p:point;
     d,flow:longint;
 begin
     if u=sink then exit(delta);
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
