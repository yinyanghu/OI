{
	Enumerate all the final state(order)
	And DP Longest Increasing Sequence(LIS) by that order.
}
program Ural_1284(Input,Output);
const
	MaxN=20;
	MaxM=10;
type
	TIndex=Longint;
	TCard=array[1..MaxN]of record
		Value,Suit:TIndex;
	end;
	TList=array[1..MaxN]of TIndex;
	TStore=array[1..MaxM]of record
		Num:TIndex;
		List:TList;
	end;
	TSuit=array[1..MaxM]of TIndex;
	TUsed=array[1..MaxM]of Boolean;
	TPlan=array[1..MaxM]of TIndex;
	TOrder=array[1..MaxN]of TIndex;
	TDP=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	Card:TCard;
	Suit:TSuit;
	Used:TUsed;
	Plan:TPlan;
	Store:TStore;
	Order:TOrder;
	F:TDP;
	Max:TIndex;

procedure QuickSort(var List:TList;l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=List[(i+j) div 2];
	repeat
		while Card[List[i]].Value<Card[Mid].Value do Inc(i);
		while Card[List[j]].Value>Card[Mid].Value do Dec(j);
		if i<=j then
		begin
			Tmp:=List[i];
			List[i]:=List[j];
			List[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(List,l,j);
	if i<r then QuickSort(List,i,r);
end;
function LIS:TIndex;
var
	i,j:TIndex;
begin
	Result:=1;
	for i:=1 to N do
	begin
		F[i]:=1;
		for j:=1 to i-1 do
			if (F[i]<F[j]+1) and (Order[j]<Order[i]) then
				F[i]:=F[j]+1;
		if F[i]>Result then Result:=F[i];
	end;
end;
procedure Search(Depth:TIndex;IsOdd:Boolean);
var
	i,j,k:TIndex;
	Cur:TIndex;
begin
	if Depth=M+1 then
	begin
		k:=0;
		for i:=1 to M do
			with Store[Plan[i]] do
				for j:=1 to Num do
				begin
					Inc(k);
					Order[List[j]]:=k;
				end;
		Cur:=LIS;
		if Cur>Max then Max:=Cur;
		k:=0;
		for i:=1 to M do
			with Store[Plan[i]] do
				for j:=Num downto 1 do
				begin
					Inc(k);
					Order[List[j]]:=k;
				end;
		Cur:=LIS;
		if Cur>Max then Max:=Cur;
		Exit;
	end;
	for i:=1 to M do
		if not Used[i] and (Odd(Suit[i])=IsOdd) then
		begin
			Plan[Depth]:=Suit[i];
			Used[i]:=true;
			Search(Depth+1,not IsOdd);
			Used[i]:=false;
		end;
end;
procedure Main;
var
	i:TIndex;
	OddCount,EvenCount:TIndex;
begin
	FillChar(Store,SizeOf(Store),0);
	Readln(N);
	for i:=1 to N do
		with Card[i] do
		begin
			Readln(Value,Suit);
			with Store[Suit] do
			begin
				Inc(Num);
				List[Num]:=i;
			end;
		end;
	M:=0;
	OddCount:=0;
	EvenCount:=0;
	for i:=1 to MaxM do
		with Store[i] do
			if Num>0 then
			begin
				Inc(M);
				Suit[M]:=i;
				if Odd(i) then Inc(OddCount)
				else Inc(EvenCount);
				QuickSort(List,1,Num);
			end;
	Max:=1;
	FillChar(Used,SizeOf(Used),0);
	if OddCount>=EvenCount then Search(1,true);
	if OddCount<=EvenCount then Search(1,false);
	Writeln(N-Max);
end;
begin
	Main;
end.