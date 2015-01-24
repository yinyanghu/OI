{
	WA 1 times
	note :output list which must be printed in converse order.
}
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
	
function FindSquare:Boolean;
label 
	BreakOut,Found;
var
	x,y,l,i:TIndex;
begin
	Result:=true;
	for x:=1 to W do
		for y:=1 to H do
			if (Map[x,y]=#218) or (Map[x,y]='?') then
			begin
				l:=2;
				while (x+l-1<=W) and (y+l-1<=H) do
				begin
					if ((Map[x+l-1,y]=#191) or (Map[x+l-1,y]='?'))
						and ((Map[x,y+l-1]=#192) or (Map[x,y+l-1]='?')) then
						begin
							for i:=x+1 to x+l-2 do
								if not ((Map[i,y+l-1]=#196) or (Map[i,y+l-1]='?')) then goto BreakOut;
							for i:=y+1 to y+l-2 do
								if not ((Map[x+l-1,i]=#179) or (Map[x+l-1,i]='?')) then goto BreakOut;
							if not ((Map[x+l-1,y+l-1]=#217) or (Map[x+l-1,y+l-1]='?')) then goto BreakOut;

							for i:=1 to l do
								if (Map[x+i-1,y]<>'?') or (Map[x+i-1,y+l-1]<>'?')
								or (Map[x,y+i-1]<>'?') or (Map[x+l-1,y+i-1]<>'?') then 
									goto Found;
							goto BreakOut;

							Found:
							Inc(N);
							Square[N].X:=x;
							Square[N].Y:=y;
							Square[N].L:=l;
							for i:=1 to l do
							begin
								Map[x+i-1,y]:='?';
								Map[x+i-1,y+l-1]:='?';
								Map[x,y+i-1]:='?';
								Map[x+l-1,y+i-1]:='?';
							end;
							Exit;
							BreakOut:
							if (Map[x+l-1,y]=#191) or (Map[x,y+l-1]=#192) then Break;
						end;
					if not (((Map[x+l-1,y]=#196) or (Map[x+l-1,y]='?'))
						and ((Map[x,y+l-1]=#179) or (Map[x,y+l-1]='?'))) then Break;
					Inc(l);
				end;
			end;
	Result:=false;
end;
procedure Main;
var
	i,j:TIndex;
begin
	for j:=1 to H do
	begin
		for i:=1 to W do
			Read(Map[i,j]);
		Readln;
	end;
	N:=0;
	while FindSquare do ;
	Writeln(N);
	for i:=N downto 1 do //note: list must be printed in converse order.
		with Square[i] do
			Writeln(X-1,' ',Y-1,' ',L);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.