(*
	DP:
	f(n,m)=min{f(n-1,m-k)+cost(n,k)|0<=k<=Nn}
*)
program Ural_1342(Input,Output);
const
	MaxN=1000;
	MaxM=1000;
	MaxValue=1E10;
type
	TIndex=Longint;
	TData=Extended;
	TWorkshop=array[1..MaxN]of record
		First,Last:TData;
		Num:TIndex;
	end;
	TDP=array[Boolean]of array[0..MaxM]of TData;
var
	N,M:TIndex;
	W:TWorkshop;
	F:TDP;

function MinSpecial(A,B:TIndex):TIndex; //Special is to keep B>=0
begin
	if B<0 then Result:=A
	else if A<B then Result:=A
	else Result:=B;
end;
procedure Main;
var
	i,j,k:TIndex;
	Sum:TIndex;
	Price:TData;
	Cur:Boolean;
begin
	Readln(N,M);
	for i:=1 to N do
		Readln(W[i].Num,W[i].First,W[i].Last);
	//Initialize
	Cur:=false;
	Sum:=0;
	for i:=0 to M do F[Cur][i]:=MaxValue; 
	F[Cur][0]:=0;
	
	for i:=1 to N do
	begin
		Cur:=not Cur;
		F[Cur]:=F[not Cur];

		if W[i].Num=1 then Price:=0
		else Price:=(W[i].Last-W[i].First)/(W[i].Num-1);

		for k:=0 to W[i].Num do
			for j:=0 to MinSpecial(Sum,M-k) do 
				if F[Cur][j+k]>F[not Cur][j]+W[i].First*k+Price*k*(k-1)/2 then
					F[Cur][j+k]:=F[not Cur][j]+W[i].First*k+Price*k*(k-1)/2;
		Inc(Sum, W[i].Num);
	end;
	//Output
	for i:=M downto 0 do
		if F[Cur][i]<MaxValue then
		begin
			if i<M then Writeln('Maximum possible amount: ',i);
			Writeln('Minimum possible cost: ',F[Cur][i]:0:2);
			Break;
		end
	
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