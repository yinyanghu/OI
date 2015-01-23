program p3622;
const
	maxn = 100000;
	maxm = 100000;
type
	node = record
		cost,green:longint;
	end;

var
	key,count,left,right:array[0..maxn] of longint;
	grass:array[1..maxm] of node;
	cow:array[1..maxn] of node;
	tt,root,n,m,i,k,p,tot:longint;
	ans:int64;
	
procedure initialize;
 begin
	fillchar(left,sizeof(left),0);
	fillchar(right,sizeof(right),0);
	fillchar(key,sizeof(key),0);
	fillchar(count,sizeof(count),0);
	root:=0; tt:=0;
 end;

procedure left_rotate(var t:longint);
 var
	k:longint;
 begin
 	k:=left[t]; left[t]:=right[k]; right[k]:=t; t:=k;
 end;

procedure right_rotate(var t:longint);
 var
 	k:longint;
 begin
 	k:=right[t]; right[t]:=left[k]; left[k]:=t; t:=k;
 end;

procedure splay(var t:longint; x:longint);
 begin
 	if (x < key[t]) then begin
 		if (left[t] <> 0) then begin
 			splay(left[t],x);
 			left_rotate(t);
 		end;
 	end else if (x > key[t]) then begin
 		if (right[t] <> 0) then begin
 			splay(right[t],x);
 			right_rotate(t);
 		end;
 	end;
 end;

procedure insert(x:longint);
 begin
	splay(root,x);
	if (x < key[root]) then begin
		inc(tt);
		key[tt]:=x; count[tt]:=1;
		left[tt]:=left[root];
		left[root]:=0; right[tt]:=root;
		root:=tt;
	end else if (x > key[root]) then begin
		inc(tt);
		key[tt]:=x; count[tt]:=1;
		right[tt]:=right[root];
		right[root]:=0; left[tt]:=root;
		root:=tt;
	end else inc(count[root]);
 end;

procedure delete(x:longint);
 var
	k:longint;
 begin
 	splay(root,x);
 	if (x <> key[root]) then exit;
 	if (count[root] > 1) then begin
 		dec(count[root]);
 		exit;
 	end;
 	if (left[root] = 0) then k:=right[root]
 		else begin
 			k:=left[root];
 			splay(k,x);
 			right[k]:=right[root];
 		end;
 	root:=k;
 end;

function find(t,x:longint):longint;
 begin
	if (t = 0) then exit(-1);
	if (x < key[t]) then find:=find(left[t],x)
		else begin
			find:=find(right[t],x);
			if (find = -1) then find:=key[t];
		end;
 end;

procedure cowsort(l,r:longint);
 var
	i,j,x:longint;
	y:node;
 begin
 	i:=l; j:=r; x:=cow[(l + r) shr 1].cost;
 	repeat
 		while (cow[i].cost < x) do inc(i);
 		while (cow[j].cost > x) do dec(j);
 		if (i <= j) then begin
 			y:=cow[i]; cow[i]:=cow[j]; cow[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then cowsort(l,j);
 	if (i < r) then cowsort(i,r);
 end;

procedure grasssort(l,r:longint);
 var
	i,j,x:longint;
	y:node;
 begin
 	i:=l; j:=r; x:=grass[(l + r) shr 1].cost;
 	repeat
 		while (grass[i].cost < x) do inc(i);
 		while (grass[j].cost > x) do dec(j);
 		if (i <= j) then begin
 			y:=grass[i]; grass[i]:=grass[j]; grass[j]:=y;
 			inc(i); dec(j);
 		end;
 	until (i > j);
 	if (l < j) then grasssort(l,j);
 	if (i < r) then grasssort(i,r);
 end;

begin
	initialize;
	readln(n,m);
	for i:=1 to n do readln(cow[i].cost,cow[i].green);
	for i:=1 to m do readln(grass[i].cost,grass[i].green);
	cowsort(1,n);
	grasssort(1,m);
	k:=1; ans:=0; tot:=0;
	for i:=1 to m do begin
		while (cow[k].cost <= grass[i].cost) and (k <= n) do begin
			insert(cow[k].green);
			inc(k);
		end;
		p:=find(root,grass[i].green);
		if (p <> -1) then begin
			ans:=ans + grass[i].cost;
			delete(p); inc(tot);
			if (tot = n) then break;
		end;
	end;
	writeln(ans);
end.
