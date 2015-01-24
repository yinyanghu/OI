{
	Dp
}
program Ural_1353(Input,Output);
const
	MaxD=9; //here N=999999999
	MaxS=81;
type
	TIndex=Longint;
	TDP=array[0..MaxD,0..MaxS]of TIndex;
var
	F:TDP;
procedure Precompute;
var
	i,j,k:TIndex;
begin
	FillChar(F,SizeOf(F),0);
	F[0,0]:=1;
	for i:=1 to MaxD do
		for j:=0 to (i-1)*9 do
			for k:=0 to 9 do
				Inc(F[i,j+k],F[i-1,j]);
end;
procedure Main;
var
	S:TIndex;
begin
	Precompute;
	Inc(F[MaxD,1]);//1000000000
	Readln(S);
	Writeln(F[MaxD,S]);
end;
begin
	Main;
end.