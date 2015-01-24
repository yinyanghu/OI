program dijkstra; //with heap
const
	maxn = 100;
	maxheap = maxn * 100;
	infinity = 1000000000;
type
	heapnode = record
		key,num:longint;
	end;
var
	a:array[1..maxn,1..maxn] of longint;
	heap:array[1..maxheap] of heapnode;
	f:array[1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	size,n,start:longint;
	
procedure init;
 var
	i,j:longint;
 begin
	fillchar(a,sizeof(a),255);
	readln(n);
	for i:=1 to n do
		for j:=1 to n do read(a[i,j]);
	readln(start);
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
	i,j,k:longint;
 begin
	size:=0;
	for i:=1 to n do begin
		flag[i]:=true;
		f[i]:=infinity;
	end;
	f[start]:=0; insert(f[start],start);
	for i:=1 to n - 1 do begin
		repeat
			k:=getmin;
		until (flag[k]) or (size = 0);
		if (flag[k]) then begin
			flag[k]:=false;
			for j:=1 to n do
				if (flag[j]) and (a[k,j] > 0) and (f[k] + a[k,j] < f[j]) then begin
					f[j]:=f[k] + a[k,j];
					insert(f[j],j);
				end;
		end;
		if (size = 0) then break;
	end;
 end;
 
procedure print;
 var
	i:longint;
 begin
	for i:=1 to n do writeln(start,' ---> ',i,'   Dist = ',f[i]);
 end;
 
begin
	init;
	main;
	print;
end.
