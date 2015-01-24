{
	Author: Amber
	Method: Math
	Clarity:
		Discuss
		Odd(N)
			Ans=N div 2 , cuz GCD(Ans,Ans*2+1)=1
		Even(N)
			Odd(N div 2)
				Ans=N div 2-1, cuz GCD(Ans,2(Ans+1))=1
			Even(N div 2)
				Ans=N div 2-2, cuz GCD(Ans,2(Ans+2))=1
		
}
program SGU_193(Input,Output);
const
	MaxLen=2000;
type
	TIndex=Longint;
	TNumber=array[1..MaxLen]of ShortInt;
var
	Len:TIndex;
	Num:AnsiString;
procedure DecHP;
var
	i:TIndex;
begin
	Dec(Num[Len]);
	i:=Len;
	while (Num[i]<'0') and (i>=1) do
	begin
		Inc(Num[i],10);
		Dec(Num[i-1]);
		Dec(i);
	end;
	if (Num[1]='0') then
	begin
		Delete(Num,1,1);
		Dec(Len);
	end;
end;
procedure Main;
var
	i:TIndex;
	NumOdd:Boolean;
	Remain:TIndex;
begin
	Readln(Num);
	Len:=Length(Num);
	NumOdd:=Odd(Ord(Num[Len])-Ord('0'));
	
	//Divide 2
	Remain:=0;
	for i:=1 to Len do
	begin
		Remain:=Remain*10+Ord(Num[i])-Ord('0');
		Num[i]:=Chr(Ord('0')+Remain div 2);
		Remain:=Remain mod 2;
	end;
	i:=1;
	while (i<Len) and (Num[i]='0') do Inc(i);
	Delete(Num,1,i-1);
	Len:=Length(Num);
	
	//
	if not NumOdd then
	begin
		DecHP;
		if not Odd(Ord(Num[Len])-Ord('0')) then DecHP;
	end;
	Writeln(Num);
end;
begin
	Main;
end.
