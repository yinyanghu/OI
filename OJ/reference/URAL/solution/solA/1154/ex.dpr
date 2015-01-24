{
	Notice:
	一定要考虑0时刻。
	虽然最小值一定出现在拐点上，但是因为要求最小值，第一个拐点的值可能和0点的值一样，所以这时0要输出。
}
program Ural_1154(Input,Output);
const
	OneDay=24*60*60;
type
	TIndex=Longint;
	TData=Extended;
	TInfo=array[1..4]of record
		HighTime,HighValue,LowTime,LowValue:TIndex;
		Count:TIndex;
	end;
var
	Earliest:TIndex;
	Differ:TData;
	D:TInfo;

function CodeToID(Ch:Char):TIndex;
begin
	case Ch of 
		'A':Result:=1;
		'E':Result:=2;
		'F':Result:=3;
		'W':Result:=4;
		else Result:=0;
	end;
end;
function TimeToNum(St:String):TIndex;
var
	T:TIndex;
	Code:Integer;
begin
	Val(Copy(St,1,2),T,Code);
	Result:=T*60*60;
	Val(Copy(St,4,2),T,Code);
	Inc(Result,T*60);
	Val(Copy(St,7,2),T,Code);
	Inc(Result,T);
end;
procedure StartContest(Time:TIndex);
var
	i:TIndex;
	Sum,Cur:TData;
	High,Low:TIndex;
begin
	Sum:=0;
	for i:=1 to 4 do
	begin
		High:=D[i].HighTime;
		Low:=D[i].LowTime;
		if (Low<Time) and (High<Time) then
			if Low<High then
				Inc(Low,OneDay)
			else
				Inc(High,OneDay)
		else if (Low>Time) and (High>Time) then
			if Low<High then
				Dec(High,OneDay)
			else
				Dec(Low,OneDay);
		Cur:=(Time-Low)*(D[i].HighValue-D[i].LowValue)/(High-Low)+D[i].LowValue;
		Sum:=Sum+D[i].Count*Cur;
	end;
	if (Sum>Differ) or ((Sum=Differ) and (Time<Earliest)) then
	begin
		Earliest:=Time;
		Differ:=Sum;
	end;
end;
procedure PrintTime(X:TIndex);
begin
	Writeln(X div 60 div 60 div 10,X div 60 div 60 mod 10,':',
		X div 60 mod 60 div 10,X div 60 mod 60 mod 10,':',
		X mod 60 div 10,X mod 60 mod 10);
end;
procedure Main;
var
	i:TIndex;
	St:String;
	Ch:Char;
	Cur:TIndex;
	Code:Integer;
	Positive:Boolean;
begin
	for i:=1 to 4 do
	begin
		Readln(St);
		Cur:=CodeToID(St[1]);
		D[Cur].HighTime:=TimeToNum(Copy(St,3,8));
		Delete(St,1,1+1+8+1);
		Val(Copy(St,1,Pos(' ',St)-1),D[Cur].HighValue,Code);
		Delete(St,1,Pos(' ',St));
		D[Cur].LowTime:=TimeToNum(Copy(St,1,8));
		Delete(St,1,8+1);
		Val(St,D[Cur].LowValue,Code);
		D[Cur].Count:=0;
	end;
	for Positive:=true downto false do
	begin
		while not Eoln do
		begin
			Read(Ch);
			if Positive then
				Inc(D[CodeToID(Ch)].Count)
			else 
				Dec(D[CodeToID(Ch)].Count);
		end;
		Readln;
	end;
	Earliest:=OneDay;
	Differ:=0;
	StartContest(0); //important
	for i:=1 to 4 do
	begin
		StartContest(D[i].HighTime);
		StartContest(D[i].LowTime);
	end;
	if Differ=0 then 
		Writeln('We can''t win!')
	else
	begin
		PrintTime(Earliest);
		Writeln(Differ:0:2);
	end;
end;
begin
	Main;
end.