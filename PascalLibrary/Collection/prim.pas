program prim; //with heap & edgelist
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
	flag:array[1..maxn] of boolean;
	f:array[1..maxn] of longint;
	size,n,edgenum:longint;
	
procedure edge_insert(x,y,key:longint);
 begin
 	inc(edgenum);
 	edge[edgenum].v:=y;
 	edge[edgenum].key:=key;
 	edge[edgenum].next:=start[x];
 	start[x]:=edgenum;
 	
 	inc(edgenum);
 	edge[edgenum].v:=x;
 	edge[edgenum].key:=key;
 	edge[edgenum].next:=start[y];
 	start[y]:=edgenum;
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
		if (heap[i].key <= heap[j].key) then break;
		swap(heap[i],heap[j]);
		i:=j;
	end;
 end;
  
procedure main;
 var
	ans,i,p,k:longint;
 begin
	size:=0; ans:=0;
	for i:=1 to n do begin
		f[i]:=infinity;
		flag[i]:=true;
	end;
	f[1]:=0; insert(f[1],1);
	for i:=1 to n do begin
		repeat
			k:=getmin;
		until (flag[k]) or (size = 0);
		if (flag[k]) then begin
			flag[k]:=false;
			ans:=ans + f[k];
			p:=start[k];
			while (p > 0) do begin
				if (flag[edge[p].v]) and (edge[p].key < f[edge[p].v]) then begin
					f[edge[p].v]:=edge[p].key;
					insert(f[edge[p].v],edge[p].v);
				end;
				p:=edge[p].next;
			end;
		end;
		if (size = 0) then break;
	end;
	writeln(ans);	
 end;
 
begin
	init;
	main;
end.
