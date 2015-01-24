{
	Find Negative Cycle
}
program Ural_1237(Input,Output);
const
	MaxSize=100;
	MaxNum=MaxSize*2+1;
	MaxEdge=MaxSize*MaxSize*2+MaxNum*2;
	MaxQueueLen=MaxNum*2;
	MaxValue=MaxLongint div 16;
type
	TIndex=Longint;
	TData=Longint;
	TEdge=array[1..MaxEdge]of record
		Prev,PtrTo:TIndex;
		Weight:TData;
	end;
	TLast=array[1..MaxNum]of TIndex;
	TFather=array[1..MaxNum]of TIndex;
	TUsed=array[1..MaxNum]of Boolean;
	TCount=array[1..MaxNum]of TIndex;
	TDist=array[1..MaxNum]of TData;
	TQueue=array[1..MaxQueueLen]of TIndex;
	TPointSet=array[1..MaxSize]of record
		x,y,c,f:TIndex;
	end;
	TGraph=array[1..MaxSize,1..MaxSize]of TIndex;
var
	N,M:TIndex;
	Num:TIndex;
	ENum:TIndex;
	Edge:TEdge;
	Last:TLast;
	Father:TFather;
	Used:TUsed;
	Dist:TDist;
	Count:TCount;
	Queue:TQueue;
	Blt,Slt:TPointSet;
	Graph:TGraph;

procedure InsertEdge(u,v,w:TIndex);
begin
	Inc(ENum);
	Edge[ENum].PtrTo:=v;
	Edge[ENum].Weight:=w;
	Edge[ENum].Prev:=Last[u];
	Last[u]:=ENum;
end;
procedure Init;
var
	i,j:TIndex;
begin
	FillChar(Last,SizeOf(Last),0);
	FillChar(Blt,SizeOf(Blt),0);
	FillChar(Slt,SizeOf(Slt),0);
	Readln(N,M);
	for i:=1 to N do
		with Blt[i] do
			Readln(x,y,c);
	for i:=1 to M do
		with Slt[i] do
			Readln(x,y,c);
	ENum:=0;
	for i:=1 to N do
		for j:=1 to M do
		begin
			Read(Graph[i,j]);
			Inc(Blt[i].f,Graph[i,j]);
			Inc(Slt[j].f,Graph[i,j]);
			InsertEdge(i,j+N,Abs(Blt[i].x-Slt[j].x)+Abs(Blt[i].y-Slt[j].y));
			if Graph[i,j]>0 then InsertEdge(j+N,-i,-(Abs(Blt[i].x-Slt[j].x)+Abs(Blt[i].y-Slt[j].y)));
		end;
	for i:=1 to M do
	begin
		if Slt[i].f<Slt[i].c then InsertEdge(i+N,N+M+1,0);
		if Slt[i].f>0 then InsertEdge(N+M+1,-(i+N),0);
	end;
	Num:=N+M+1;
end;
procedure Change(u,v,d:TIndex);
begin
	if (u=Num) or (v=Num) then Exit;
	if u>N then u:=u-N;
	if v>N then v:=v-N;
	Inc(Graph[u,v],d);
end;
procedure Improve(u:TIndex);
var
	i,j:TIndex;
begin
	FillChar(Used,SizeOf(Used),0);
	repeat
		Used[u]:=true;
		u:=Abs(Father[u]);
	until Used[u];
	FillChar(Used,SizeOf(Used),0);
	repeat
		Used[u]:=true;
		if Father[u]>0 then
			Change(Father[u],u,1)
		else
			Change(u,-Father[u],-1);
		u:=Abs(Father[u]);
	until Used[u];
	for i:=1 to N do
	begin
		for j:=1 to M do
			Write(Graph[i,j],' ');
		Writeln;
	end;
end;
procedure SPFA;
var
	u,v:TIndex;
	Pop,Push:TIndex;
	Ptr:TIndex;
begin
	for u:=1 to Num do
	begin
		Dist[u]:=MaxValue;
		Father[u]:=0;
		Used[u]:=false;
		Count[u]:=0;
	end;
	Dist[Num]:=0;
	Used[Num]:=true;
	Queue[1]:=Num;
	Count[Num]:=1;
	Pop:=1;
	Push:=2;
	while Pop<>Push do
	begin
		u:=Queue[Pop];
		Inc(Pop);
		if Pop>MaxQueueLen then Pop:=1;
		Ptr:=Last[u];
		while Ptr>0 do
		begin
			v:=Abs(Edge[Ptr].PtrTo);
			if Dist[v]>Dist[u]+Edge[Ptr].Weight then
			begin
				Dist[v]:=Dist[u]+Edge[Ptr].Weight;
				if Edge[Ptr].PtrTo>0 then Father[v]:=u
				else Father[v]:=-u;
				Inc(Count[v]);
				if Count[v]=Num then //Find Negative Cycle
				begin
					Writeln('SUBOPTIMAL');
					Improve(v);
					Exit;
				end;
				if not Used[v] then
				begin
					Used[v]:=true;
					Queue[Push]:=v;
					Inc(Push);
					if Push>MaxQueueLen then Push:=1;
				end;
			end;
			Ptr:=Edge[Ptr].Prev;
		end;
		Used[u]:=false;
	end;
	Writeln('OPTIMAL');
end;
procedure Main;
begin
	Init;
	SPFA;
end;
begin
	Main;
end.

