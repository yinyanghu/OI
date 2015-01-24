{
	Set-DP
	F(S,i,k)
	S is the visited set.
	i is current node.
	k=1 denotes being in the train from 1 to N.
	k=2 denotes being in the train from N to 1.
}
program Ural_1267(Input,Output);
const
	MaxChar=64;//for FillChar
	MaxValue=MaxChar shl 24+MaxChar shl 16+MaxChar shl 8+MaxChar;//4Char to Longint
	MaxN=16;
type
	TIndex=Longint;
	TData=Longint;
	TSum=array[1..MaxN]of TData;
	TDP=array[0..1 shl (MaxN-1)-1,1..MaxN,1..2]of TData;
	//Start can't be in S. Compress it.
	TCode=array[1..MaxN]of TIndex;
var
	N:TIndex;
	Sum:TSum;
	Code:TCode;
	F:TDP;
	Start:TIndex;
	Time1,Time2,Interval:TData;

procedure Update(var A:TData;B:TData);
begin
	if A>B then A:=B;
end;
function ModPos(X:TData):TData; //Keep the value positive
begin
	Result:=(X mod Interval+Interval) mod Interval;
end;
procedure Main;
var
	i,j,S:TIndex;
	Ans:TData;
begin
	Readln(N);
	if N=1 then
	begin
		Writeln(0);
		Exit;
	end;

	Sum[1]:=0;
	for i:=2 to N do
	begin
		Read(Sum[i]);
		Inc(Sum[i],Sum[i-1]);
	end;
	Readln(Start);
	Readln(Interval,Time1,Time2);

	for i:=1 to Start-1 do
		Code[i]:=1 shl (i-1);
	for i:=Start+1 to N do
		Code[i]:=1 shl (i-2);

	FillChar(F,SizeOf(F),63);
	F[0,Start,1]:=0;
	F[0,Start,2]:=0;
	for S:=0 to 1 shl (N-1)-2 do
		for i:=1 to N do
			if (F[S,i,1]<MaxValue) or (F[S,i,2]<MaxValue) then
				for j:=1 to N do
					if (Code[j] and S=0) and (j<>Start) then
						if i<j then
						begin
							Update(F[S or Code[j],j,1],F[S,i,1]+Abs(Sum[i]-Sum[j])+Interval);
							Update(F[S or Code[j],j,2],F[S,i,1]+Abs(Sum[i]-Sum[j])+1
								+ModPos(Time2+Abs(Sum[j]-Sum[N])-Time1-Abs(Sum[1]-Sum[j])-1));
						end
						else if i>j then
						begin
							Update(F[S or Code[j],j,2],F[S,i,2]+Abs(Sum[i]-Sum[j])+Interval);
							Update(F[S or Code[j],j,1],F[S,i,2]+Abs(Sum[i]-Sum[j])+1
								+ModPos(Time1+Abs(Sum[1]-Sum[j])-Time2-Abs(Sum[j]-Sum[N])-1));
						end;

	Ans:=MaxValue;
	for i:=1 to Start-1 do
		Update(Ans,F[1 shl (N-1)-1,i,1]+Sum[Start]-Sum[i]);
	for i:=Start+1 to N do
		Update(Ans,F[1 shl (N-1)-1,i,2]+Sum[i]-Sum[Start]);
	Writeln(Ans);
end;
begin
	Main;
end.