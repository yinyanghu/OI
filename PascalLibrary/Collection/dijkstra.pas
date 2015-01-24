program dijkstra; //with heap & edgelist
const
	maxn = 100;
	maxheap = maxn * 100;
	maxedge = 10000;
	infinity = 1000000000;
type
	heapnode = record
		key,num:longint;
	end;
	edgenode = record
		v,key:longint;
		next:longint;
	end;
var
	edge:array[1..maxedge] of edgenode;
	start:array[1..maxn] of longint;
	
	heap:array[1..maxheap] of heapnode;
	f:array[1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	size,n,source,edgenum:longint;

procedure edge_insert(x,y,key:longint);
 begin
 	inc(edgenum);
 	edge[edgenum].v:=y;
 	edge[edgenum].key:=key;
 	edge[edgenum].next:=start[x];
 	start[x]:=edgenum;
 end;
	
procedure init;
 var
	i,m,x,y,key:longint;
 begin
	readln(n,m);
	edgenum:=0;
	for i:=1 to m do begin
		readln(x,y,key);
		edge_insert(x,y,key);
	end;
	readln(source);
 end;

procedure swap(var a,b:heapnode);
 var
	k:heapnode;
 begin
	k:=a; a:=b; b:=k;
 end;

procedure insert(key,num:longint);
 var
	k:longint;
 begin
	inc(size);
	heap[size].key:=key; heap[size].num:=num;
	k:=size;
	while (k > 1) do begin
		if (heap[k shr 1].key <= heap[k].key) then break;
		swap(heap[k shr 1],heap[k]);
		k:=k shr 1;
	end;
 end;
 
function getmin:longint;
 var
	i,j:longint;
 begin
	getmin:=heap[1].num;
	swap(heap[1],heap[size]);
	dec(size);
	i:=1;
	while (i shl 1 <= size) do begin
		j:=i shl 1;
		if (j < size) and (heap[j + 1].key < heap[j].key) then inc(j);
		if (heap[j].key >= heap[i].key) then break;
		swap(heap[i],heap[j]);
		i:=j;
	end;
 end;

procedure main;
 var
	i,p,k:longint;
 begin
	size:=0;
	for i:=1 to n do begin
		flag[i]:=true;
		f[i]:=infinity;
	end;
	f[source]:=0; insert(f[source],source);
	for i:=1 to n - 1 do begin
		repeat
			k:=getmin;
		until (flag[k]) or (size = 0);
		if (flag[k]) then begin
			flag[k]:=false;
			p:=start[k];
			while (p > 0) do begin
				if (flag[edge[p].v]) and (f[k] + edge[p].key < f[edge[p].v]) then begin
					f[edge[p].v]:=f[k] + edge[p].key;
					insert(f[edge[p].v],edge[p].v);
				end;
				p:=edge[p].next;
			end;
		end;
		if (size = 0) then break;
	end;
 end;
 
procedure print;
 var
	i:longint;
 begin
	for i:=1 to n do writeln(source,' ---> ',i,'   Dist = ',f[i]);
 end;
 
begin
	init;
	main;
	print;
end.
