program dinic;
const maxm=5000000;
      maxn=1000;
type edge=record
	 c,f,s,t,prev:longint;
     end;
var source,sink,ans,n,edgenum:longint;
    e:array[1..maxm] of edge;
    used:array[1..maxn] of boolean;
    last,lastbackup,pred,dist,q:array[1..maxn] of longint;

procedure insertedge(a,b,k:longint);
 begin
     inc(edgenum);
     with e[edgenum] do begin
	 s:=a; t:=b;
	 f:=0; c:=k;
	 prev:=last[s];
	 last[s]:=edgenum;
     end;
     inc(edgenum);
     with e[edgenum] do begin
	 s:=b; t:=a;
	 f:=0; c:=0;
	 prev:=last[s];
	 last[s]:=edgenum;
     end;
 end;

procedure initialize(a,b:longint);
 begin
     source:=a; sink:=b;
     edgenum:=0;
     fillchar(last,sizeof(last),0);
 end;

function opposite(k:longint):longint;
 begin
     if odd(k) then exit(k+1) else exit(k-1);
 end;

function setdistlabel:boolean;
 var cur,ptr,l,r:longint;
 begin
     setdistlabel:=false;
     fillchar(used,sizeof(used),false);
     l:=1; r:=2;
     q[1]:=source;
     used[source]:=true; dist[source]:=0;
     while l<r do begin
	 cur:=q[l];
	 inc(l);
	 ptr:=last[cur];
	 while ptr>0 do begin
	     with e[ptr] do begin
		 if (f<c) and (not used[t]) then begin
		     q[r]:=t; inc(r);
		     used[t]:=true; dist[t]:=dist[s]+1;
		     if used[sink] then setdistlabel:=true;
		 end;
		 ptr:=prev;
	     end;
	 end;
     end;
 end;

function findpath(cur:longint; var delta:longint):boolean;
 begin
     used[cur]:=true;
     findpath:=true;
     if cur=sink then exit;
     while last[cur]>0 do
	with e[last[cur]] do begin
	    if (dist[t]=dist[s]+1) and (not used[t]) and (f<c) then begin
		if findpath(t,delta) then begin
		    pred[t]:=last[cur];
		    if delta>c-f then delta:=c-f;
		    exit;
		end;
	    end;
	    last[cur]:=prev;
	end;
     findpath:=false;
 end;

procedure augment(delta:longint);
 var cur,ptr:longint;
 begin
     cur:=sink;
     ans:=ans+delta;
     repeat
	ptr:=pred[cur];
	with e[ptr] do begin
	    f:=f+delta;
	    e[opposite(ptr)].f:=e[opposite(ptr)].f-delta;
	    cur:=s;
	end;
     until cur=source;
 end;

procedure init;
 var i,x,y,k,m:longint;
 begin
     assign(input,'dinic.in'); reset(input);
     readln(m,n);
     initialize(1,n);
     for i:=1 to m do begin
	 readln(x,y,k);
	 insertedge(x,y,k);
     end;
     close(input);
 end;

procedure print;
 begin
     assign(output,'dinic.out'); rewrite(output);
     writeln(ans);
     close(output);
 end;

procedure main;
 var delta:longint;
 begin
     ans:=0;
     lastbackup:=last;
     while setdistlabel do begin
	 repeat
	    fillchar(used,sizeof(used),false);
	    delta:=maxlongint;
	    if not findpath(source,delta) then break;
	    augment(delta);
	 until false;
	 last:=lastbackup;
     end;
 end;

begin
    init;
    main;
    print;
end.