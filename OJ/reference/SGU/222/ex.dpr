{
	Author: Amber
	Method: Math
	Clarity:
		求n*n棋盘上放k个车的方案数
		P(n,k)*C(n,k) 
	Complexity: O(k)
	Notice: None
}
program SGU_222(Input, Output);
type
	TIndex = Longint;

procedure Main;
var
	N, K :TIndex;
	i :TIndex;
	S :TIndex;
begin
	Readln(N, K);
	if N < K then
	begin
		Writeln(0);
		Exit;
	end;
	S := 1;
	for i := 1 to K do
		S := S * Sqr(N - K + i) div i;
	Writeln(S);
end;
begin
	Main;
end.
