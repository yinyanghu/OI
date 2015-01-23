program p3261;
const
	maxn = 20000;
	prime1 = 99701;
	prime2 = 99801;
	hashsize = 100000;
type
	node = record
		key,tot:longint;
	end;
var
	a:array[1..maxn] of longint;
	hash:array[0..hashsize] of node;
	n,m,left,right,mid,i:longint;
	
function calc(len,w,prime:longint):longint;
 var
 	i:longint;
 begin
 	calc:=0;
 	for i:=1 to len do calc:=(calc * w + a[i]) mod prime;
 end;

function check(len:longint):boolean;
 var
 	i,w1,w2,max,key,f:longint;
 begin
 	fillchar(hash,sizeof(hash),0);
 	key:=calc(len,3,prime1);
 	f:=calc(len,5,prime2);
 	hash[f].key:=key;
 	inc(hash[f].tot);
 	w1:=1;
 	for i:=1 to len do w1:=(w1 * 3) mod prime1;
 	w2:=1;
 	for i:=1 to len do w2:=(w2 * 5) mod prime2;
 	max:=1;
	for i:=2 to (n - len + 1) do begin
		key:=(key * 3 - a[i - 1] * w1 + a[i + len - 1]) mod prime1;
		f:=(f * 5 - a[i - 1] * w2 + a[i + len - 1]) mod prime2;
		while (key < 0) do key:=key + prime1;
		while (f < 0) do f:=f + prime2;
		if (hash[f].key = key) and (hash[f].tot > 0) then begin
			inc(hash[f].tot);
			if (hash[f].tot > max) then max:=hash[f].tot;
		end else begin
			hash[f].key:=key;
			hash[f].tot:=1;
		end;
	end;
	check:=(max >= m);
 end;
 
begin
	readln(n,m);
	for i:=1 to n do readln(a[i]);
	left:=1; right:=n;
	while (left <= right) do begin
		mid:=(left + right) shr 1;
		if check(mid) then left:=mid + 1 else right:=mid - 1;
	end;
	writeln(left - 1);
end.