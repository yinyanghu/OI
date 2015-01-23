program p2395;
const maxn=2000;
      maxsize=2000;
      infinity=maxlongint;
type node=record
         dist,num:longint;
     end;
     edgenode=record
         size:longint;
	 w:array[1..maxsize,1..2] of longint;
     end;
var a:array[1..maxn] of edgenode;
    dist:array[1..maxn] of longint;
    flag:array[1..maxn] of boolean;
    heap:array[1..maxn*10] of node;
    i,k,x,y,min,max,left,right,mid,n,m:longint;

procedure insert(var p:longint; s,v:longint);
 var t:longint;
     k:node;
 begin
     inc(p);
     t:=p;
     heap[t].dist:=s; heap[t].num:=v;
     while (t<>1) and (heap[t div 2].dist>heap[t].dist) do begin
         k:=heap[t div 2]; heap[t div 2]:=heap[t]; heap[t]:=k;
         t:=t div 2;
     end;
 end;

function getmin(var p:longint):longint;
 var t,s:longint;
     k:node;
 begin
     getmin:=heap[1].num;
     k:=heap[1]; heap[1]:=heap[p]; heap[p]:=k;
     dec(p);
     t:=1;
     while t*2<=p do begin
         if (t*2+1>p) or (heap[2*t+1].dist>heap[2*t].dist) then s:=2*t
           else s:=2*t+1;
         if heap[t].dist>heap[s].dist then begin
            k:=heap[t]; heap[t]:=heap[s]; heap[s]:=k;
            t:=s;
         end else break;
     end;
 end;

function check(limit:longint):boolean;
 var i,j,k,ans,total:longint;
 begin
     for i:=1 to n do begin
         dist[i]:=infinity;
	 flag[i]:=true;
     end;
     total:=0;
     dist[1]:=0; ans:=0; insert(total,dist[1],1);
     for i:=1 to n do begin
         repeat
              k:=getmin(total);
	 until (flag[k]=true) or (total=0);
	 if flag[k] then begin
             flag[k]:=false; inc(ans);
             for j:=1 to a[k].size do
                 if (flag[a[k].w[j,1]]) and (a[k].w[j,2]<=limit) and (a[k].w[j,2]<dist[a[k].w[j,1]]) then begin
	             dist[a[k].w[j,1]]:=a[k].w[j,2];
		     insert(total,dist[a[k].w[j,1]],a[k].w[j,1]);
	         end;
	 end;
	 if total=0 then break;
     end;
     check:=ans=n;
 end;

begin
    readln(n,m);
    for i:=1 to n do a[i].size:=0;
    max:=-1; min:=maxlongint;
    for i:=1 to m do begin
	readln(x,y,k);
	if k>max then max:=k;
	if k<min then min:=k;
	inc(a[x].size); a[x].w[a[x].size,1]:=y; a[x].w[a[x].size,2]:=k;
	inc(a[y].size); a[y].w[a[y].size,1]:=x; a[y].w[a[y].size,2]:=k;
    end;
    left:=min; right:=max;
    while left<=right do begin
        mid:=(left+right) shr 1;
	if check(mid) then right:=mid-1 else left:=mid+1;
    end;
    writeln(left);
end.
