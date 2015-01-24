{
	Author: Amber
	Method: DP (like LCS)
	Clariry: 
		The problem is
		A is subseq of P. B is subseq of Q. A,B is given. Minimize Dist(P,Q).
		F[i,j]= Min(
				F[i-1,j]+D[A[i],MinA[A[i]]]
				F[i,j-1]+D[MinB[B[j]],B[j]]
				F[i-1,j-1]+D[A[i],B[i]]
				)
		Here
		MinA s.t. D[x,MinA[x]]=Min(D[x,y]|for y=1..n)
		MinB s.t. D[MinB[y],y]=Min(D[x,y]|for x=1..n)
	Complexity: O(n^2)
}
program SGU_214(Input,Output);
const
	MaxN=200;
	MaxLen=2000;
type
	TIndex=Longint;
	TDist=array[1..MaxN,1..MaxN]of TIndex;
	TDP=array[0..MaxLen,0..MaxLen]of TIndex;
	TPath=array[0..MaxLen,0..MaxLen]of ShortInt;
	TMin=array[1..MaxN]of TIndex;
	TCodeMap=array[Char]of TIndex;
var
	N,A,B:TIndex;
	D:TDist;
	F:TDP;
	P:TPath;
	StrA,StrB,StrP,StrQ:AnsiString;
	Alphabet:AnsiString;
	MinA,MinB:TMin;
	CodeMap:TCodeMap;

procedure Main;
var
	i,j:TIndex;
	u,v:TIndex;
begin
	//Read data
	Readln(Alphabet);
	N:=Length(Alphabet);
	Readln(StrA);
	A:=Length(StrA);
	Readln(StrB);
	B:=Length(StrB);
	//Read Matrix
	for i:=1 to N do
	begin
		CodeMap[Alphabet[i]]:=i;
		for j:=1 to N do
			Read(D[i,j]);
		Readln;
	end;
	//Preprocess for min 
	for i:=1 to N do
	begin
		MinA[i]:=1;
		for j:=2 to N do
			if D[i,j]<D[i,MinA[i]] then MinA[i]:=j;
	end;
	for j:=1 to N do
	begin
		MinB[j]:=1;
		for i:=2 to N do
			if D[i,j]<D[MinB[j],j] then MinB[j]:=i;
	end;
	//Init for DP
	F[0,0]:=0;
	for i:=1 to A do
	begin
		u:=CodeMap[StrA[i]];
		F[i,0]:=F[i-1,0]+D[u,MinA[u]];
		P[i,0]:=-1;
	end;
	for i:=1 to B do
	begin
		u:=CodeMap[StrB[i]];
		F[0,i]:=F[0,i-1]+D[MinB[u],u];
		P[0,i]:=1;
	end;
	//DP
	for i:=1 to A do
		for j:=1 to B do
		begin
			u:=CodeMap[StrA[i]];
			v:=CodeMap[StrB[j]];
			F[i,j]:=F[i-1,j-1]+D[u,v];
			P[i,j]:=0;
			if F[i,j]>F[i-1,j]+D[u,MinA[u]] then
			begin
				F[i,j]:=F[i-1,j]+D[u,MinA[u]];
				P[i,j]:=-1;
			end;
			if F[i,j]>F[i,j-1]+D[MinB[v],v] then
			begin
				F[i,j]:=F[i,j-1]+D[MinB[v],v];
				P[i,j]:=1;
			end;
		end;
	Writeln(F[A,B]);
	//Print results
	i:=A;
	j:=B;
	StrP:='';
	StrQ:='';
	repeat
		case P[i,j] of
			0:
			begin
				StrP:=StrA[i]+StrP;
				StrQ:=StrB[j]+StrQ;
				Dec(i);
				Dec(j);
			end;
			-1:
			begin
				StrP:=StrA[i]+StrP;
				StrQ:=Alphabet[MinA[CodeMap[StrA[i]]]]+StrQ;
				Dec(i);
			end;
			1:
			begin
				StrP:=Alphabet[MinB[CodeMap[StrB[j]]]]+StrP;
				StrQ:=StrB[j]+StrQ;
				Dec(j);
			end;
		end;
	until (i=0) and (j=0);
	Writeln(StrP);
	Writeln(StrQ);
end;
begin
	Main;
end.