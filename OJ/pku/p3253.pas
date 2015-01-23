program p3253;
const
	maxheap = 20000;
var
	heap:array[1..maxheap] of longint;
	heaptot,i,n,a,b,k:longint;
	ans:int64;
	
procedure swap(var a,b:longint);
 var
 	k:longint;
 begin
 	k:=a; a:=b; b:=k;
 end;
 
procedure insert(var t:longint; key:longint);
 var
 	k:longint;	
 begin
 	inc(t); heap[t]:=key;
 	k:=t;
 	while (k <> 1) and (heap[k shr 1] > heap[k]) do begin
 		swap(heap[k],heap[k shr 1]);
 		k:=k shr 1;
 	end;
 end;
 
function getmin(var t:longint):longint;
 var
 	k,s:longint;
 begin
 	getmin:=heap[1];
 	swap(heap[1],heap[t]);
 	dec(t);
 	k:=1; s:=1;
 	while (k * 2 <= t) do begin
 		if (k * 2 + 1 > t) or (heap[k * 2 + 1] > heap[k * 2]) then s:=k * 2 else s:=k * 2 + 1;
 		if (heap[k] > heap[s]) then begin
 			swap(heap[k],heap[s]);
 			k:=s;
 		end else break;
 	end;
 end;
 
begin
	readln(n);
	heaptot:=0;
	for i:=1 to n do begin
		readln(k);
		insert(heaptot,k);
	end;
	ans:=0;
	while (heaptot > 1) do begin
		a:=getmin(heaptot);
		b:=getmin(heaptot);
		ans:=ans + a + b;
		insert(heaptot,a + b);
	end;
	writeln(ans);
end.