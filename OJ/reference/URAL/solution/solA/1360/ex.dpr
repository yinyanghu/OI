{
	Enumerate
	t=(Arcsin(x)+2Pi*k)^2 or (Pi-Arcsin(x)+2Pi*k)^2
	t<=10^12 => k is O(10^6)
}
program Ural_1360(Input,Output);
const
	Range=1E12;
	Limit=159174;//Sqrt(Range)/2/Pi
type
	TIndex=Longint;
	TData=Extended;
var
	x,y,e:TData;
function Check(t:TData):Boolean;
begin
	Result:=true;
	if t<=Range then
		if Abs(Cos(t)-y)<=e then
		begin
			Writeln(t);
			Exit;
		end;
	Result:=false;
end;
function Arcsin(x:TData):TData;
begin
	if x>=1 then
		Result:=Pi/2
	else if x<=-1 then
		Result:=-Pi/2
	else
		Result:=ArcTan(x/Sqrt(1-Sqr(x)));
end;
procedure Main;
var
	k:TIndex;
	tmp:TData;
begin
	Readln(x,y,e);
	tmp:=Arcsin(x);
	for k:=-1 to Limit do
	begin
		if Check(Sqr(tmp+2*Pi*k)) then Exit;
		if Check(Sqr(Pi-tmp+2*Pi*k)) then Exit;
	end;
	Writeln('FAIL');
end;
begin
	Main;
end.