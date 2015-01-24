{
	Method: DP
	Notice: 
	小技巧
	由于很多状态都是不必要的，不要FillChar,很多不用的内存，是不会计算在内的，可以避免MLE
}
program Ural_1276(Input,Output);
const
	MaxN=40;
type
	TIndex=Longint;
	TCount=Int64;
	TDP=array[Boolean,-1..MaxN,-1..MaxN,-1..MaxN,'A'..'B']of TCount;
var
	N,K:TIndex;
	F:TDP;
	Count:TCount;

procedure Main;
var
	i:TIndex;
	Carriage,Locomotive:String[2];
	c_AA,c_AB,c_BA,c_BB:TIndex;
	i_AA,i_AB,i_BA,i_BB:TIndex;
begin
	Readln(N,K);
	Readln(Locomotive);
	c_AA:=0;
	c_AB:=0;
	c_BA:=0;
	c_BB:=0;
	for i:=1 to N do
	begin
		Readln(Carriage);
		if Carriage='AA' then Inc(c_AA)
		else if Carriage='AB' then Inc(c_AB)
		else if Carriage='BA' then Inc(c_BA)
		else Inc(c_BB);
	end;
	Count:=0;
	//Init
	for i_AA:=-1 to 0 do
		for i_AB:=-1 to 0 do
			for i_BA:=-1 to 0 do
				for i_BB:=-1 to 0 do
				begin
					F[Odd(i_AA),i_AB,i_BA,i_BB,'A']:=0;
					F[Odd(i_AA),i_AB,i_BA,i_BB,'B']:=0;
				end;
	F[Odd(0),0,0,0,Locomotive[2]]:=1;
	for i_AA:=0 to c_AA do
		for i_AB:=0 to c_AB do
			for i_BA:=0 to c_BA do
				for i_BB:=0 to c_BB do
				begin
					if i_AA+i_AB+i_BA+i_BB=0 then Continue;
					F[Odd(i_AA),i_AB,i_BA,i_BB,'A']:=F[Odd(i_AA-1),i_AB,i_BA,i_BB,'A']
						+F[Odd(i_AA),i_AB,i_BA-1,i_BB,'B'];
					F[Odd(i_AA),i_AB,i_BA,i_BB,'B']:=F[Odd(i_AA),i_AB-1,i_BA,i_BB,'A']
						+F[Odd(i_AA),i_AB,i_BA,i_BB-1,'B'];
					if i_AA+i_AB+i_BA+i_BB=K then
						Inc(Count,F[Odd(i_AA),i_AB,i_BA,i_BB,Locomotive[1]]);
				end;
	if Count>0 then
	begin
		Writeln('YES');
		Writeln(Count);
	end
	else 
		Writeln('NO');
end;
begin
	Main;
end.