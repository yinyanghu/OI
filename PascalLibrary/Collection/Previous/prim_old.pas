program prim; //with heap
const
	maxn = 100;
	maxheap = maxn * 100;
	infinity = 1000000000;
type
	heapnode = record
		key,num:longint;
	end;
var
	heap:array[1..maxheap] of heapnode;
	a:array[1..maxn,1..maxn] of longint;
	flag:array[1..maxn] of boolean;
	f:array[1..maxn] of longint;
	size,n:longint;
procedure init;
 var
	i,j:longint;
 begin
	fillchar(a,sizeof(a),255);
	readln(n);
	for i:=1 to n do
		for j:=1 to n do read(a[i,j]);
	readln;
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
	ans,i,j,k:longint;
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
			for j:=1 to n do
				if (flag[j]) and (a[k,j] > 0) and (a[k,j] < f[j]) then begin
					f[j]:=a[k,j];
					insert(f[j],j);
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
