program Ural_1151(Input,Output);
const
	MaxN=10;
	MaxM=20;
	MaxSize=200;
type
	TIndex=Longint;
	TBeacon=record
		Code:TIndex;
		x,y:TIndex;
	end;
	TBeacons=array[1..MaxN]of TBeacon;
	TChecker=record
		x,y:TIndex;
		Distance:array[1..MaxN]of TIndex;
	end;
	TCheckers=array[1..MaxM]of TChecker;
var
	N,M:TIndex;
	B:TBeacons;
	C:TCheckers;

function ReadNum(var St:String;Split:Char):TIndex;
var
	Code:Integer;
begin
	Val(Copy(St,1,Pos(Split,St)-1),Result,Code);
	Delete(St,1,Pos(Split,St));
end;
function Max(A,B:TIndex):TIndex;
begin
	Result:=A;
	if B>A then Result:=B;
end;
procedure Main;
var
	i,j,k:TIndex;
	x,y:TIndex;
	St:String;
	Found:TIndex;
	Valid:Boolean;
	TmpB:TBeacon;
	Tmp:TIndex;
	Code:TIndex;
	Count:TIndex;
begin
	//read in
	Readln(M);
	N:=0;
	for i:=1 to M do
	begin
		Readln(St);
		St:=St+',';
		C[i].x:=ReadNum(St,',');
		C[i].y:=ReadNum(St,':');
		FillChar(C[i].Distance,SizeOf(C[i].Distance),255);
		while St<>'' do
		begin
			Code:=ReadNum(St,'-');
			Found:=0;
			for j:=1 to N do
				if B[j].Code=Code then 
				begin
					Found:=j;
					Break;
				end;
			if Found=0 then 
			begin
				Inc(N);
				B[N].Code:=Code;
				Found:=N;
			end;
			C[i].Distance[Found]:=ReadNum(St,',');
		end;
	end;
	//sort
	for i:=1 to N-1 do
	begin
		k:=i;
		for j:=i+1 to N do
			if B[k].Code>B[j].Code then
				k:=j;
		TmpB:=B[i];
		B[i]:=B[k];
		B[k]:=TmpB;
		for j:=1 to M do
		begin
			Tmp:=C[j].Distance[i];
			C[j].Distance[i]:=C[j].Distance[k];
			C[j].Distance[k]:=Tmp;
		end;
	end;
	//find and print
	for i:=1 to N do
	begin
		Count:=0;
		for x:=0 to MaxSize do
		begin
			for y:=0 to MaxSize do
			begin
				Valid:=true;
				for j:=1 to M do
					if (C[j].Distance[i]>=0) and (C[j].Distance[i]<>Max(Abs(x-C[j].x),Abs(y-C[j].y))) then
					begin
						Valid:=false;
						Break;
					end;
				if Valid then 
				begin
					Inc(Count);
					B[i].x:=x;
					B[i].y:=y;
				end;
				if Count>1 then Break;
			end;
			if Count>1 then Break;
		end;
		Write(B[i].Code,':');
		if Count=1 then 
			Writeln(B[i].x,',',B[i].y)
		else
			Writeln('UNKNOWN');

	end;
end;
begin
	Main;
end.