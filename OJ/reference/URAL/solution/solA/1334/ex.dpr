{
	This problem is intangible.
	The main is printing the number of the first step in which the checker being put is fallen.
	A checker is fallen, namely it exists a checker of opponent in 8-direction of current checker.
}
program Ural_1334(Input,Output);
const
	MaxSize=8;
type
	TIndex=Longint;
	TChess=array[0..MaxSize+1,0..MaxSize+1]of Shortint;
var	
	Chess:TChess;
function IsFallen(x,y:TIndex):Boolean;
begin
	Result:=true;
	if 1-Chess[x,y]=Chess[x,y+1] then Exit;
	if 1-Chess[x,y]=Chess[x,y-1] then Exit;
	if 1-Chess[x,y]=Chess[x+1,y+1] then Exit;
	if 1-Chess[x,y]=Chess[x+1,y-1] then Exit;
	if 1-Chess[x,y]=Chess[x+1,y] then Exit;
	if 1-Chess[x,y]=Chess[x-1,y+1] then Exit;
	if 1-Chess[x,y]=Chess[x-1,y-1] then Exit;
	if 1-Chess[x,y]=Chess[x-1,y] then Exit;
	Result:=false;
end;
procedure Main;
var 
	Turn:TIndex;
	x,y:TIndex;
	Ch:Char;
begin
	FillChar(Chess,SizeOf(Chess),255);
	Turn:=0;
	while not Eof do
	begin
		Inc(Turn);
		Read(Ch);
		x:=Ord(Ch)-Ord('a')+1;
		Read(Ch);
		y:=Ord(Ch)-Ord('1')+1;
		Chess[x,y]:=Turn mod 2;
		Readln;
		if IsFallen(x,y) then
		begin
			Writeln(Turn);
			Exit;
		end;
	end;
	Writeln('Draw');
end;
begin
	Main;
end.