program p2377;
const
	maxn = 1000;
	infinity = 1000000000;
type
	heapnode = record
		dist,num:longint;
	end;
var
	a:array[1..maxn,1..maxn] of longint;
	f:array[1..maxn] of longint;
	heap:array[1..maxn*10] of heapnode;
	flag:array[1..maxn] of boolean;
	x,y,i,j,n,m,k,ans,total:longint;
procedure swap(var a,b:heapnode);
 var
 	k:heapnode;
 begin
	k:=a; a:=b; b:=k;
 end;

procedure insert(var p:longint; key,v:longint);
 var
	t:longint;
 begin
	inc(p); t:=p;
	heap[t].dist:=key; heap[t].num:=v;
	while (t <> 1) and (heap[t shr 1].dist < heap[t].dist) do begin
		swap(heap[t shr 1],heap[t]);
		t:=t shr 1;
	end;
 end;

function getmax(var p:longint):longint;
 var
	t,s:longint;
 begin
	getmax:=heap[1].num;
	swap(heap[1],heap[p]); dec(p);
	t:=1;
	while t shl 1 <= p do begin
		if (t shl 1 + 1 > p) or (heap[t shl 1 + 1].dist < heap[t shl 1].dist) then s:=t shl 1 else s:=t shl 1 + 1;
		if (heap[t].dist < heap[s].dist) then begin
			swap(heap[t],heap[s]);
			t:=s;
		end else break;
	end;
 end;

begin
	readln(n,m);
	fillchar(a,sizeof(a),0);
	for i:=1 to m do begin
		readln(x,y,k);
		if k > a[x,y] then a[x,y]:=k;
		a[y,x]:=a[x,y];
	end;
	total:=0; ans:=0;
	fillchar(flag,sizeof(flag),true);
	f[1]:=0; for i:=2 to n do f[i]:=-infinity;
	insert(total,f[1],1);
	for i:=1 to n do begin
		repeat
			k:=getmax(total);
		until (flag[k] = true) or (total = 0);
		if flag[k] then begin
			flag[k]:=false;
			ans:=ans + f[k];
			for j:=1 to n do
				if (flag[j]) and (a[k,j] > 0) and (a[k,j] > f[j]) then begin
					f[j]:=a[k,j];
					insert(total,f[j],j);
				end;
		end;
		if total = 0 then break;
	end;
	for i:=1 to n do
		if f[i] = -infinity then begin
			writeln(-1);
			halt;
		end;
	writeln(ans);
end.
