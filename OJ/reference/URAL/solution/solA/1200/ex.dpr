{
	a math problem about the optimal value of quadratic function
	AC
}
{$N+}
program Ural_1200(Input,Output);
type
	TIndex=Longint;
	TData=Extended;
var
	A,B:TData;
	N,Limit,BestLimit,BestHorn:TIndex;
	Max:TData;
function Cost(Horn:TIndex):TData;
begin
	Result:=-2*Horn*Horn+(A-B+2*Limit)*Horn+B*Limit-Limit*Limit; //Ax+(Limit-x)B-x^2-(Limit-x)^2
end;
procedure SetMax(Horn:TIndex);
begin
	if (Horn<0) or (Horn>Limit) then Exit; //Check the Domain
	if (Cost(Horn)>Max) or ((Cost(Horn)=Max) and (Horn<BestHorn)) then
	begin
		Max:=Cost(Horn);
		BestLimit:=Limit;
		BestHorn:=Horn;
	end;
end;
procedure Main;
var
	K:TIndex;
begin
	Readln(A,B,N);
	Max:=0;
	BestLimit:=0;
	BestHorn:=0;
	for K:=0 to N do
	begin
		Limit:=K;  
		SetMax(0); //the border of the domain
		SetMax(K); //the border of the domain
		SetMax(Trunc((A-B+2*K)/4));//an integer near Optimal Value 
		SetMax(Trunc((A-B+2*K)/4)+1);//an integer near Optimal Value 
	end;
	Writeln(Max:0:2);
	Writeln(BestHorn,' ',BestLimit-BestHorn);
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