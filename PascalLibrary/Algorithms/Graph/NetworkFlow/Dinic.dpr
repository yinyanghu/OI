(*
	Project: Amber Standard Sources Library [ASSL]
	Author: Amber
	Title: Dinic
	Category: Network Flow - Maximum Flow
	Version: 1.0
	Date: 2007-1-24
	Remark: Ford Fulkerson Method, Adjacency List Implementation, Find Minimum Cut
	Complexity: O(N^2M)
	Tested Problems: NOI 2006 Profit
*)
program ASSL_Dinic(Input, Output);
const
	Infinity = 1000000;
	MaxNodeNum = 5000;
	MaxEdgeNum = 50000;
type
	TIndex = Longint;
	TCapacity = Longint;
	TEdge = record
		Start, Target: TIndex;
		Flow, Capa: TCapacity;
		Prev: TIndex;
	end;
	TNetwork = object
	public
		procedure ClearFlow;
		procedure Initialize(FSource, FSink, FNodeNum: TIndex);
		procedure InsertEdge(FStart, FTarget: TIndex; FCapa: TCapacity; FFlow: TCapacity = 0);
		procedure Dinic;
		function GetFlowValue: TCapacity;
		procedure FindCut;

	private
		NodeNum, EdgeNum: TIndex;
		Source, Sink: TIndex;
		Edge: array [1..MaxEdgeNum] of TEdge;
		Last, LastBackup: array [1..MaxNodeNum] of TIndex;

		TotalFlow: TCapacity;
		Used: array [1..MaxNodeNum] of Boolean;
		Pred: array [1..MaxNodeNum] of TIndex;
		Dist: array [1..MaxNodeNum] of TIndex;
		Queue: array [1..MaxNodeNum] of TIndex;

		function SetDistLabel: Boolean;
		function FindPath(Cur: TIndex; var Delta: TCapacity): Boolean;
		procedure Augment(Delta: TIndex);
		function Opposite(Ptr: TIndex): TIndex;
		procedure DFS(Cur: TIndex);
	end;

procedure TNetwork.ClearFlow;
var
	i: TIndex;
begin
	for i := 1 to EdgeNum do
		Edge[i].Flow := 0;
end;
procedure TNetwork.InsertEdge(FStart, FTarget: TIndex; FCapa: TCapacity; FFlow: TCapacity = 0);
begin
	Inc(EdgeNum);
	with Edge[EdgeNum] do
	begin
		Start := FStart;
		Target := FTarget;
		Flow := FFlow;
		Capa := FCapa;
		Prev := Last[Start];
		Last[Start] := EdgeNum;
	end;
	Inc(EdgeNum);
	with Edge[EdgeNum] do
	begin
		Start := FTarget;
		Target := FStart;
		Flow := -FFlow;
		Capa := 0;
		Prev := Last[Start];
		Last[Start] := EdgeNum;
	end;
end;
procedure TNetwork.Initialize(FSource, FSink, FNodeNum: TIndex);
begin
	Source := FSource;
	Sink := FSink;
	NodeNum := FNodeNum;
	EdgeNum := 0;
	FillChar(Last, SizeOf(Last), 0);
end;
function TNetwork.Opposite(Ptr: TIndex): TIndex;
begin
	if Odd(Ptr) then
		Result := Ptr + 1
	else
		Result := Ptr - 1;
end;
function TNetwork.SetDistLabel: Boolean;
var
	Pop, Push: TIndex;
	Ptr: TIndex;
	Cur: TIndex;
begin
	Result := false;
	FillChar(Used, SizeOf(Used), 0);
	Pop := 1;
	Push := 2;
	Queue[1] := Source;
	Used[Source] := true;
	Dist[Source] := 0;
	while Pop < Push do
	begin
		Cur := Queue[Pop];
		Inc(Pop);
		Ptr := Last[Cur];
		while Ptr > 0 do
			with Edge[Ptr] do
			begin
				if Flow < Capa then
					if not Used[Target] then
					begin
						Queue[Push] := Target;
						Inc(Push);
						Used[Target] := true;
						Dist[Target] := Dist[Start] + 1;
						if Used[Sink] then Result := true;
					end;
				Ptr := Prev;
			end;
	end;
end;
function TNetwork.FindPath(Cur: TIndex; var Delta: TCapacity): Boolean;
begin
	Used[Cur] := true;
	Result := true;
	if Cur = Sink then Exit;
	while Last[Cur] > 0 do
		with Edge[Last[Cur]] do
		begin
			if (Dist[Target] = Dist[Start] + 1) and not Used[Target] and (Flow < Capa) then
			begin
				if FindPath(Target, Delta) then
				begin
					Pred[Target] := Last[Cur];
					if Delta > Capa - Flow then Delta := Capa - Flow;
					Exit;
				end;
			end;
			Last[Cur] := Prev;
		end;
	Result := false;
end;
procedure TNetwork.Augment(Delta: TIndex);
var
	Cur: TIndex;
	Ptr: TIndex;
begin
	Cur := Sink;
	TotalFlow := TotalFlow + Delta;
	repeat
		Ptr := Pred[Cur];
		with Edge[Ptr] do
		begin
			Flow := Flow + Delta;
			Edge[Opposite(Ptr)].Flow := Edge[Opposite(Ptr)].Flow - Delta;
			Cur := Start;
		end;
	until Cur = Source;
end;
procedure TNetwork.Dinic;
var
	Delta: TCapacity;
begin
	TotalFlow := 0;
	LastBackup := Last;
	while SetDistLabel do
	begin
		repeat
			FillChar(Used, SizeOf(Used), 0);
			Delta := Infinity;
			if not FindPath(Source, Delta) then Break;
			Augment(Delta);
		until false;
		Last := LastBackup;
	end;
end;
function TNetwork.GetFlowValue: TCapacity;
begin
	Result := TotalFlow;
end;
procedure TNetwork.DFS(Cur: TIndex);
var
	Ptr: TIndex;
begin
	Used[Cur] := true;
	Ptr := Last[Cur];
	while Ptr > 0 do
		with Edge[Ptr] do
		begin
			if not Used[Target] and (Flow < Capa) then
				DFS(Target);
			Ptr := Prev;
		end;
end;
procedure TNetwork.FindCut;
begin
	FillChar(Used, SizeOf(Used), 0);
	DFS(Source);
end;
var
	N, M: TIndex;
	Network: TNetwork;

procedure Main;
var
	i: TIndex;
	x, y: TIndex;
	Value: TCapacity;
begin
	Readln(M, N);
	Network.Initialize(1, N, N);
	for i := 1 to M do
	begin
		Readln(x, y, Value);
		Network.InsertEdge(x, y, Value);
	end;
	Network.Dinic;
	{Network.FindCut;
	for i := 1 to N do
		if Network.Used[i] then
			Writeln(i);}
	Writeln(Network.GetFlowValue);
end;
begin
	Main;
end.
