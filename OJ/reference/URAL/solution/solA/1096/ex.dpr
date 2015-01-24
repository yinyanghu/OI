{
this problem can use Dijkstra
but i use BFS
note: the shown number of exchange plate must be in current plate.
      but the hidden number of exchange plate needn't be in current plate.
}
program Ural_1096(Input,Output);
const
	MaxN=1000+1;
type
	TIndex=Longint;
	TCheck=array[1..MaxN]of Boolean;
	TKey=array[1..MaxN]of record
		KeyX,KeyY:TIndex;
	end;
	TQueue=array[1..MaxN]of TIndex;
	TParent=array[1..MaxN]of TIndex;
	TPath=array[1..MaxN]of TIndex;
var
	N:TIndex;
	Goal:TIndex;
	D:TKey;
	Parent:TParent;
	Queue:TQueue;
	Check:TCheck;
	Path:TPath;

procedure Main;
var
	i:TIndex;
	Total,Current,Step,Final:TIndex;
begin
	Readln(N);
	for i:=1 to N do
		Readln(D[i].KeyX,D[i].KeyY);
	Readln(Goal,D[N+1].KeyX,D[N+1].KeyY);
	//BFS
	FillChar(Check,SizeOf(Check),0);
	Parent[1]:=0;
	Queue[1]:=N+1;
	Check[N+1]:=true;
	Total:=1;
	Current:=1;
	Final:=0;
	while Current<=Total do
	begin
		if (D[Queue[Current]].KeyX=Goal) or (D[Queue[Current]].KeyY=Goal) then 
		begin
			Final:=Current;
			Break;
		end;
		for i:=1 to N do
			if not Check[i] and ((D[i].KeyX=D[Queue[Current]].KeyX) or (D[i].KeyX=D[Queue[Current]].KeyY)) then
			begin
				Inc(Total);
				Queue[Total]:=i;
				Parent[Total]:=Current;
				Check[i]:=true;
			end;
		Inc(Current);
	end;
	if Final=0 then Writeln('IMPOSSIBLE')
	else
	begin
		Step:=0;
		Current:=Final;
		while Parent[Current]>0 do
		begin
			Inc(Step);
			Path[Step]:=Queue[Current];
			Current:=Parent[Current];
		end;
		Writeln(Step);
		for i:=Step downto 1 do
			Writeln(Path[i]);
	end;
end;
begin
{    Assign(Input, 'i.txt');
    Reset(Input);
    Assign(Output, 'o.txt');
    Rewrite(Output);}
    Main;
   { Close(Input);
    Close(Output);}
end.