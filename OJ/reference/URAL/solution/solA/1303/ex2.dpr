{
	Greedy
	Base on M
}
program Ural_1303(Input,Output);
const
	MaxM=5000;
type
	TIndex=Longint;
	TPointer=array[0..MaxM]of TIndex;
	TAnswer=array[1..MaxM]of record
		Left,Right:TIndex;
	end;
var
	M:TIndex;
	Left,Right:TPointer;
	Num:TIndex;
	Answer:TAnswer;
procedure Main;
var
	i:TIndex;
	l,r,lp:TIndex;
	BestLeft,BestRight,LastRight:TIndex;
begin
	FillChar(Right,SizeOf(Right),255);
	Readln(M);
	while true do
	begin
		Readln(l,r);
		if (l=0) and (r=0) then Break;
		if (l>=M) or (r<=0) then Continue;
		lp:=l;
		if lp<0 then lp:=0;
		if Right[lp]<r then
		begin
			Left[lp]:=l;
			Right[lp]:=r;
		end;
	end;
	LastRight:=0;
	BestLeft:=-1;
	BestRight:=-1;
	Num:=0;
	for i:=0 to M do
	begin
		if i<=LastRight then
			if Right[i]>BestRight then
			begin
				BestLeft:=Left[i];
				BestRight:=Right[i];
			end;
		if i=LastRight then
		begin
			if BestRight<=LastRight then
			begin
				Writeln('No solution');
				Exit;
			end;
			LastRight:=BestRight;
			Inc(Num);
			Answer[Num].Left:=BestLeft;
			Answer[Num].Right:=BestRight;
		end;
		if LastRight>=M then Break;
	end;
	Writeln(Num);
	for i:=1 to Num do
		Writeln(Answer[i].Left,' ',Answer[i].Right);
end;
begin
	Main;
end.