program p3167;
const
	maxn = 100000;
	maxm = 25000;
	maxs = 25;
var
	a:array[1..maxn] of longint;
	b:array[1..maxm] of longint;
	hash:array[1..2,1..maxs] of longint;
	w:array[1..maxn] of longint;
	ans:array[1..maxn] of longint;
	n,m,total,s:longint;
procedure init;
 var
	i:longint;
 begin
	readln(n,m,s);
	for i:=1 to n do readln(a[i]);
	for i:=1 to m do readln(b[i]);
	total:=0;
 end;
 
function rank_left(x,k:longint):longint;
 var
	i:longint;
 begin
	rank_left:=0;
	for i:=1 to k do
		if (hash[x,i] > 0) then inc(rank_left);
 end;

function rank_right(x,k:longint):longint;
 var
	i:longint;
 begin
	rank_right:=0;
	for i:=k to s do
		if (hash[x,i] > 0) then inc(rank_right);
 end;
 
procedure kmp;
 var
	i,k,p:longint;
 begin
	fillchar(hash,sizeof(hash),0);
	k:=0; w[1]:=0;
	for i:=2 to m do begin
		while (k > 0) and ((rank_left(1,b[k + 1] - 1) <> rank_left(2,b[i] - 1)) or (rank_right(1,b[k + 1] + 1) <> rank_right(2,b[i] + 1))) do begin
			for p:=w[k] + 1 to k do dec(hash[1,b[p]]);
			for p:=i - k to i - w[k] - 1 do dec(hash[2,b[p]]);
			k:=w[k];
		end;
		if (rank_left(1,b[k + 1] - 1) = rank_left(2,b[i] - 1)) and (rank_right(1,b[k + 1] + 1) = rank_right(2,b[i] + 1)) then begin
			inc(k);
			inc(hash[1,b[k]]); inc(hash[2,b[i]]);
		end;
		w[i]:=k;
	end;
	k:=0;
	fillchar(hash,sizeof(hash),0);
	for i:=1 to n do begin
		while (k > 0) and ((rank_left(1,a[i] - 1) <> rank_left(2,b[k + 1] - 1)) or (rank_right(1,a[i] + 1) <> rank_right(2,b[k + 1] + 1))) do begin
			for p:=w[k] + 1 to k do dec(hash[2,b[p]]);
			for p:=i - k to i - w[k] - 1 do dec(hash[1,a[p]]);
			k:=w[k];
		end;
		if (rank_left(2,b[k + 1] - 1) = rank_left(1,a[i] - 1)) and (rank_right(1,a[i] + 1) = rank_right(2,b[k + 1] + 1)) then begin
			inc(k);
			inc(hash[1,a[i]]); inc(hash[2,b[k]]);
		end;
		if (k = m) then begin
			inc(total);
			ans[total]:=i - m + 1;
			for p:=w[k] + 1 to k do dec(hash[2,b[p]]);
			for p:=i - k + 1 to i - w[k] do dec(hash[1,a[p]]);
			k:=w[k];
		end;
	end;
 end;
 
procedure print;
 var
	i:longint;
 begin
	writeln(total);
	for i:=1 to total do writeln(ans[i]);
 end;
 
begin
	init;
	kmp;
	print;
end.