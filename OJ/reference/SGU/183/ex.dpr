{
	Author: Amber
	Method: DP
	Clarity:
		State (i,j) (1<=i<=n-1,1<=j<=m-1,i+j<=n) denotes last two black balls i, i+j //O(NM) for states
		Transfer (i,j)=min (i-k,k)    (i-k+m>=i+j, i-k>=1, k>=1)  //O(M) for transfer
		If N-M+1<=i, (i,j) is a finish state.
		Optimization: //O(1) for transfer
			Enumerate j from m-1 to 1, the range of k gets larger cuz of 1<=k<=m-j.
			Set a var CurMin for each i which records min (i-k,k) for the larger and larger range of k. 
	Complexity: O(NM)
	Memory: O(M^2)
	Notice:
		PreMod(i) is i mod M.
		It's for scroll array.
}
program SGU_183(Input,Output);
const
	MaxN=10000;
	MaxM=100;
	MaxValue=MaxLongint div 8;
type
	TIndex=Longint;
	TCost=array[1..MaxN]of TIndex;
	TPreMod=array[1..MaxN]of TIndex;
	TDP=array[0..MaxM-1,1..MaxM-1]of TIndex;
var
	N,M:TIndex;
	Cost:TCost;
	PreMod:TPreMod;
	F:TDP;
	
procedure Update(var A:TIndex;B:TIndex);
begin
	if A>B then A:=B;
end;
procedure Main;
var
	i,j,k:TIndex;
	Min,CurMin:TIndex;
begin
	Readln(N,M);
	for i:=1 to N do
		Read(Cost[i]);
	Readln;
	
	PreMod[1]:=1;
	for i:=2 to N do
	begin
		PreMod[i]:=PreMod[i-1]+1;
		if PreMod[i]=M then PreMod[i]:=0;
	end;
	
	Min:=MaxValue;
	for i:=1 to N-1 do
	begin
		CurMin:=MaxValue;
		for j:=M-1 downto 1 do
		begin
			k:=M-j;
			if i-k>0 then 
				Update(CurMin,F[PreMod[i-k],k])
			else 
				Update(CurMin,Cost[i]);
			if i+j<=N then
			begin
				F[PreMod[i],j]:=CurMin+Cost[i+j];
				if i>=N-M+1 then Update(Min,F[PreMod[i],j]);
			end;
		end;
	end;
	Writeln(Min);
end;
begin
	Main;
end.