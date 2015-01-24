{
	see note.doc
}
program Ural_1159(Input,Output);
const
	MaxN=100;
	Infinite=1E10;
	Epsilon=1E-15;
type
	TIndex=Longint;
	TData=Extended;
	TLength=array[1..MaxN]of TData;
var
	N:TIndex;
	L:TLength;
function Compare(A,B:TData):TIndex;
var
	T:TData;
begin
	T:=A-B;
	if Abs(T)<Epsilon then Result:=0
	else if T>0 then Result:=1
	else Result:=-1;
end;
function Halen(A,B,C:TData):TData;
var
	S:TData;
begin
	S:=(A+B+C)/2;
	Result:=Sqrt(S*(S-A)*(S-B)*(S-C));
end;
function ArcSin(x:TData):TData;
begin
	if Sqr(x)=1 then
		Result:=Pi/2
	else 
		Result:=ArcTan(x/Sqrt(1-Sqr(x)));
end;
function GetAngleSum(R:TData):TData;
var
	i:TIndex;
begin
	Result:=0;
	for i:=1 to N do
		Result:=Result+2*ArcSin(L[i]/2/R);
end;
procedure Main;
var
	i,j:TIndex;
	T,R:TData;
	Left,Right,Sum,Area:TData;
begin
	Readln(N);
	Sum:=0;
	for i:=1 to N do
	begin
		Readln(L[i]);
		Sum:=Sum+L[i];
	end;
	//L[1] is maximum
	j:=1;
	for i:=2 to N do
		if L[j]<L[i] then
			j:=i;
	T:=L[1];
	L[1]:=L[j];
	L[j]:=T;
	if Sum-L[1]<=L[1] then 
	begin
		Writeln('0.00');
		Exit;
	end;
	Left:=L[1]/2;
	Right:=Sum/2;
	R:=0;
	Area:=0;
	case Compare(GetAngleSum(L[1]/2),2*Pi) of
		1://the centre of circumcircle inside the polygon
		while true do
		begin
			R:=(Left+Right)/2;
			case Compare(GetAngleSum(R),2*Pi) of
				-1:Right:=R;
				0:Break;
				1:Left:=R;
			end;
		end;
		-1://the centre of circumcircle outside the polygon
		begin
			Right:=Infinite;
			while true do
			begin
				R:=(Left+Right)/2;
				case Compare(GetAngleSum(R)-2*ArcSin(L[1]/2/R),2*ArcSin(L[1]/2/R)) of
					-1:Left:=R;
					0:Break;
					1:Right:=R;
				end;
			end;
			Area:=-2*Halen(L[1],R,R);
		end;
		0://the centre of circumcircle on the polygon 
		R:=L[1]/2;
	end;
	for i:=1 to N do
		Area:=Area+Halen(L[i],R,R);
	Writeln(Area:0:2);
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