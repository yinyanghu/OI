{
	using Internet resourse
}
program Ural_1352(Input,Output);
const
	MaxN=38;
	MersennePrimePower:array[1..38]of Longint=(
	2,
	3,
	5,
	7,
	13,
	17,
	19,
	31,
	61,
	89,
	107,
	127,
	521,
	607,
	1279,
	2203,
	2281,
	3217,
	4253,
	4423,
	9689,
	9941,
	11213,
	19937,
	21701,
	23209,
	44497,
	86243,
	110503,
	132049,
	216091,
	756839,
	859433,
	1257787,
	1398269,
	2976221,
	3021377,
	6972593);

type
	TIndex=Longint;

procedure Main;
var
	N:TIndex;
begin
	Readln(N);
	Writeln(MersennePrimePower[N]);
end;
var
	DataNum:TIndex;
begin
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		Main;
	end;
end.