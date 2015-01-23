program p2135;
const maxn=10002;
      maxedge=50000;
      infinity=100000000;
type node=record
         s,t,cost,flow:longint;
     end;
var source,sink,maxcost,all,nodenum:longint;
    w:array[1..maxedge] of node;
    next:array[1..maxedge] of longint;
    start:array[1..maxn] of longint;

procedure addedge(s,t,flow,c:longint);
 begin
     inc(all);
     w[all].s:=s;
     w[all].t:=t;
     w[all].cost:=c;
     w[all].flow:=flow;
     next[all]:=start[s];
     start[s]:=all;
     inc(all);
     w[all].s:=t;
     w[all].t:=s;
     w[all].cost:=-c;
     w[all].flow:=0;
     next[all]:=start[t];
     start[t]:=all;
 end;

procedure initialize(fsource,fsink,fnodenum:longint);
 begin
     source:=fsource; sink:=fsink; nodenum:=fnodenum;
     fillchar(start,sizeof(start),0);
     all:=0;
 end;

procedure init;
 var i,n,m,cost,x,y:longint;
 begin
     readln(n,m);
     initialize(1,n+2,n+2);
     addedge(source,2,2,0);
     addedge(2,source,2,0);
     addedge(n+1,sink,2,0);
     addedge(sink,n+1,2,0);
     for i:=1 to m do begin
         readln(x,y,cost);
	 addedge(x+1,y+1,1,cost);
	 addedge(y+1,x+1,1,cost);
     end;
 end;

procedure netflow;
 var dist,pre,q,count,delta:array[1..maxn] of longint;
     flag:array[1..maxn] of boolean;
 function min(a,b:longint):longint;
  begin
      if a<b then min:=a else min:=b;
  end;
     
 function spfa:boolean;
  var l,r,p,k,i:longint;
  begin
      for i:=1 to nodenum do begin
          dist[i]:=infinity;
	  flag[i]:=false;
	  count[i]:=0;
      end;
      l:=0; r:=1; q[1]:=source; dist[source]:=0;
      pre[source]:=0; flag[source]:=true; count[source]:=1; delta[source]:=infinity;
      repeat
          inc(l); if l>maxn then l:=1;
          p:=q[l]; flag[p]:=false;
          k:=start[p];
	  while k<>0 do begin
              if (w[k].flow>0) and (dist[w[k].s]+w[k].cost<dist[w[k].t]) then begin
                  dist[w[k].t]:=dist[w[k].s]+w[k].cost;
                  pre[w[k].t]:=k;
		  delta[w[k].t]:=min(delta[w[k].s],w[k].flow);
                  if not flag[w[k].t] then begin
		      inc(count[w[k].t]);
		      if count[w[k].t]=nodenum then exit;
                      flag[w[k].t]:=true;
                      inc(r); if r>maxn then r:=1;
                      q[r]:=w[k].t;
                  end;
              end;
              k:=next[k];
          end;
      until l=r;
      spfa:=(dist[sink]<infinity);
  end;

 function opposite(x:longint):longint;
  begin
      if odd(x) then opposite:=x+1 else opposite:=x-1;
  end;
  
 procedure augpath;
  var k,p,curdelta:longint;
  begin
      k:=sink; curdelta:=delta[sink];
      inc(maxcost,dist[sink]*curdelta);
      repeat
          p:=pre[k];
          inc(w[opposite(p)].flow,curdelta);
          dec(w[p].flow,curdelta);
          k:=w[p].s;
      until k=source;
  end;

 begin
     maxcost:=0;
     while spfa do augpath;
     writeln(maxcost);
 end;

begin
    init;
    netflow;
end.
