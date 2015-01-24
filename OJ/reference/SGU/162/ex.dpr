{
	Author: Amber
	Method: Math
	Clarity: See readme.gsp
}
program SGU_162(Input,Output);
type
	TData=Extended;
var
	AB,AC,AD,BC,BD,CD:TData;
procedure Main;
var
	AP,AQ:TData;
	PQ:TData;
	AO,OD:TData;
	CosA:TData;
	S:TData;
begin
	Readln(AB,AC,AD,BC,BD,CD);
	AP:=2*AD*(Sqr(AB)+Sqr(AD)-Sqr(BD))/2/AB/AD;
	AQ:=2*AD*(Sqr(AC)+Sqr(AD)-Sqr(CD))/2/AC/AD;
	CosA:=(Sqr(AB)+Sqr(AC)-Sqr(BC))/2/AB/AC;
	PQ:=Sqrt(Sqr(AP)+Sqr(AQ)-2*AP*AQ*CosA);
	AO:=PQ/Sqrt(1-Sqr(CosA))/2;
	OD:=Sqrt(Sqr(AD)-Sqr(AO));
	S:=(AB+AC+BC)/2;
	Writeln(Sqrt(S*(S-AB)*(S-AC)*(S-BC))*OD/3:0:4);
end;
begin
	Main;
end.