{
	�����ε�DP

	���濴n=6�����
	x1+x3+x5=x2+x4+x6  (1)
	x1+x2+x3=x4+x5+x6  (2)
	�������������й����������������̻���Ӱ��
	�ʽ����Ǳ���
	��(1)��: x1-x2+x3=x4-x5+x6 (3)
	��(2)+(3)��: x1+x3=x4+x6   (4)
	��(2)-(3)��: x2=x5         (5)
	(4)��(5)�������̾��ǲ�����Ӱ�����������
	�ֱ������������DP��˺���ǽ���

	��m=n div 2
	��odd(m)
		(4)�ı�����:m-m div 2, viz ceil(m/2)
		(5)�ı�����:m div 2
	��even(m)
		(4)�ı�����:m div 2
		(5)�ı�����:m div 2
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