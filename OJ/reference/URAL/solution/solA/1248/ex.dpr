program Ural_1248(Input,Output);
const
	MaxLen=100+20;
type
	TIndex=Longint;
	THP=array[-MaxLen..MaxLen]of ShortInt;

procedure IncHP(var A:THP;const B:THP);
var
	i:TIndex;
	R:TIndex;
begin
	R:=0;
	for i:=-MaxLen to MaxLen do
	begin
		Inc(A[i],B[i]+R);
		R:=0;
		if A[i]>9 then
		begin
			Dec(A[i],10);
			R:=1;
		end;
	end;
end;
procedure Main;
var
	N:TIndex;
	E:TIndex;
	St:String;
	Sum,Cur:THP;
	i:TIndex;
	Code:Integer;
begin
	Readln(N);
	FillChar(Sum,SizeOf(Sum),0);
	while N>0 do
	begin
		Dec(N);
		//Str to HP
		Readln(St);
		if Pos('E',St)>0 then St[Pos('E',St)]:='e';
		if Pos('e',St)=0 then
			E:=0
		else
		begin
			Val(Copy(St,Pos('e',St)+1,Length(St)-Pos('e',St)),E,Code);
			Delete(St,Pos('e',St),Length(St)-Pos('e',St)+1);
		end;
		if Pos('.',St)>0 then
		begin
			Dec(E,Length(St)-Pos('.',St));
			Delete(St,Pos('.',St),1);
		end;
		FillChar(Cur,SizeOf(Cur),0);
		for i:=1 to Length(St) do
			Cur[E+i-1]:=Ord(St[Length(St)-i+1])-Ord('0');
		//Calculate
		IncHP(Sum,Cur);
	end;
	E:=MaxLen;
	while Sum[E]=0 do Dec(E); //it's impossible than Sum=0  Writeln('0.000000000000000000e0')
	//Round
	if Sum[E-19]>4 then 
	begin
		FillChar(Cur,SizeOf(Cur),0);
		Cur[E-18]:=1;
		IncHP(Sum,Cur);
		//An important step, E may increase after round
		while Sum[E]=0 do Inc(E);
	end;
	//Output
	Write(Sum[E],'.');
	for i:=1 to 18 do
		Write(Sum[E-i]);
	Writeln('e',E);
end;
begin
	Main;
end.