program p3268;
const
	maxn = 1000;
	infinity = 100000000;
type
	heapnode = record
		key,num:longint;
	end;
var
	n,w,heaptot:longint;
	a:array[1..maxn,1..maxn] of longint;
	f,g:array[1..maxn] of longint;
	heap:array[1..maxn] of heapnode;
	flag:array[1..maxn] of boolean;

procedure init;
 var
	i,x,y,len,m:longint;
 begin
	readln(n,m,w);
	fillchar(a,sizeof(a),255);
	for i:=1 to m do begin
		readln(x,y,len);
		if (a[x,y] = -1) or (a[x,y] > len) then a[x,y]:=len;
	end;
 end;

procedure swap(var a,b:heapnode);
 var
	k:heapnode;
 begin
	k:=a; a:=b; b:=k;
 end;

procedure insert(var t:longint; key,v:longint);
 var
	p:longint;
 begin
	inc(t);
	heap[t].key:=key; heap[t].num:=v;
	p:=t;
	while (p <> 1) and (heap[p shr 1].key > heap[p].key) do begin
		swap(heap[p shr 1],heap[p]);
		p:=p shr 1;
	end;
 end;

function getmin(var t:longint):longint;
 var
	s,k:longint;
 begin
	getmin:=heap[1].num;
	swap(heap[1],heap[t]);
	dec(t);
	k:=1;
	while (k shl 1 <= t) do begin
		if (k shl 1 + 1 > t) or (heap[k shl 1 + 1].key > heap[k shl 1].key) then s:=k shl 1 else s:=k shl 1 + 1;
		if (heap[k].key > heap[s].key) then begin
			swap(heap[s],heap[k]);
			k:=s;
		end else break;
	end;
 end;

procedure dijkstra_forward;
 var
	i,j,k:longint;
 begin
	for i:=1 to n do begin
		flag[i]:=true;
		f[i]:=infinity;
	end;
	f[w]:=0; insert(heaptot,f[w],w);
	for i:=1 to n - 1 do begin
		repeat
			k:=getmin(heaptot);
		until (flag[k]) or (heaptot = 0);
		if (flag[k]) then begin
			flag[k]:=false;
			for j:=1 to n do
				if (flag[j]) and (a[k,j] > 0) and (f[k] + a[k,j] < f[j]) then begin
					f[j]:=f[k] + a[k,j];
					insert(heaptot,f[j],j);
				end;
		end;
		if (heaptot = 0) then break;
	end;

 end;

procedure dijkstra_backward;
 var
	i,j,k:longint;
 begin
	for i:=1 to n do begin
		flag[i]:=true;
		g[i]:=infinity;
	end;
	g[w]:=0; insert(heaptot,g[w],w);
	for i:=1 to n - 1 do begin
		repeat
			k:=getmin(heaptot);
		until (flag[k]) or (heaptot = 0);
		if (flag[k]) then begin
			flag[k]:=false;
			for j:=1 to n do
				if (flag[j]) and (a[j,k] <> -1) and (g[k] + a[j,k] < g[j]) then begin
					g[j]:=g[k] + a[j,k];
					insert(heaptot,g[j],j);
				end;
		end;
		if (heaptot = 0) then break;
	end;

 end;

procedure main;
 var
	i,ans:longint;
 begin
	heaptot:=0;
	fillchar(heap,sizeof(heap),0);
	dijkstra_forward;
	heaptot:=0;
	fillchar(heap,sizeof(heap),0);
	dijkstra_backward;
	ans:=-infinity;
	for i:=1 to n do
		if (f[i] <> infinity) and (g[i] <> infinity) and (f[i] + g[i] > ans) then ans:=f[i] + g[i];
	writeln(ans);
 end;

begin
	init;
	main;
end.