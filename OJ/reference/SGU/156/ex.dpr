{
	Author: Amber
	Method: Euler Path
	Clarity:
		��������ͼ: ���������ɸ�����ȫͼ���, ����ȫͼ�е�ÿ��������ֻ��һ������������ĳ����(����ͼ��������ͼ)����.
		����hamiltonȦ,�����Ȱ�ÿ������ȫͼѹ����һ����(��Ϊ��),������ѹ�������ͼ����eulerȦ,����ٰ���չ��(���ŵ�->���ŵ�),����hamlitonȦ��.
		��Ϊֻ���Ų���Ϊ���,���Ե�ֻ��0��1������ʱ������н�.

		�ҳ�����EdgeΪǰ���ǵ�ԭ��,GrpEdgeΪ��ָ��ȥ�ı�(ǰ����).�����ȽϷ��㴦��.
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