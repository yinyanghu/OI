program p3662;
const maxn=1000;
      maxk=1000;
      maxedge=50;
      infinity=1000000000;
type edgenode=record
	 w,key:array[1..maxedge] of longint;
	 num:longint;
     end;
var f:array[1..maxn,0..maxk] of longint;
    flag:array[1..maxn,0..maxk] of boolean;
    edge:array[1..maxn] of edgenode;
    n,p,k,i,j,a,b,free,x,findmin:longint;

function max(a,b:longint):longint;inline;
 begin
     if a>b then max:=a else max:=b;
 end;

function min(a,b:longint):longint;inline;
 begin
     if a<b then min:=a else min:=b;
 end;

begin
    readln(n,p,free);
    for i:=1 to n do edge[i].num:=0;
    for i:=1 to p do begin
	readln(a,b,k);
	inc(edge[b].num);
	edge[b].w[edge[b].num]:=a;
	edge[b].key[edge[b].num]:=k;
	inc(edge[a].num);
	edge[a].w[edge[a].num]:=b;
	edge[a].key[edge[a].num]:=k;
    end;
    fillchar(f,sizeof(f),$7F);
    fillchar(flag,sizeof(flag),true);
    for i:=0 to free do f[1,i]:=0;
    for i:=1 to n do
	for j:=0 to free do begin
	    findmin:=infinity;
	    for k:=1 to n do
		if (flag[k,j]) and (f[k,j]<findmin) then begin
		    findmin:=f[k,j]; x:=k;
		end;
	    if findmin=infinity then continue;
	    flag[x,j]:=false;
	    for k:=1 to edge[x].num do begin
	        f[edge[x].w[k],j]:=min(f[edge[x].w[k],j],max(f[x,j],edge[x].key[k]));
	        f[edge[x].w[k],j+1]:=min(f[edge[x].w[k],j+1],f[x,j]);
	    end;
	end;
    if f[n,free]>infinity then writeln(-1) else writeln(f[n,free]);
end.
