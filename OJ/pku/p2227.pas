program p2227;
const
	maxn = 300;
	limitsize = 90000;
	dx:array[1..4] of longint = (0,0,1,-1);
	dy:array[1..4] of longint = (1,-1,0,0);
type
	heapnode = record
		key,x,y:longint;
	end;
var
	totheap,n,m,x,y,ans,i,j:longint;
	a:array[1..maxn,1..maxn] of longint;
	flag,added:array[1..maxn,1..maxn] of boolean;
	heap:array[1..limitsize] of heapnode;
	
procedure swap(var a,b:heapnode);
 var
	k:heapnode;
 begin
 	k:=a; a:=b; b:=k;
 end;
	
procedure insert(var t:longint; key,x,y:longint);
 var
	k:longint;
 begin
	inc(t); k:=t;
	heap[k].key:=key; heap[k].x:=x; heap[k].y:=y;
	while (k <> 1) and (heap[k shr 1].key > heap[k].key) do begin
		swap(heap[k shr 1],heap[k]);
		k:=k shr 1;
	end;
 end;
	
procedure getmin(var t,x,y:longint);
 var
	k,s:longint;
 begin
	x:=heap[1].x; y:=heap[1].y;
	swap(heap[1],heap[t]);
	dec(t);
	k:=1; s:=1;
	while (k shl 1 <= t) do begin
		if (k shl 1 + 1 > t) or (heap[k shl 1 + 1].key > heap[k shl 1].key) then s:=k shl 1 else s:=k shl 1 + 1;
		if (heap[k].key > heap[s].key) then begin
			swap(heap[k],heap[s]);
			k:=s;
		end else break;
	end;
 end;

procedure dfs(x,y,highest:longint);
 var
	i,xx,yy:longint;
 begin
	flag[x,y]:=false;
	for i:=1 to 4 do begin
		xx:=x + dx[i];
		yy:=y + dy[i];
		if (1 <= xx) and (xx <= n) and (1 <= yy) and (yy <= m) and (flag[xx,yy]) then begin
			if (a[xx,yy] > highest) then
				if (not added[xx,yy]) then begin
					added[xx,yy]:=true;
					insert(totheap,a[xx,yy],xx,yy);
				end;
			if (a[xx,yy] < highest) then begin
				ans:=ans + (highest - a[xx,yy]);
				dfs(xx,yy,highest);
			end;
			if (a[xx,yy] = highest) then dfs(xx,yy,highest);
		end;
	end;
 end;

begin
	readln(m,n);
	for i:=1 to n do
		for j:=1 to m do read(a[i,j]);
	fillchar(flag,sizeof(flag),true);
	flag[1,1]:=false; flag[1,m]:=false; flag[n,1]:=false; flag[n,m]:=false;
	fillchar(added,sizeof(added),false);
	totheap:=0;
	for i:=2 to m - 1 do begin
		added[1,i]:=true;
		insert(totheap,a[1,i],1,i);
		added[n,i]:=true;
		insert(totheap,a[n,i],n,i);
	end;
	for i:=2 to n - 1 do begin
		added[i,1]:=true;
		insert(totheap,a[i,1],i,1);
		added[i,m]:=true;
		insert(totheap,a[i,m],i,m);
	end;
	ans:=0;
	while (totheap > 0) do begin
		getmin(totheap,x,y);
		dfs(x,y,a[x,y]);
	end;
	writeln(ans);
end.
