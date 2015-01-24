(*
	it's Cayley Code.
	{ai} here ai=i, |a|=n, let A={x|x=ai}
	{bi} is Cayley Code, |b|=n-2, let B={x|x=bi}
	
	for step k (1<=k<=n-1)
		ax=min{x|x in A\B}
		add edge <ax,bk>, and delete ax in {ai} and bk in {bi}
*)
program Ural_1069(Input,Output);
const
	MaxN=7500;
	MaxValue=MaxLongint div 2;
type
	TIndex=Longint;
	TCount=array[1..MaxN]of TIndex;
	TEdge=record
		x,y:TIndex;
	end;
	TEdgeSet=array[1..MaxN*2-2]of TEdge;
var
	N:TIndex;
	A,B:TCount;
	Edge:TEdgeSet;
function Compare(A,B:TEdge):TIndex;
begin
	Result:=A.x-B.x;
	if Result=0 then Result:=A.y-B.y;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TEdge;
begin
	i:=l;
	j:=r;
	Mid:=Edge[(i+j) div 2];
	repeat
		while Compare(Edge[i],Mid)<0 do Inc(i);
		while Compare(Mid,Edge[j])<0 do Dec(j);
		if i<=j then
		begin
			Tmp:=Edge[i];
			Edge[i]:=Edge[j];
			Edge[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Main;
var
	i,j:TIndex;
begin
	N:=0;
	FillChar(A,SizeOf(A),0);
	while not SeekEof do
	begin
		Inc(N);
		Read(B[N]);
		Inc(A[B[N]]);
	end;
	Inc(N);
	j:=1;
	while (A[j]>0) do Inc(j);
	for i:=1 to N-1 do
	begin
		Edge[i*2-1].x:=j;
		Edge[i*2-1].y:=B[i];
		Edge[i*2].x:=B[i];
		Edge[i*2].y:=j;
		A[j]:=MaxValue;
		Dec(A[B[i]]);
		if (A[B[i]]=0)and(B[i]<j) then j:=B[i];
		while (A[j]>0) do Inc(j);
	end;
	QuickSort(1,2*N-2);
	j:=0;
	for i:=1 to N do
	begin
		Write(i,':');
		while (j+1<=2*N-2) and (Edge[j+1].x=i) do 
		begin
			Inc(j);
			Write(' ',Edge[j].y);
		end;
		Writeln;
	end;
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