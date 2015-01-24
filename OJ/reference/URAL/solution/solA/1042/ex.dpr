{
Gauss Elimination - Matrix Triangularize
notice no solution:
4
1 -1
1 -1
2 -1
2 -1
and determinant=0:
2
1 2 -1
1 2 -1
}
program Ural_1042(Input,Output);
const
	MaxN=250;
type
	TIndex=Longint;
	TMatrix=array[1..MaxN,1..MaxN+1]of TIndex;
	TUnknown=array[1..MaxN]of TIndex;
var
	N:TIndex;

procedure Swap(var A,B:TIndex);
var
	T:TIndex;
begin
	T:=A;
	A:=B;
	B:=T;
end;

procedure Triangularize(M:TMatrix;var X:TUnknown); 
var
	i,j,k:TIndex;
	Tmp:TIndex;
begin
	for k:=1 to N do
	begin
		if M[k,k]=0 then
			for i:=k+1 to N do
				if M[i,k]<>0 then
				begin
					for j:=k to N+1 do
						Swap(M[i,j],M[k,j]);
					Break;
				end;
		if M[k,k]<>0 then
			for i:=k+1 to N+1 do
				if M[i,k]<>0 then
				begin
					Tmp:=M[i,k] div M[k,k];
					for j:=k to N+1 do
						M[i,j]:=(M[i,j]-M[k,j]*Tmp) mod 2;
				end;
	end;
	for k:=N downto 1 do
		if M[k,k]<>0 then
		begin
			X[k]:=M[k,N+1];
			for i:=k+1 to N do
				X[k]:=X[k]-M[k,i]*X[i];
			X[k]:=(X[k] div M[k,k]) mod 2; 
		end
		else 
			X[k]:=0; //if x[k]*0=0 then x[k]=0 s.t. shortest solution
end;
procedure Main;
var
	i,j:TIndex;
	M:TMatrix;
	X:TUnknown;
begin
	Readln(N);
	FillChar(M,SizeOf(M),0);
	FillChar(X,SizeOf(X),0);
	for i:=1 to N do
	begin
		while true do
		begin
			Read(j);
			if j=-1 then Break;
			M[j,i]:=1;
			X[j]:=1;
		end;
		Readln;
		M[i,N+1]:=1;
	end;
	for i:=1 to N do
		if X[i]=0 then //if heat i can't be touched
		begin
			Writeln('No solution');
			Exit;
		end;
	Triangularize(M,X);
	for i:=1 to N do
		if (X[i]+2) mod 2=1 then
			Write(i,' ');
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