program p2454;
const
	maxn = 180;
type
	node = record
		key,num:longint;
	end;
var
	a:array[1..maxn] of node;
	n,k,limit,i,p,q:longint;
	
function check:boolean;
 var
	i,sum,flag:longint;
 begin
 	flag:=0;
 	sum:=0;
	for i:=1 to n do sum:=sum + a[i].key;
	if (sum > limit) then inc(flag) else dec(flag);
	sum:=0;
	for i:=(n + 1) to (n shl 1) do sum:=sum + a[i].key;
	if (sum > limit) then inc(flag) else dec(flag);
	if (flag = 2) then exit(true);
	if (flag = -2) then exit(false);
	sum:=0;
	for i:=(n shl 1 + 1) to k do sum:=sum + a[i].key;
	check:=sum > limit;
 end;
 
procedure swap(var a,b:node);inline;
 var
	k:node;
 begin
	k:=a; a:=b; b:=k;
 end;

procedure sort(l,r:longint);
 var
	i,j,x:longint;
 begin
	i:=l; j:=r; x:=a[random(r - l + 1) + l].key;
	repeat
		while (a[i].key < x) do inc(i);
		while (a[j].key > x) do dec(j);
		if (i <= j) then begin
			swap(a[i],a[j]);
			inc(i); dec(j);
		end;
	until (i > j);
	if (l < j) then sort(l,j);
	if (i < r) then sort(i,r);
 end;
 
begin
	readln(n);
	k:=n * 3; limit:=n * 500;
	for i:=1 to k do begin
		readln(a[i].key);
		a[i].num:=i;
	end;
	randomize;
	sort(1,k);
	while (not check) do begin
		p:=random(n shl 1) + n + 1;
		q:=random(n shl 1) + n + 1;
		swap(a[p],a[q]);
	end;
	for i:=1 to k do writeln(a[i].num);
end.