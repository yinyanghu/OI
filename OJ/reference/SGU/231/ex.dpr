{
	Author: Amber
	Method: Filter Primes + Enumerate
	Clarity:
		利用 奇素数+偶素数(2)=奇素数
		实际上就是找孪生素数.
	Complexity: O(N)
}
program SGU_231(Input, Output);
const
	MaxN = 1000000;
type
	TIndex = Longint;
	TFilter = array[1..MaxN] of Boolean;
var
	F: TFilter;
	N: TIndex;
	Total: TIndex;

procedure Filter;
var
	i, j: TIndex;
begin
	FillChar(F, SizeOf(F), true);
	F[1] := false;
	for i := 2 to Trunc(Sqrt(N)) do
		if F[i] then
			for j := i to N div i do // 是从i开始，不是2，因为2*x已经筛掉了
				F[i * j] := false;
end;

procedure Check(PrintSwitch: Boolean);
var
	i: TIndex;
begin
	Total := 0;
	for i := 5 to N do
		if F[i - 2] and F[i] then
		begin
			Inc(Total);
			if PrintSwitch then
				Writeln(2, ' ', i - 2);
		end;
end;

procedure Main;
begin
	Readln(N);
	Filter;
	Check(false);
	Writeln(Total);
	Check(true)
end;
begin
	Main;
end.
