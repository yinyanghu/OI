{
	Author: Amber
	Method: Memorized Search
	Clarity: Search all the states by Max-Min Search
}
program SGU_289(Input,Output);
const
	StateNum=19683;
	C_Null=0;
	C_Empty=0;
	C_Player_A=1;
	C_Player_B=2;
	C_Draw=3;
	Other:array[1..2]of ShortInt=(2,1);
	Line:array[1..8]of array[1..3]of ShortInt=
		((1,2,3),(4,5,6),(7,8,9),(1,4,7),(2,5,8),(3,6,9),(1,5,9),(3,5,7));
	Pow:array[0..8]of Longint=(1,3,9,27,81,243,729,2187,6561);
type
	TIndex=Longint;
	TValue=Shortint;
	TChess=array[1..9]of TValue;
	TState=array[0..StateNum-1]of TValue;
var
	State:TState;
	Chess:TChess;

procedure DFS(Code:TIndex;Player:TValue);
var
	i,j:TIndex;
	Win,Draw:Boolean;
	Best:TValue;
begin
	if State[Code]>0 then Exit;
	for i:=1 to 8 do
	begin
		Win:=true;
		for j:=1 to 3 do
			if Chess[Line[i][j]]<>Other[Player] then
			begin
				Win:=false;
				Break;
			end;
		if Win then
		begin
			State[Code]:=Other[Player];
			Exit;
		end;
	end;

	Draw:=true;
	for i:=1 to 9 do
		if Chess[i]=C_Empty then
		begin
			Draw:=false;
			Break;
		end;
	if Draw then
	begin
		State[Code]:=C_Draw;
		Exit;
	end;

	Best:=C_Null;
	for i:=1 to 9 do
		if Chess[i]=C_Empty then
		begin
			Chess[i]:=Player;
			Inc(Code,Player*Pow[i-1]);
			DFS(Code,Other[Player]);
			if State[Code]=Player then
				Best:=Player
			else if (State[Code]=C_Draw) and (Best<>Player) then
				Best:=C_Draw
			else if (State[Code]=Other[Player]) and (Best=C_Null) then
				Best:=Other[Player];
			Dec(Code,Player*Pow[i-1]);
			Chess[i]:=C_Empty;
		end;
	State[Code]:=Best;
end;
procedure Main;
var
	i:TIndex;
	Code:TIndex;
	St,Tmp:String[9];
begin
	FillChar(State,SizeOf(State),C_Null);
	FillChar(Chess,SizeOf(Chess),C_Empty);
	DFS(0,C_Player_A);
	while true do
	begin
		Readln(St);
		if St='Qc' then Break;
		Readln(Tmp);
		St:=St+Tmp;
		Readln(Tmp);
		St:=St+Tmp;
		Readln;

		Code:=0;
		for i:=1 to 9 do
			case St[i] of
				'X':Inc(Code,C_Player_A*Pow[i-1]);
				'0':Inc(Code,C_Player_B*Pow[i-1]);
			end;
		case State[Code] of
			C_Player_A:Writeln('X wins.');
			C_Player_B:Writeln('0 wins.');
			C_Draw:Writeln('Game is a draw.');
			C_Null:Writeln('Illegal position.');
		end;
	end;
end;
begin
	Main;
end.