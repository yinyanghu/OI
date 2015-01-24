{
	Author: Amber
	Method: Normal-DP
	Clarity:
		求n*n棋盘上放k个象的方案数

		把棋盘相间的染成黑白格(用+,-表示)，如：
		+-+-+
		-+-+-
		+-+-+
		-+-+-
		+,-之间的格子不互相影响。把+,-分离出来(分别称为case A,case B)，把棋盘45度旋转。
		case A  case B:
		  +       -- 
		 +++     ----
		+++++    ----
		 +++      -- 
		  +          
		这样可以把象看成是车(走直线)。这个问题和原问题是等价的。问题还可以等价转换为：
		  +       -- 
		  +       -- 
		 +++     ----
		 +++     ----
		+++++        
		
		令 n(i) 为 第i行的格子数
		F(i,j)=  //前i行要放j个象
				F(i-1,j)+ //本行不放
				F(i-1,j-1)*(n(i)-j+1) //本行放, 方法有 n(i)-(j-1) 种，因为j-1个象已经放好，占了恰好j-1列。
		按上述方法分别处理case A,case B.
	Complexity: O(n^2)
	Notice:
		1)
			When N=1, case A and case B are overlap.So do special processing.
		2)
			Assign i bishops to case A, and K-i bishops to case B.
			s.t. 0<=i<=NumA, 0<=K-i<=NumB 
			Let Left=Max(0,K-NumB) Right=Min(NumA,K)
			So Left<=i<=Right
}
program SGU_220(Input,Output);
const
	MaxN=10;
type
	TIndex=Longint;
	TCount=Int64;
	TDP=array[0..MaxN]of TCount;
var
	N,K:TIndex;
	Count:TCount;
procedure DP(First,Level:TIndex;var Num:TIndex;var F:TDP);
var
	i,j:TIndex;
begin
	FillChar(F,SizeOf(F),0);
	F[0]:=1;
	F[1]:=First;
	Num:=First;
	for i:=2 to Level do
	begin
		Inc(Num,Ord(Odd(i))*2);
		for j:=Num downto 1 do
			Inc(F[j],F[j-1]*(Num-j+1));
	end;
end;
procedure Main;
var
	i:TIndex;
	Fp,Fq:TDP;
	Last,Left,Right:TIndex;
begin
	Readln(N,K);
	if N=1 then
	begin
		if K<=1 then 
			Writeln(1)
		else 
			Writeln(0);
		Exit;
	end;
	Left:=0;
	Right:=K;
	DP(1,N,Last,Fp);
	if Last<Right then Right:=Last;
	DP(2,N-1,Last,Fq);
	if K-Last>Left then Left:=K-Last;
	Count:=0;
	for i:=Left to Right do
		Inc(Count,Fp[i]*Fq[K-i]);
	Writeln(Count);
end;
begin
	Main;
end.