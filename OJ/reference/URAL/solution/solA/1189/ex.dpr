{
	N=(11x+y)*10^L+2*z
	0<=y<=9
	=>
	x=N div 10^L div 11
	y=N div 10^L mod 11
	z=(N mod 10^L) div 2
	or
	z=(10^(L+1)+ N mod 10^L) div 2 //½øÎ»
}
program Ural_1189(Input,Output);
const
	MaxAnswerNum=50;
	Power10:array[0..9]of Longint=(1,10,100,1000,10000,100000,1000000,10000000,100000000,1000000000);
type
	TIndex=Longint;
	TAnswer=array[1..MaxAnswerNum]of TIndex;
var
	N:TIndex;
	Num:TIndex;
	Answer:TAnswer;
procedure Divide(Cur,Shift,Remain:TIndex);
begin
	if Cur<=0 then Exit;
	if Cur mod 11<=9 then
	begin
		Inc(Num);
		Answer[Num]:=(Cur div 11*10+Cur mod 11)*Power10[Shift]+Remain;
	end;
	if not Odd(Cur) then
	begin
		Divide(Cur div 10,Shift+1,Remain+Cur mod 10 div 2*Power10[Shift]);
		Divide(Cur div 10-1,Shift+1,Remain+(10+Cur mod 10) div 2*Power10[Shift]);
	end;
end;
procedure Sort;
var
	i,j:TIndex;
	Tmp:TIndex;
	OldNum:TIndex;
begin
	//bubble sort
	for i:=1 to Num-1 do
		for j:=i+1 to Num do
			if Answer[i]>Answer[j] then
			begin
				Tmp:=Answer[i];
				Answer[i]:=Answer[j];
				Answer[j]:=Tmp;
			end;
	//make unique
	i:=1;
	OldNum:=Num;
	Num:=0;
	while i<=OldNum do
	begin
		j:=i+1;
		while (Answer[i]=Answer[j]) and (j<=OldNum) do Inc(j);
		Inc(Num);
		Answer[Num]:=Answer[i];
		i:=j;
	end;
end;
procedure Print;
var
	i:TIndex;
	Len:TIndex;
	St:String;
begin
	Writeln(Num);
	for i:=1 to Num do
	begin
		Str(Answer[i],St);
		Len:=Length(St);
		Write(St,' + ');
		Str(N-Answer[i]:Len-1,St);
		while Pos(' ',St)>0 do St[Pos(' ',St)]:='0';
		Writeln(St,' = ',N);
	end;
end;
procedure Main;
begin
	Readln(N);
	Num:=0;
	Divide(N,0,0);
	Sort;
	Print;
end;
begin
	Main;
end.
