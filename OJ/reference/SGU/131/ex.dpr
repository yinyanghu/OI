{
	Author: Amber
	Method: Set-DP
	Clarity:
		State (N,K) (0<=K<2^M) denotes that the current is in n-th lines and the plan of (n-1)-th lines is K.
		Transfer: K->K' by DFS
			There are 7 transfers in total.
			1:  2:  3:  4:  5:  6:  7: do noting
			**  **  *    *      *  
			*    *  **  **  **  *  
			in my program,
			"Pow and Prev" gets the depth-th value of the last line.
			"Pow shl 1 and Prev" gets the (depth-1)-th value of the last line.
	Complexity: O(N*2^M*R) 
				R is average transfer times.
	Notice:
		1)把转移事先都处理好
		2)使用queue向后递推的方式，可以减少DP初期的冗余(初状态只有一个!)
		3)由于有queue,DP数组球没有必要每次都filchar.用了一个状态后，清0即可.
}
program SGU_131(Input,Output);
const
	MaxSize=9;
type
	TIndex=Longint;
	TFlag=array[-1..1 shl MaxSize-1]of TIndex;
	TTransfer=array[1..1 shl (2*MaxSize)]of TIndex;
	TDP=array[0..1 shl MaxSize-1]of Int64;
	TQueue=array[1.. 1 shl MaxSize]of TIndex;
var
	N,M:TIndex;
	Count:TIndex;
	Flag:TFlag;
	Trans:TTransfer;
	Len:array[Boolean]of TIndex;
	F:array[Boolean]of TDP;
	Q:array[Boolean]of TQueue;

procedure ExpandState(Prev,Cur,Depth,Pow:TIndex);
begin
	if Depth=M+1 then
	begin
		if Prev=1 shl M-1 then
		begin
			Inc(Count);
			Trans[Count]:=Cur;
		end;
		Exit;
	end;
	if (Depth>1) and (Pow shl 1 and Prev=0) and (Pow and Prev=0) and (Pow shl 1 and Cur=0) then 
		ExpandState(Prev or Pow shl 1 or Pow,Cur or Pow shl 1,Depth+1,Pow shr 1);
	if (Depth>1) and (Pow shl 1 and Prev=0) and (Pow and Prev=0) then
		ExpandState(Prev or Pow shl 1 or Pow,Cur or Pow,Depth+1,Pow shr 1);
	if (Depth>1) and (Pow shl 1 and Prev=0) and (Pow shl 1 and Cur=0) then
		ExpandState(Prev or Pow shl 1,Cur or Pow shl 1 or Pow,Depth+1,Pow shr 1);
	if (Depth>1) and (Pow shl 1 and Prev>0) and (Pow and Prev=0) and (Pow shl 1 and Cur=0) then
		ExpandState(Prev or Pow,Cur or Pow shl 1 or Pow,Depth+1,Pow shr 1);
	if (Depth>1) and (Pow shl 1 and Prev>0) and (Pow shl 1 and Cur=0) then 
		ExpandState(Prev,Cur or Pow shl 1 or Pow,Depth+1,Pow shr 1);
	if (Pow and Prev=0) and ((Depth=1) or (Pow shl 1 and Prev>0)) then 
		ExpandState(Prev or Pow, Cur or Pow,Depth+1,Pow shr 1);
	if (Depth=1) or (Pow shl 1 and Prev>0) then 
		ExpandState(Prev,Cur,Depth+1,Pow shr 1);
end;
procedure Main;
var
	i,j,k:TIndex;
	T:TIndex;
	Cur:Boolean;
begin
	//Read data
	Readln(N,M);
	if N<M then 
	begin
		T:=N;
		N:=M;
		M:=T;
	end;
	//Pre-process transfer
	Count:=0;
	Flag[-1]:=0;
	for i:=0 to 1 shl M-1 do
	begin
		ExpandState(i,0,1,1 shl (M-1));
		Flag[i]:=Count;
	end;
	//Init for DP by a queue, reducing redundance.
	Cur:=false;
	FillChar(F,SizeOf(F),0);
	F[Cur,1 shl M-1]:=1;
	Len[Cur]:=1;
	Q[Cur,Len[Cur]]:=1 shl M-1;
	for i:=1 to N do
	begin
		Len[not Cur]:=0;
		for j:=1 to Len[Cur] do
		begin
			for k:=Flag[Q[Cur,j]-1]+1 to Flag[Q[Cur,j]] do
			begin
				if F[not Cur,Trans[k]]=0 then
				begin
					Inc(Len[not Cur]);
					Q[not Cur,Len[not Cur]]:=Trans[k];
				end;
				Inc(F[not Cur,Trans[k]],F[Cur,Q[Cur,j]]);
			end;
			F[Cur,Q[Cur,j]]:=0; //This is instead of fillchar, reducing redundance.
		end;
		Cur:=not Cur;
	end;
	//Output
	Writeln(F[Cur,1 shl M-1]);
end;
begin
	Main;
end.