{
 Method: DP
 Memory is a big problem.
 0) use double-direction DP to decrease memory and time  to O(N/2).
 1) Scrolled DP array
 2) the type of DP array is byte.Notice arithmetic overflow. should set a MaxValue
 3) path record(boolean) of DP should be compressed using 1 byte instead of 8 booleans.
 4) DP twice because the path record array P is too big so that the number of P must be only one at most.
}
program Ural_1244(Input, Output);
const
	MaxN = 100;
	MaxWeight = 1000;
	MaxValue = 255;
type
	TIndex = Longint;
	TData = array[1..MaxN div 2] of TIndex;
	TUsed = array[1..MaxN div 2] of Boolean;
	TDP = array[0..MaxN * MaxWeight div 2] of Byte;
	TQueue = array[1..MaxN * MaxWeight div 2 + 1] of TIndex;
	TPath = array[1..MaxN div 2, 0..MaxN * MaxWeight div 2 div 8] of Byte;
var
	Total: TIndex;
	NA, NB: TIndex;
	FA, FB: TDP;
	DA, DB: TData;

//compressing process

procedure SetTrue(var P: TPath; i, j: TIndex);
begin
	//j and (1 shl 3-1) <==> j mod 8
	//j shr 3 <==> j div 8
	Inc(P[i, j shr 3], 1 shl (j and (1 shl 3 - 1)));
end;

function GetValue(const P: TPath; i, j: TIndex): Boolean;
begin
	Result := (1 shl (j and (1 shl 3 - 1)) and P[i, j shr 3] > 0);
end;

procedure DP(const D: TData; var F_R: TDP; var P: TPath; N, Limit: TIndex; RecordPath: Boolean);
var
	i, j: TIndex;
	F: array[0..1] of TDP;
	OldLen, Len: TIndex;
	Q: TQueue;
	Cur: TIndex;
begin
	Cur := 0;
	FillChar(F[Cur], SizeOf(F[Cur]), 0);
	if RecordPath then
		FillChar(P, SizeOf(P), 0);
	Len := 1;
	Q[1] := 0;
	F[Cur, 0] := 1;
	for i := 1 to N do
	begin
		OldLen := Len;
		F[1 - Cur] := F[Cur];
		for j := 1 to OldLen do
			if Q[j] + D[i] <= Limit then
			begin
				if F[1 - Cur, Q[j] + D[i]] = 0 then
				begin
					Inc(Len);
					Q[Len] := Q[j] + D[i];
					if RecordPath then
						SetTrue(P, i, Q[j] + D[i]);
				end;
				if TIndex(F[1 - Cur, Q[j] + D[i]]) + F[Cur, Q[j]] > MaxValue then
					F[1 - Cur, Q[j] + D[i]] := MaxValue
				else
					Inc(F[1 - Cur, Q[j] + D[i]], F[Cur, Q[j]]);
			end;
		Cur := 1 - Cur;
	end;
	F_R := F[Cur];
end;

procedure FindPath(const D: TData; const P: TPath; N, Ptr: TIndex; var U: TUsed);
var
	i: TIndex;
begin
	FillChar(U, SizeOf(U), 0);
	for i := N downto 1 do
		if GetValue(P, i, Ptr) then
		begin
			U[i] := true;
			Dec(Ptr, D[i]);
		end;
end;

procedure Main;
var
	i: TIndex;
	N: TIndex;
	Count, Ptr: TIndex;
	LimitA, LimitB: TIndex;
	U: TUsed;
	P: TPath;
begin
	//Init
	Readln(Total);
	Readln(N);
	NA := N div 2;
	NB := N - NA;
	LimitA := 0;
	for i := 1 to NA do
	begin
		Readln(DA[i]);
		Inc(LimitA, DA[i]);
	end;
	if Total < LimitA then
		LimitA := Total;
	LimitB := 0;
	for i := 1 to NB do
	begin
		Readln(DB[i]);
		Inc(LimitB, DB[i]);
	end;
	if Total < LimitB then
		LimitB := Total;

	//DP
	DP(DA, FA, P, NA, LimitA, false);
	DP(DB, FB, P, NB, LimitB, false);
	Count := 0;
	Ptr := 0;
	for i := Total - LimitB to LimitA do
		if TIndex(FA[i]) * FB[Total - i] > 0 then
		begin
			Ptr := i;
			Inc(Count, TIndex(FA[i]) * FB[Total - i]);
			if Count > 1 then
				Break;
		end;

	//Answer
	if Count = 0 then
		Writeln(0)
	else if Count > 1 then
		Writeln(-1)
	else if Count = 1 then
	begin
		DP(DA, FA, P, NA, LimitA, true); //DP again to get Path
		FindPath(DA, P, NA, Ptr, U);
		for i := 1 to NA do
			if not U[i] then
				Write(i, ' ');
		DP(DB, FB, P, NB, LimitB, true);
		FindPath(DB, P, NB, Total - Ptr, U);
		for i := 1 to NB do
			if not U[i] then
				Write(i + NA, ' ');
		Writeln;
	end;
end;
begin
	Main;
end.
