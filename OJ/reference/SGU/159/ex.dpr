{
	Author: Amber
	Method: HP
	Clarity: 
		性质P: n位数x的平方后n位仍为x.称有性质P的数为"P数".
		一个显然的推论: n位P数必要条件是它的后n-1位是P数.
		于是: 枚举第n位，把的n-1位P数转移到n位的P数.
		这样维护一个扩展队列就可以了
		剩下是高精度的问题了
}
program SGU_159(Input,Output);
const
	MaxBased=36;
	MaxN=2000;
type
	TIndex=Longint;
	TDigit=SmallInt;
	THP=array[1..MaxN]of TDigit;
	TExpandQueue=array[1..MaxBased]of record
		Num,Res:THP;
	end;
var
	N,B:TIndex;
	Q:array[Boolean] of TExpandQueue;

procedure Print(const Num:THP;Len:TIndex);
var
	i:TIndex;
begin
	for i:=Len downto 1 do
		if Num[i]>9 then
			Write(Chr(Num[i]-10+Ord('A')))
		else
			Write(Num[i]);
	Writeln;
end;
procedure Main;
var 
	i,j,d,l:TIndex;
	Count,NewCount:TIndex;
	Cur:Boolean;
begin
	Readln(B,N);
	//Init for 1-length number
	Cur:=true;
	Count:=0;
	for d:=0 to B-1 do
		if (d*d) mod B=d then
		begin
			Inc(Count);
			with Q[Cur][Count] do
			begin
				Num[1]:=d;
				Res[2]:=(d*d) div B;
				Res[1]:=(d*d) mod B;
			end;
		end;
	//expand
	for l:=2 to N do
	begin
		Cur:=not Cur;
		NewCount:=0;
		for i:=1 to Count do
			for d:=Ord(l=N) to B-1 do //Cuz no leading zero, when l=N, d<>0
				if (d*Q[not Cur][i].Num[1]*2+Q[not Cur][i].Res[l]) mod B=d then 
					//the l-th digit of the number and the square are d.
				begin
					Inc(NewCount);
					Move(Q[not Cur][i].Num,Q[Cur][NewCount].Num,SizeOf(TDigit)*(l-1));
					if 2*l>N then
						Q[Cur][NewCount].Res:=Q[not Cur][i].Res
					else
						Move(Q[not Cur][i].Res,Q[Cur][NewCount].Res,SizeOf(TDigit)*2*l);
					Q[Cur][NewCount].Num[l]:=d;
					with Q[Cur][NewCount] do
						for j:=1 to l do
						begin
							if j+l-1>N then Break;
							Inc(Res[j+l-1],Num[j]*Num[l]*2);
							if j=l then Dec(Res[j+l-1],Num[j]*Num[l]); //minus repeated value.
							if j+l<=N then Inc(Res[j+l],Res[j+l-1] div B);
							Res[j+l-1]:=Res[j+l-1] mod B;
						end;
				end;
		Count:=NewCount;
	end;
	Writeln(Count);
	for i:=1 to Count do
		Print(Q[Cur][i].Num,N);
end;
begin
	Main;
end.