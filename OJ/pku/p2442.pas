program p2442;
const maxn=2000;
type node=record
	 key,x,y:longint;
     end;
var t,m,n,i,total,x,y,cur,p:longint;
    b:array[1..maxn] of longint;
    c:array[0..1,1..maxn] of longint;
    heap:array[1..maxn*maxn] of node;
    flag:array[1..maxn,1..maxn] of boolean;
procedure insert(var p:longint; s,xx,yy:longint);
 var t:longint;
     k:node;
 begin
     inc(p); t:=p;
     heap[t].key:=s; heap[t].x:=xx; heap[t].y:=yy;
     while (t<>1) and (heap[t shr 1].key>heap[t].key) do begin
         k:=heap[t shr 1]; heap[t shr 1]:=heap[t]; heap[t]:=k;
         t:=t shr 1;
     end;
 end;

function getmin(var p,xx,yy:longint):longint;
 var s,t:longint;
     k:node;
 begin
     getmin:=heap[1].key; xx:=heap[1].x; yy:=heap[1].y;
     k:=heap[1]; heap[1]:=heap[p]; heap[p]:=k;
     dec(p);
     t:=1; s:=1;
     while t*2<=p do begin
         if (t*2+1>p) or (heap[2*t+1].key>heap[2*t].key) then s:=2*t else s:=2*t+1;
         if heap[t].key>heap[s].key then begin
            k:=heap[t]; heap[t]:=heap[s]; heap[s]:=k;
            t:=s;
         end else break;
     end;
 end;

procedure sort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=b[(l+r) shr 1];
     repeat
        while b[i]<x do inc(i);
	while b[j]>x do dec(j);
	if i<=j then begin
	    y:=b[i]; b[i]:=b[j]; b[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then sort(l,j);
     if i<r then sort(i,r);
 end;
 
procedure csort(l,r:longint);
 var i,j,x,y:longint;
 begin
     i:=l; j:=r; x:=c[0,(l+r) shr 1];
     repeat
        while c[0,i]<x do inc(i);
	while c[0,j]>x do dec(j);
	if i<=j then begin
	    y:=c[0,i]; c[0,i]:=c[0,j]; c[0,j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then csort(l,j);
     if i<r then csort(i,r);
 end;
 
begin
    readln(t);
    while t>0 do begin
        dec(t);
	readln(m,n);
	for i:=1 to n do read(c[0,i]);
	csort(1,n);
	if m=1 then begin
	    for i:=1 to n-1 do write(c[0,i],' ');
	    writeln(c[0,n]);
	end else begin
	    cur:=0;
	    for p:=1 to m-1 do begin
		fillchar(flag,sizeof(flag),true);
                for i:=1 to n do read(b[i]);
		sort(1,n);
	        total:=0; insert(total,c[cur,1]+b[1],1,1);
	        for i:=1 to n do begin
		    c[1-cur,i]:=getmin(total,x,y);
	   	    if (x+1<=n) and (flag[x+1,y]) then begin
			flag[x+1,y]:=false;
			insert(total,c[cur,x+1]+b[y],x+1,y);
		    end;
		    if (y+1<=n) and (flag[x,y+1]) then begin
		        flag[x,y+1]:=false;
		        insert(total,c[cur,x]+b[y+1],x,y+1);
		    end;
	        end;
	        cur:=1-cur;
	    end;
	    for i:=1 to n-1 do write(c[cur,i],' '); writeln(c[cur,n]);
	end;
    end;
end.
