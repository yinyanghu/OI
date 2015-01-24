{
	For any two point, there is only one way between them.
	It's a tree!
	Base on the following fact:
		let x be any node in tree.
		let y be the farthest point of x
		let y' be the farthest point of y
		the longest route must be the way between y and y'.
}
program Ural_1145(Input,Output);
const
	MaxSize=1000;
	MaxQueue=10000;
	WBit=8;
	Direct:array[1..4]of record 
		x,y:longint; 
	end = ((x:-1;y:0),(x:1;y:0),(x:0;y:-1),(x:0;y:1));
type
	TIndex=Longint;
	TState=record
		x,y,Len:TIndex;
	end;
	TBlock=array[1..MaxSize*MaxSize div WBit]of Byte;
	TQueue=array[1..MaxQueue]of TState;
var
	N,M:TIndex;
	Map,Passed:TBlock;
	Queue:TQueue;
	
procedure SetBlock(var Block:TBlock;Index:TIndex;Value:Boolean);
begin
	if Value then
		Block[(Index-1) div WBit+1]:=
			Block[(Index-1) div WBit+1] xor (1 shl ((Index-1) mod WBit));
end;
function GetBlock(const Block:TBlock;Index:TIndex):Boolean;
begin
	Result:=(Block[(Index-1) div WBit+1] and (1 shl ((Index-1) mod WBit))>0)
end;
function BFS(tx,ty:TIndex):TState;
var
	i:TIndex;
	Pop,Push:TIndex;
	CUr:TState;
begin
	Pop:=1;
	Push:=2;
	FillChar(Passed,SizeOf(Passed),0);
	SetBlock(Passed,(tx-1)*N+ty,true);
	Queue[1].x:=tx;
	Queue[1].y:=ty;
	Queue[1].Len:=0;
	Result:=Queue[1];
	repeat
		Cur:=Queue[Pop];
		Inc(Pop);
		if Pop=MaxQueue+1 then Pop:=1;
		for i:=1 to 4 do
		begin
			tx:=Cur.x+Direct[i].x;
			ty:=Cur.y+Direct[i].y;
			if (tx<1) or (tx>M) or (ty<1) or (ty>N) then Continue;
			if GetBlock(Passed,(tx-1)*N+ty) or GetBlock(Map,(tx-1)*N+ty) then Continue;
			SetBlock(Passed,(tx-1)*N+ty,true);
			Queue[Push].x:=tx;
			Queue[Push].y:=ty;
			Queue[Push].Len:=Cur.Len+1;
			if Queue[Push].Len>Result.Len then Result:=Queue[Push];
			Inc(Push);
			if Push=MaxQueue+1 then Push:=1;
		end;
	until Pop=Push;
end;

procedure Main;
var
	i,j,x,y:TIndex;
	Best:TState;
	Ch:Char;
begin
	Readln(N,M);
	x:=0;
	y:=0;
	for i:=1 to M do
	begin
		for j:=1 to N do
		begin
			Read(Ch);
			SetBlock(Map,(i-1)*N+j,(Ch='#'));
			if Ch='.' then
			begin
				x:=i;
				y:=j;
			end;
		end;
		Readln;
	end;
	Best:=BFS(x,y);
	Best:=BFS(Best.x,Best.y);
	Writeln(Best.Len);
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