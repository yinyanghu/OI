{
	Author: Amber
	Method: Euler Path
	Clarity:
		先理解这个图: 它是由若干个子完全图组成, 子完全图中的每个点有且只有一条链与其他的某个点(本子图或其他子图)相连.
		求其hamilton圈,可以先把每个子完全图压缩成一个点(称为团),在这样压缩后的新图上做euler圈,最后再把团展开(入团点->出团点),就是hamliton圈了.
		因为只有团才能为奇点,所以当只有0或1个奇团时问题才有解.

		我程序中Edge为前向星的原边,GrpEdge为团指出去的边(前向星).这样比较方便处理.
	Complexity: O(M)
}
program SGU_156(Input,Output);
const
	MaxN=10000;
	MaxM=100000;
type
	TIndex=Longint;
	TDegree=array[1..MaxN]of TIndex;
	TGroup=array[1..MaxN]of TIndex;
	TLast=array[1..MaxN]of TIndex;
	TEdge=array[1..MaxM*2]of record
		PtrTo,Prev:TIndex;
		Used:Boolean;
	end;
	TGroupEdge=array[1..MaxM]of record
		From,PtrTo,Prev:TIndex;
	end;
var
	N,M:TIndex;
	Deg:TDegree;
	Grp:TGroup;
	Last,GrpLast:TLast;
	Edge:TEdge;
	GrpEdge:TGroupEdge;
	GrpNum,GrpEdgeNum:TIndex;

procedure FindPath(i:TIndex);
var
	Ptr:TIndex;
begin
	if Deg[i]=2 then
	begin
		Ptr:=Last[i];
		while Ptr>0 do
		begin
			with Edge[Ptr] do
				if not Used then
				begin
					Used:=true;
					if Ptr<=M then Edge[Ptr+M].Used:=true
					else Edge[Ptr-M].Used:=true;
					FindPath(PtrTo);
					Write(PtrTo,' ');
				end;
			Ptr:=Edge[Ptr].Prev;
		end;
	end
	else
	begin
		Ptr:=GrpLast[Grp[i]];
		while Ptr>0 do
		begin
			with GrpEdge[Ptr] do
				if not Edge[PtrTo].Used then
				begin
					Edge[PtrTo].Used:=true;
					if PtrTo<=M then Edge[PtrTo+M].Used:=true
					else Edge[PtrTo-M].Used:=true;
					FindPath(Edge[PtrTo].PtrTo);
					Write(Edge[PtrTo].PtrTo,' ',From,' ');
				end;
			Ptr:=GrpEdge[Ptr].Prev;
		end;
	end;
end;
procedure Main;
var
	i:TIndex;
	x,y:TIndex;
	NewGrp:Boolean;
	Ptr:TIndex;
	Count:TIndex;
	OddPoint:TIndex;
begin
	Read(N,M);
	FillChar(Deg,SizeOf(Deg),0);
	FillChar(Grp,SizeOf(Grp),0);
	FillChar(Last,SizeOf(Last),0);
	FillChar(GrpLast,SizeOf(GrpLast),0);
	for i:=1 to M do
	begin
		Read(x,y);
		Inc(Deg[x]);
		Inc(Deg[y]);

		Edge[i].PtrTo:=y;
		Edge[i].Used:=false;
		Edge[i].Prev:=Last[x];
		Last[x]:=i;

		Edge[i+M].PtrTo:=x;
		Edge[i+M].Used:=false;
		Edge[i+M].Prev:=Last[y];
		Last[y]:=i+M;
	end;
	
	GrpNum:=0;
	GrpEdgeNum:=0;
	OddPoint:=0;
	for i:=1 to N do
		if Deg[i]>2 then
		begin
			Count:=1;
			NewGrp:=(Grp[i]=0);
			if NewGrp then
			begin
				Inc(GrpNum);
				Grp[i]:=GrpNum;
			end;
			Ptr:=Last[i];
			while Ptr>0 do
			begin
				with Edge[Ptr] do
					if Deg[PtrTo]=2 then
					begin
						Inc(GrpEdgeNum);
						GrpEdge[GrpEdgeNum].From:=i;
						GrpEdge[GrpEdgeNum].PtrTo:=Ptr;
						GrpEdge[GrpEdgeNum].Prev:=GrpLast[Grp[i]];
						GrpLast[Grp[i]]:=GrpEdgeNum;
					end
					else if NewGrp then
					begin
						Grp[PtrTo]:=GrpNum;
						Inc(Count);
					end;
				Ptr:=Edge[Ptr].Prev;
			end;
			if NewGrp and Odd(Count) then 
				if OddPoint=0 then
					OddPoint:=i
				else
				begin
					Writeln(-1);
					Exit;
				end;
		end;
	if OddPoint=0 then OddPoint:=1;
	FindPath(OddPoint);
	Writeln;
end;
begin
	Main;
end.