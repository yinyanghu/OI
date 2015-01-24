{
	Gauss Eliminate
}
program Ural_1266(Input,Output);
const
	MaxN=20;
	MaxM=200;
	MaxLimit=10000;
	Precision=1E-7;
type
	TIndex=Longint;
	TData=Extended;
	TResistor=array[1..MaxN,1..MaxN]of TData;
	TEdgeIndex=array[1..MaxN,1..MaxN]of TIndex;
	TState=array[1..MaxN]of TIndex;
	TFather=array[1..MaxN]of TIndex;
	TEquation=array[1..MaxM+1]of TData;
	TEquations=array[1..MaxM]of TEquation;
var
	N,M:TIndex;
	R:TResistor;
	P:TEdgeIndex;
	State:TState;
	EquNum:TIndex;
	Path:TEquation;
	Equ:TEquations;
	Father:TFather;

procedure DFS(i:TIndex);
var
	j,k:TIndex;
	DotEqu:TEquation;
begin
	State[i]:=1;
	FillChar(DotEqu,SizeOf(DotEqu),0);
	for j:=1 to N do
		if P[i,j]>0 then
		begin
			if i<j then
				DotEqu[P[i,j]]:=1
			else
				DotEqu[P[i,j]]:=-1;
			if State[j]=0 then
			begin
				Father[j]:=i;
				DFS(j);
			end
			else if (State[j]=1) and (j<>Father[i]) then
			begin
				k:=i;
				Inc(EquNum);
				repeat
					Equ[EquNum][P[Father[k],k]]:=R[Father[k],k];
					k:=Father[k];
				until k=j;
				Equ[EquNum][P[i,j]]:=R[i,j];
				EquNum:=EquNum+1-1;
			end;
		end;
	if i<N then
	begin
		if i=1 then DotEqu[M+1]:=1;
		Inc(EquNum);
		Equ[EquNum]:=DotEqu;
	end;
	State[i]:=2;
end;
procedure CreateEquations;
var
	i,j,t:TIndex;
	TM:TIndex;
begin
	FillChar(R,SizeOf(R),0);
	FillChar(P,SizeOf(P),0);
	M:=0;
	Readln(N,TM);
	while TM>0 do
	begin
		Dec(TM);
		Readln(i,j,t);
		if R[i,j]=0 then
		begin
			Inc(M);
			R[i,j]:=t;
			P[i,j]:=M;
		end
		else
			R[i,j]:=R[i,j]*t/(R[i,j]+t);
	end;

	for i:=1 to N-1 do
		for j:=i+1 to N do
		begin
			R[j,i]:=-R[i,j];
			P[j,i]:=P[i,j];
		end;

	FillChar(State,SizeOf(State),0);
	FillChar(Path,SizeOf(Path),0);
	FillChar(Equ,SizeOf(Equ),0);
	EquNum:=0;
	Father[1]:=0;
	DFS(1);
	i:=N;
	repeat
		Path[P[Father[i],i]]:=R[Father[i],i];
		i:=Father[i];
	until i=1;
end;
procedure GaussEliminate;
var
	i,j,k:TIndex;
	Cur:TIndex;
	Tmp:TEquation;
	X:TEquation;
	Ans,Sum:TData;
	Zoom:TData;
begin
	for i:=1 to M do
	begin
		Cur:=0;
		for j:=i to M do
			if (Abs(Equ[j,i])>Precision) then
			begin
				Cur:=j;
				Break;
			end;
		if Cur=0 then Exit;
		for j:=i to M do
			if (j<>Cur) and (Abs(Equ[j,i])>Precision) then
			begin
				Zoom:=Equ[Cur,i]/Equ[j,i];
				for k:=M+1 downto i+1 do
					Equ[j,k]:=Equ[j,k]*Zoom-Equ[Cur,k];
				Equ[j,i]:=0;
			end;
		Tmp:=Equ[i];
		Equ[i]:=Equ[Cur];
		Equ[Cur]:=Tmp;
	end;
	Ans:=0;
	for i:=M downto 1 do
	begin
		Sum:=Equ[i,M+1];
		for j:=i+1 to M do
			Sum:=Sum-X[j]*Equ[i,j];
		X[i]:=Sum/Equ[i,i];
		Ans:=Ans+Path[i]*X[i];
	end;
	Writeln(Ans:0:2);
end;
procedure Main;
begin
	CreateEquations;
	GaussEliminate;
end;
begin
	Main;
end.