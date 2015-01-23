program p3190;
const
	maxn = 50000;
	maxheap = 50000;
type
	cownode = record
		num,s,t:longint;
	end;
	heapnode = record
		key,num:longint;
	end;
var
	a:array[1..maxn] of cownode;
	heap:array[1..maxheap] of heapnode;
	stall:array[1..maxn] of longint;
	tot,heaptot,i,n:longint;

procedure sort(l,r:longint);
 var
	i,j:longint;
	x,y:cownode;
 begin
	i:=l; j:=r; x:=a[(l + r) shr 1];
	repeat
		while (a[i].s < x.s) or ((a[i].s = x.s) and (a[i].t < x.t)) do inc(i);
		while (a[j].s > x.s) or ((a[j].s = x.s) and (a[j].t > x.t)) do dec(j);
		if (i <= j) then begin
			y:=a[i]; a[i]:=a[j]; a[j]:=y;
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;

procedure swap(var a,b:heapnode);
 var
	k:heapnode;
 begin
	k:=a; a:=b; b:=k;
 end;

procedure insert(var t:longint; key,v:longint);
 var
	k:longint;
 begin
	inc(t);
	heap[t].key:=key; heap[t].num:=v;
	k:=t;
	while (k <> 1) and (heap[k shr 1].key > heap[k].key) do begin
		swap(heap[k shr 1],heap[k]);
		k:=k shr 1;
	end;
 end;

procedure delete(var t:longint);
 var
	s,k:longint;
 begin
	swap(heap[1],heap[t]);
	dec(t);
	k:=1; s:=1;
	while (k * 2 <= t) do begin
		if (k * 2 + 1 > t) or (heap[k * 2 + 1].key > heap[k * 2].key) then s:=k * 2 else s:=k * 2 + 1;
		if (heap[k].key > heap[s].key) then begin
			swap(heap[k],heap[s]);
			k:=s;
		end else break;
	end;
 end;

begin
	readln(n);
	for i:=1 to n do begin
		readln(a[i].s,a[i].t);
		a[i].num:=i;
	end;
	sort(1,n);
	tot:=0;
	heaptot:=0;
	for i:=1 to n do begin
		if (heaptot = 0) or (heap[1].key >= a[i].s) then begin
			inc(tot);
			stall[a[i].num]:=tot;
			insert(heaptot,a[i].t,tot);
		end else begin
			stall[a[i].num]:=heap[1].num;
			delete(heaptot);
			insert(heaptot,a[i].t,stall[a[i].num]);
		end;
	end;
	writeln(tot);
	for i:=1 to n do writeln(stall[i]);
end.