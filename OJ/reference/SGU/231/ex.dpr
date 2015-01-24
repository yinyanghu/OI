{
	Author: Amber
	Method: Filter Primes + Enumerate
	Clarity:
		���� ������+ż����(2)=������
		ʵ���Ͼ�������������.
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
			for j := i to N div i do // �Ǵ�i��ʼ������2����Ϊ2*x�Ѿ�ɸ����
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
