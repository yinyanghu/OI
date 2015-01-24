{
	Tree DP
}
program Ural_1389(Input,Output);
const
	MaxN=100000;
	MaxM=MaxN*2;
type
	TIndex=Longint;
	TLast=array[1..MaxN]of TIndex;
	TUsed=array[1..MaxN]of Boolean;
	TFather=array[1..MaxN]of TIndex;
	TQueue=array[1..MaxN]of TIndex;
	TDP=array[1..MaxN]of record
		Unselect:TIndex;
		Mayselect:TIndex;
		Ptr:TIndex;
		Ifunselect:Boolean;
	end;
	TEdge=array[1..MaxM]of record
		PtrTo,Prev:TIndex;
	end;
var
	N,M:TIndex;
	Q:TQueue;
	F:TDP;
	Last:TLast;
	Edge:TEdge;
	Used:TUsed;
	Father:TFather;

procedure Update(var x:TIndex;y:TIndex;var p:TIndex;q:TIndex);
begin
	if x<y then
	begin
		x:=y;
		p:=q;
	end;
end;
procedure Main;
var
	i:TIndex;
	x,y:TIndex;
	Ptr:TIndex;
	Pop,Push:TIndex;
begin
	Readln(N,M);
	FillChar(Last,SizeOf(Last),0);
	for i:=1 to M do
	begin
		Readln(x,y);
		Edge[i].PtrTo:=y;
		Edge[i].Prev:=Last[x];
		Last[x]:=i;
		Edge[i+M].PtrTo:=x;
		Edge[i+M].Prev:=Last[y];
		Last[y]:=i+M;
	end;

	FillChar(Used,SizeOf(Used),0);
	Pop:=1;
	Push:=2;
	Q[1]:=1;
	Father[1]:=0;
	while Pop<Push do
	begin
		x:=Q[Pop];
		Inc(Pop);
		Used[x]:=true;
		Ptr:=Last[x];
		while Ptr>0 do
		begin
			with Edge[Ptr] do
				if not Used[PtrTo] then
				begin
					Q[Push]:=PtrTo;
					Father[PtrTo]:=x;
					Inc(Push);
				end;
			Ptr:=Edge[Ptr].Prev;
		end;
	end;
	
	FillChar(F,SizeOf(F),0);
	for i:=N downto 2 do
	begin
		Inc(F[Q[i]].Mayselect,F[Q[i]].Unselect);
		Inc(F[Father[Q[i]]].Unselect,F[Q[i]].Mayselect);
		Update(F[Father[Q[i]]].Mayselect,F[Q[i]].Unselect-F[Q[i]].Mayselect+1,F[Father[Q[i]]].Ptr,Q[i]);
	end;
	Writeln(F[1].Mayselect+F[1].Unselect);
	for i:=1 to N do
		if not F[Q[i]].Ifunselect and (F[Q[i]].Ptr>0) then 
		begin
			Writeln(Q[i],' ',F[Q[i]].Ptr);
			F[F[Q[i]].Ptr].Ifunselect:=true;
		end;
end;
begin
	Main;
end.