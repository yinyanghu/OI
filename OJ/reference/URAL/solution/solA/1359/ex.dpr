program Ural_1359(Input,Output);
const
	MaxN=50;
	MaxM=50;
	MaxValue=MaxLongint div 16;
	g=10;
type
	TIndex=Longint;
	TData=Extended;
	TSpeed=array[0..MaxM]of TData;
	TDP=array[0..MaxN,0..MaxM]of TData;
var
	N,M:TIndex;
	V:TSpeed;
	F:TDP;
procedure Main;
var
	x,y,i,j:TIndex;
	Tmp:TData;
begin
	Readln(N,M);
	for y:=0 to M do
		V[y]:=Sqrt(2*(M-y)*g);
	for x:=0 to N-1 do
		F[x,M]:=MaxValue;
	for y:=M-1 downto 0 do
		for x:=0 to N do
		begin
			F[x,y]:=MaxValue;
			for i:=x to N do
				for j:=y+1 to M do
				begin
					Tmp:=F[i,j]+2*Sqrt(Sqr(i-x)+Sqr(j-y))/(V[j]+V[y]);
					if F[x,y]>Tmp then F[x,y]:=Tmp;
				end;
			if y=0 then Break;
		end;
	Writeln(F[0,0]:0:4);
end;
begin
	Main;
end.