{
	Author: Amber
	Method: Normal-DP
	Clarity:
		��n*n�����Ϸ�k����ķ�����

		����������Ⱦ�ɺڰ׸�(��+,-��ʾ)���磺
		+-+-+
		-+-+-
		+-+-+
		-+-+-
		+,-֮��ĸ��Ӳ�����Ӱ�졣��+,-�������(�ֱ��Ϊcase A,case B)��������45����ת��
		case A  case B:
		  +       -- 
		 +++     ----
		+++++    ----
		 +++      -- 
		  +          
		�������԰��󿴳��ǳ�(��ֱ��)����������ԭ�����ǵȼ۵ġ����⻹���Եȼ�ת��Ϊ��
		  +       -- 
		  +       -- 
		 +++     ----
		 +++     ----
		+++++        
		
		�� n(i) Ϊ ��i�еĸ�����
		F(i,j)=  //ǰi��Ҫ��j����
				F(i-1,j)+ //���в���
				F(i-1,j-1)*(n(i)-j+1) //���з�, ������ n(i)-(j-1) �֣���Ϊj-1�����Ѿ��źã�ռ��ǡ��j-1�С�
		�����������ֱ���case A,case B.
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