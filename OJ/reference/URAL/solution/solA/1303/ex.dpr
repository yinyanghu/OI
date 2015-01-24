//18:18 18:34
{
	Greedy
	1.Sort all the segments by left as first key and right as second key
	2.Delete all the segments which are contained.
	  So the rights of all segments in list are EXACTLY INCREASING.
	3.Make greedy:
	  3.1 Let the last segment which contains 0 point be the first segment as current segment
	  3.2 Find the rightest in the suffixes of current segment as current segment.
	  3.3 if current segment >= M then end else goto 3.2.
}
program Ural_1303(Input,Output);
const
	MaxN=100000;
type
	TIndex=Longint;
	TSegment=record
		L,R:TIndex;
	end;
	TSegmentSet=array[1..MaxN]of TSegment;
	TPlan=array[1..MaxN]of TIndex;
var
	N,M,K:TIndex;
	S:TSegmentSet;
	P:TPlan;

function Compare(A,B:TSegment):TIndex;
begin
	Result:=A.L-B.L;
	if Result=0 then Result:=A.R-B.R;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	X,T:TSegment;
begin
	i:=l;
	j:=r;
	X:=S[(i+j) div 2];
	repeat
		while Compare(S[i],X)<0 do Inc(i);
		while Compare(X,S[j])<0 do Dec(j);
		if i<=j then
		begin
			T:=S[i];
			S[i]:=S[j];
			S[j]:=T;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
procedure Uncontain;
var
	i,j,N_:TIndex;
begin
	N_:=0;
	i:=1;
	j:=i+1;
	while j<=N do
		if S[i].L=S[j].L then 
		begin
			Inc(i);
			j:=i+1;
		end 
		else if S[i].R>=S[j].R then 
			Inc(j)
		else 
		begin
			Inc(N_);
			S[N_]:=S[i];
			i:=j;
			j:=i+1;
		end;
	Inc(N_);
	S[N_]:=S[i];
	N:=N_;
end;
procedure Main;
label
	Error;
var
	i,j:TIndex;
begin
	Readln(M);
	N:=0;
	repeat
		Readln(i,j);
		if (i=0) and (j=0) then Break;
		Inc(N);
		S[N].L:=i;
		S[N].R:=j;
	until false;
	QuickSort(1,N);
	Uncontain;
	K:=0;
	for i:=N downto 1 do
		if (S[i].L<=0) and (S[i].R>=0) then 
		begin
			Inc(K);
			P[K]:=i;
			Break;
		end;
	if K=0 then goto Error;
	while (S[P[K]].R<M) and (P[K]<N) do
	begin
		j:=P[K];
		while (j+1<=N) and (S[j+1].L<=S[P[K]].R) do Inc(j);
		if j=P[K] then goto Error;
		Inc(K);
		P[K]:=j;
	end;
	if S[P[K]].R<M then goto Error;
	Writeln(K);
	for i:=1 to K do
		Writeln(S[P[i]].L,' ',S[P[i]].R);
	Exit;
	Error:
	Writeln('No solution');
end;
begin
	Main;
end.