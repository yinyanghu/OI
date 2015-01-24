{
	Author: Amber
	Method: Math
	Clarity:
		预处理：
		令T=(A,B,N), A=A/T,B=B/T,N=N/T, 
		现在(A,B,N)=1，它的解原来原来的解可以一一对应: 解(A,B)->解(A*T, B*T)
		
		以下都是在mod N意义下的，k为正整数
		证明: 解(kA,kB) (0<=k<N) 就是问题的全部解
			kA 能取 P=[A,N]/A 个值,同样 kB 能取 Q=[B,N]/B 个值, 这样 解(kA,kB) 能取[P,Q]个值。
			下证 若(A,B,N)=1 则[P,Q]=N
			由AB=(A,B)[A,B] 得P=N/(A,N),Q=N/(B,N)
			又得 (A,N)*P=(B,N)*Q=N
			又由(A,B,N)=((A,N),(B,N))=1,得[P,Q]=N
}
program SGU_119(Input,Output);
const 
	MaxN=10000;
type
	TIndex=Longint;
	TAnswer=record
		A,B:TIndex;
	end;
	TAnswerList=array[1..MaxN]of TAnswer;
var
	N,A,B:TIndex;
	D:TAnswerList;
function Compare(X,Y:TAnswer):TIndex;
begin
	Result:=X.A-Y.A;
	if Result=0 then Result:=X.B-Y.B;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TAnswer;
begin
	i:=l;
	j:=r;
	Mid:=D[(l+r) div 2];
	repeat
		while Compare(D[i],Mid)<0 do Inc(i);
		while Compare(Mid,D[j])<0 do Dec(j);
		if i<=j then
		begin
			Tmp:=D[i];
			D[i]:=D[j];
			D[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
function GCD(A,B:TIndex):TIndex;
begin
	if A<B then Result:=GCD(B,A)
	else if B=0 then Result:=A
	else Result:=GCD(B,A mod B);
end;
procedure Main;
var
	i:TIndex;
	T:TIndex;
begin
	Readln(N,A,B);
	T:=GCD(GCD(A,B),N);
	N:=N div T;
	A:=A div T;
	B:=B div T;
	for i:=0 to N-1 do
	begin
		D[i+1].A:=A*i mod N;
		D[i+1].B:=B*i mod N;
	end;
	QuickSort(1,N);
	Writeln(N);
	for i:=1 to N do
		Writeln(D[i].A*T,' ',D[i].B*T);
end;
begin
	Main;
end.