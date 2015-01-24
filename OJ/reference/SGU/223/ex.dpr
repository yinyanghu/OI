{
	Author: Amber
	Method: Set-DP
	Clarity:
		求n*n棋盘上放k个王的方案数
		基于状态压缩(编码)的DP. (参见noi2001炮兵)
	Complexity: O(StateNum*N^3)*O(StateNum)
				StateNum=O(2^n)
	Notice: None
}
program SGU_223(Input, Output);
const
	MaxN = 10;
	MaxM = MaxN * MaxN;
	MaxStateCode = 1 shl MaxN;
	MaxStateNum = 144;
type
	TIndex = Longint;
	TData = Int64;
	TState = array[1..MaxN] of Byte;
	TStateSet = array[1..MaxStateNum] of TState;
	THashState = array[0..MaxStateCode - 1] of TIndex;
	TDP = array[1..MaxStateNum, 0..MaxM] of TData;
var
	N, M: TIndex;
	StateNum: TIndex;
	CurState: TState;
	States: TStateSet;
	HashState: THashState;
	Fp, Fq: TDP;
	DPBaseIndex, DPCountIndex: TIndex;

function Encode(State: TState): TIndex;
var
	i: TIndex;
begin
	Result := 0;
	for i := 1 to N do
		Result := Result * 2 + State[i];
end;

procedure SearchPossibleState(Depth: TIndex; RowLock: TIndex);
begin
	if Depth = N + 1 then
	begin
		Inc(StateNum);
		States[StateNum] := CurState;
		HashState[Encode(CurState)] := StateNum;
		Exit;
	end;
	CurState[Depth] := 0;
	SearchPossibleState(Depth + 1, RowLock - 1);
	if RowLock <= 0 then
	begin
		CurState[Depth] := 1;
		SearchPossibleState(Depth + 1, 1);
	end;
end;

function Check(State: TState; x: TIndex): Boolean;
begin
	Result := (State[x] = 0);
	if x - 1 >= 1 then Result := Result and (State[x - 1] = 0);
	if x + 1 <= N then Result := Result and (State[x + 1] = 0);
end;

procedure ExtendState(Depth: TIndex; Count: TIndex; RowLock: TIndex);
begin
	if DPCountIndex + Count > M then Exit;
	if Depth = N + 1 then
	begin
		Inc(Fq[HashState[Encode(CurState)], DPCountIndex + Count], Fp[DPBaseIndex, DPCountIndex]);
		Exit;
	end;
	CurState[Depth] := 0;
	ExtendState(Depth + 1, Count, RowLock - 1);
	if (RowLock <= 0) and Check(States[DPBaseIndex], Depth) then
	begin
		CurState[Depth] := 1;
		ExtendState(Depth + 1, Count + 1, 1);
	end;
end;

procedure Main;
var
	i, j, k: TIndex;
	Count: TData;
begin
	Readln(N, M);
	//Generating all possible state
	FillChar(HashState, SizeOf(HashState), 0);
	StateNum := 0;
	SearchPossibleState(1, 0);
	//Init for DP viz Row 1
	FillChar(Fp, SizeOf(Fp), 0);
	for j := 1 to StateNum do
	begin
		Count := 0;
		for k := 1 to N do
			Inc(Count, States[j][k]);
		Fp[j, Count] := 1;
	end;
	//DP
	for i := 2 to N do
	begin
		FillChar(Fq, SizeOf(Fq), 0);
		for j := 1 to StateNum do
			for k := 0 to M do
				if Fp[j, k] > 0 then
				begin
					DPBaseIndex := j;
					DPCountIndex := k;
					ExtendState(1, 0, 0);
				end;
		Fp := Fq;
	end;
	//Print
	Count := 0;
	for j := 1 to StateNum do
		Inc(Count, Fp[j, M]);
	Writeln(Count);
end;
begin
	Main;
end.