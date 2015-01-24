{
	Method: Enumerate
	Notice:
		O(N^4)
		由于本题很难出现极端情况,效果一般在O(N^3)左右
}
program Ural_1221(Input,Output);
const
	MaxN=100;
type
	TIndex=Longint;
	TData=array[1..MaxN,1..MaxN]of TIndex;
var
	N:TIndex;
	D:TData;
function GetSum(x,y,xe,ye,Times:TIndex):TIndex;
begin
	Result:=0;
	while Times>0 do
	begin
		Dec(Times);
		Inc(Result,D[x,y]);
		Inc(x,xe);
		Inc(y,ye);
	end;
end;
procedure Main;
label 
	Invalid;
var
	i,j,k,p:TIndex;
	Max:TIndex;
begin
	while not Eof do
	begin
		Readln(N);
		if N=0 then Break;
		for i:=1 to N do
		begin
			for j:=1 to N do
				Read(D[i,j]);
			Readln;
		end;
		Max:=0;
		for i:=2 to N-1 do
			for j:=2 to N-1 do
			if D[i,j]=0 then
			begin
				for k:=1 to N do
				begin
					if (i-k<1) or (j-k<1) or (i+k>N) or (j+k>N) then Break;
					if (GetSum(i-k,j,1,1,k+1)>0)
						or (GetSum(i,j+k,1,-1,k+1)>0) 
						or (GetSum(i+k,j,-1,-1,k+1)>0) 
						or (GetSum(i,j-k,-1,1,k+1)>0) then 
							Break;
					if k<=Max then Continue;
					for p:=1 to k do
						if (GetSum(i-k,j+p,1,1,k-p+1)<k-p+1) 
							or (GetSum(i+p,j+k,1,-1,k-p+1)<k-p+1) 
							or (GetSum(i+k,j-p,-1,-1,k-p+1)<k-p+1) 
							or (GetSum(i-p,j-k,-1,1,k-p+1)<k-p+1) then
								goto Invalid;
					Max:=k;
					Invalid: Continue;
				end;
			end;
		if Max=0 then 
			Writeln('No solution')
		else 
			Writeln(Max*2+1);
	end;
end;
begin
	Main;
end.