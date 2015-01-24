{
	刚学Euler,只会标准方法DFS,但由于空间问题开不了邻接矩阵.
	拖了好久,后来发现,本题给了现成的圈,Euler就是圈套圈,即圈上的一个结点可以展开为另一个圈.
	所以只要直接做,就是对于递归处理圈,对于圈上的点,能展开则展开,用递归处理展开.处理过的圈打上标记就是了.
}
program Ural_1137(Input,Output);
const
	MaxN=100;
	MaxM=1000;
type
	TIndex=Longint;
	TRouteSet=array[1..MaxN]of record
		Len:TIndex;
		Select:Boolean;
		Stop:array[0..MaxM]of Integer;
	end;
	TRoute=record
		Len:TIndex;
		Stop:array[1..MaxN*MaxM]of Integer;
	end;
var
	N:TIndex;
	S:TRouteSet;
	R:TRoute;

procedure FindRoute(CurR,Start:TIndex);
var
	i,j,k:TIndex;
	SelR:TIndex;
begin
	S[CurR].Select:=true;
	for i:=1 to S[CurR].Len do
	begin
		j:=(Start+i) mod S[CurR].Len;
		Inc(R.Len);
		R.Stop[R.Len]:=S[CurR].Stop[j];
		for SelR:=1 to N do
			if not S[SelR].Select then
			begin
				for k:=0 to S[SelR].Len-1 do
					if S[SelR].Stop[k]=S[CurR].Stop[j] then
					begin
						FindRoute(SelR,k);
						Break;
					end;
			end;
	end;
end;

procedure Main;
var
	i,j:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Read(S[i].Len);
		for j:=0 to S[i].Len do Read(S[i].Stop[j]);
		Readln;
		S[i].Select:=false;
	end;
	R.Len:=0;
	FindRoute(1,0);
	for i:=1 to N do
		if not S[i].Select then
		begin
			Writeln(0);
			Exit;
		end;
	Write(R.Len,' ',R.Stop[R.Len]);
	for i:=1 to R.Len do
		Write(' ',R.Stop[i]);
	Writeln;
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