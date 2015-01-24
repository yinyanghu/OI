{
	数轴形的DP

	下面看n=6的情况
	x1+x3+x5=x2+x4+x6  (1)
	x1+x2+x3=x4+x5+x6  (2)
	由于两个方程有公共变量，两个方程互相影响
	故将他们变形
	由(1)得: x1-x2+x3=x4-x5+x6 (3)
	由(2)+(3)得: x1+x3=x4+x6   (4)
	由(2)-(3)得: x2=x5         (5)
	(4)和(5)两个方程就是不互相影响的两个方程
	分别对他们数轴形DP相乘后就是解数

	令m=n div 2
	当odd(m)
		(4)的变量数:m-m div 2, viz ceil(m/2)
		(5)的变量数:m div 2
	当even(m)
		(4)的变量数:m div 2
		(5)的变量数:m div 2
}
program Ural_1217(Input,Output);
const
	MaxN=20;
	MaxVar=MaxN div 4;
type
	TIndex=Longint;
	TData=Int64;
	TDP=array[0..MaxVar*9]of TData;
var
	N,M:TIndex;
	Fp,Fq:TDP;
	Ans:TData;

procedure Main;
var 
	i,j,k:TIndex;
	Sum:TData;
begin
	Readln(N);
	M:=N div 2;
	FillChar(Fp,SizeOf(Fp),0);
	Fp[0]:=1;
	Ans:=1;
	for i:=1 to M-M div 2 do
	begin
		FillChar(Fq,SizeOf(Fq),0);
		for j:=0 to 9*i do
			for k:=0 to 9 do
				if j-k>=0 then Inc(Fq[j],Fp[j-k]);
		Fp:=Fq;
		if (Odd(M) and (i=M div 2))
			or (i=M-M div 2) then
		begin
			Sum:=0;
			for j:=0 to 9*i do Inc(Sum,Sqr(Fp[j]));
			Ans:=Ans*Sum;
			if not Odd(M) then Ans:=Ans*Sum;
		end;
	end;
	Writeln(Ans);
end;
begin
	Main;
end.