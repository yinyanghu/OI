{
	Method: Set-DP
	Clarity:
		State (N,K) (0<=K<2^M) denotes that the current is in n-th lines and the plan of (n-1)-th lines is K.
		Transfer: K->K' by DFS
			There are 7 transfers in total.
			1:  2:  3:  4:  5:  6:  7: do noting
			**  **  *    *      *  
			*    *  **  **  **  *  
			in my program,
			"pointer and cur" gets the depth-th value of the last line.
			"pointer shl 1 and cur" gets the (depth-1)-th value of the last line.
	Complexity: O(N*2^M*R) 
				R is average transfer times.
}
program p131;
const
	maxn = 9;
var
	flag:array[-1..1 shl maxn - 1] of longint;
	state:array[1..1 shl (maxn * 2)] of longint;
	f:array[0..maxn,0..1 shl maxn - 1] of int64;
	n,m,count:longint;
	
procedure init;
 var
 	k:longint;
 begin
 	readln(n,m);
 	if (n < m) then begin
 		k:=n; n:=m; m:=k;
 	end;
 end;

procedure expandstate(cur,next,depth,pointer:longint);
 begin
 	if (depth = m + 1) then begin
 		if (cur = 1 shl m - 1) then begin
 			inc(count);
 			state[count]:=next;
 		end;
 		exit;
 	end;
 	if (depth > 1) and (pointer shl 1 and cur = 0) and (pointer and cur = 0) and (pointer shl 1 and next = 0) then expandstate(cur or pointer shl 1 or pointer,next or pointer shl 1,depth + 1,pointer shr 1);
 	if (depth > 1) and (pointer shl 1 and cur = 0) and (pointer and cur = 0) then expandstate(cur or pointer shl 1 or pointer,next or pointer,depth + 1,pointer shr 1);
 	if (depth > 1) and (pointer shl 1 and cur = 0) and (pointer shl 1 and next = 0) then expandstate(cur or pointer shl 1,next or pointer shl 1 or pointer,depth + 1,pointer shr 1);
 	if (depth > 1) and (pointer shl 1 and cur > 0) and (pointer and cur = 0) and (pointer shl 1 and next = 0) then expandstate(cur or pointer,next or pointer shl 1 or pointer,depth + 1,pointer shr 1);
 	if (depth > 1) and (pointer shl 1 and cur > 0) and (pointer shl 1 and next = 0) then expandstate(cur,next or pointer shl 1 or pointer,depth + 1,pointer shr 1);
 	if (pointer and cur = 0) and ((depth = 1) or (pointer shl 1 and cur > 0)) then expandstate(cur or pointer,next or pointer,depth + 1,pointer shr 1);
 	if (depth = 1) or (pointer shl 1 and cur > 0) then expandstate(cur,next,depth + 1,pointer shr 1);
 end;

procedure main;
 var
 	i,j,k:longint;
 begin
 	count:=0;
	flag[-1]:=0;
 	for i:=0 to (1 shl m - 1) do begin
 		expandstate(i,0,1,1 shl (m - 1));
 		flag[i]:=count;
 	end;
 	fillchar(f,sizeof(f),0);
 	f[0,1 shl m - 1]:=1;
 	for i:=0 to n - 1 do
 		for j:=0 to (1 shl m - 1) do
 			for k:=flag[j - 1] + 1 to flag[j] do f[i + 1,state[k]]:=f[i + 1,state[k]] + f[i,j];
 	writeln(f[n,1 shl m - 1]);
 	
 end;
	
begin
	init;
	main;
end.