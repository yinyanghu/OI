program Ural_1006(Input,Output);
const
	W=50;
	H=20;
	MaxN=15;
type
	TIndex=Longint;
	TMap=array[1..W,1..H]of Char;
	TSquare=array[1..MaxN]of record
		X,Y,L:TIndex;
	end;
var
	N:TIndex;
	Map:TMap;
	Square:TSquare;

procedure Main;
var
	x,y,i,j,l:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		with Square[i] do
		begin
			Readln(X,Y,L);
			X:=X+1;
			Y:=Y+1;
		end;
	FillChar(Map,SizeOf(Map),#46);
	for j:=1 to N do
	begin
		x:=Square[j].X;
		y:=Square[j].Y;
		l:=Square[j].L;
		for i:=1 to l do
		begin
			Map[x+i-1,y]:=#196;
			Map[x+i-1,y+l-1]:=#196;
			Map[x,y+i-1]:=#179;
			Map[x+l-1,y+i-1]:=#179;
		end;
		Map[x,y]:=#218;
		Map[x+l-1,y]:=#191;
		Map[x,y+l-1]:=#192;
		Map[x+l-1,y+l-1]:=#217;
	end;
	
	for y:=1 to H do
	begin
		for x:=1 to W do
			Write(Map[x,y]);
		Writeln;
	end;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'o.txt');
	Reset(Input);
	Assign(Output,'ip.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.