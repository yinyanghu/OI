program p3625;
const
	maxn = 1000;
	limitsize = 1000;
	infinity = 1000000000;
	eps = 0.000000001;
type
	pointnode = record
		x,y:longint;
	end;
	linknode = record
		size:longint;
		list:array[1..limitsize] of longint;
	end;
	heapnode = record
		num:longint;
		key:extended;
	end;
var
	a:array[1..maxn] of pointnode;
	link:array[1..maxn] of linknode;
	f:array[1..maxn,1..maxn] of extended;
	heap:array[1..maxn * 100] of heapnode;
	flag:array[1..maxn] of boolean;
	w:array[1..maxn] of extended;
	color:array[1..maxn] of longint;
	totcolor,n,heapnum:longint;
	ans:extended;
	
procedure init;
 var
	i,m,x,y:longint;
 begin
	readln(n,m);
	for i:=1 to n do readln(a[i].x,a[i].y);
	for i:=1 to n do link[i].size:=0;
	for i:=1 to m do begin
		readln(x,y);
		inc(link[x].size); link[x].list[link[x].size]:=y;
		inc(link[y].size); link[y].list[link[y].size]:=x;
	end;
 end;
 
procedure dfs(x:longint);
 var
	i:longint;
 begin
	color[x]:=totcolor;
	for i:=1 to link[x].size do
		if (color[link[x].list[i]] = -1) then dfs(link[x].list[i]);
 end;
 
procedure coloring;
 var
	i:longint;
 begin
	fillchar(color,sizeof(color),255);
	totcolor:=0;
	for i:=1 to n do
		if (color[i] = -1) then begin
			inc(totcolor);
			dfs(i);
		end;
 end;
 
function sqr(a:int64):int64;
 begin
 	sqr:=a * a;
 end;
 
function getdist(p,q:longint):extended;
 begin
 	getdist:=sqrt(sqr(a[p].x - a[q].x) + sqr(a[p].y - a[q].y));
 end;
 
procedure buildmap;
 var
	i,j:longint;
 begin
 	for i:=1 to n do
 		for j:=1 to n do
 			if (color[i] = color[j]) then begin
 				f[i,j]:=0; f[j,i]:=0;
 			end else begin
 				f[i,j]:=getdist(i,j); f[j,i]:=f[i,j];
 			end;
 end;

procedure swap(var a,b:heapnode);
 var
	k:heapnode;
 begin
 	k:=a; a:=b; b:=k;
 end;
 
procedure insert(var t:longint; key:extended; v:longint);
 var
	k:longint;
 begin
 	inc(t);
 	heap[t].key:=key; heap[t].num:=v;
  	k:=t;
 	while (k <> 1) and (heap[k shr 1].key - heap[k].key > eps) do begin
 		swap(heap[k shr 1],heap[k]);
 		k:=k shr 1;
 	end;
 end;
 
function getmin(var t:longint):longint;
 var
	k,s:longint;
 begin
 	getmin:=heap[1].num;
 	swap(heap[1],heap[t]);
 	dec(t);
 	k:=1;
 	while (k shl 1 <= t) do begin
 		if (k shl 1 + 1 > t) or (heap[k shl 1 + 1].key - heap[k shl 1].key > eps) then s:=k shl 1 else s:=k shl 1 + 1;
 		if (heap[k].key - heap[s].key > eps) then begin
 			swap(heap[k],heap[s]);
 			k:=s;
 		end else break;
 	end;
 end;
 
procedure mst;
 var
	i,j,k:longint;
 begin
	heapnum:=0;
	fillchar(flag,sizeof(flag),true);
	ans:=0; w[1]:=0;
	for i:=2 to n do w[i]:=infinity;
	insert(heapnum,w[1],1);
	for i:=1 to n do begin
		repeat
			k:=getmin(heapnum);
		until (flag[k]) or (heapnum = 0);
		if (flag[k]) then begin
			flag[k]:=false;
			ans:=ans + w[k];
			for j:=1 to n do
				if (flag[j]) and (f[k,j] < w[j]) then begin
					w[j]:=f[k,j];
					insert(heapnum,w[j],j);
				end;
		end;
		if (heapnum = 0) then break;
	end;
	writeln(ans:0:2);
 end;
 
procedure main;
 begin
	coloring;
	buildmap;
	mst;
 end;

begin
	init;
	main;
end.