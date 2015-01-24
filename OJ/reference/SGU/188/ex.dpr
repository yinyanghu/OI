{
	Author: Amber
	Method: Simulate
	Clarity:
		1.Enumerate any i,j
		2.Find first meeting distance Delta of i,j, and then they will complete a circle together for each meeting
		So solve (Delta+Len*k)/(|Vi|+|Vj|)<=T, k is integer, k+1 is the number of i,j meeting.
	Complexity: O(N^2)
}


program SGU_188(Input,Output);

const
	MaxN=20;

Len=1000;
type
	TIndex=Longint;
	TLocation=array[1..MaxN]of TIndex;
	TSpeed=array[1..MaxN]of TIndex;
	TCount=array[1..MaxN]of TIndex;


var
	N,T:TIndex;
	L:TLocation;
	V:TSpeed;
	C:TCount;


	
procedure Main;

var
	i,j:TIndex;
	Delta,Speed,Times:TIndex;

begin
	Readln(N,T);

	for i:=1 to N do
		Read(L[i]);
	
Readln;
	for i:=1 to N do
		Read(V[i]);
	
Readln;
	FillChar(C,SizeOf(C),0);
	
for i:=1 to N-1 do
		
for j:=i+1 to N do
		begin
	
		if V[i]*V[j]>0 then Continue;
	
		Delta:=L[j]-L[i];
	
		if Delta*V[i]<0 then Delta:=Len-Abs(Delta); //Different direction between Delta and V[i]
		
	if Delta<0 then Delta:=-Delta;
	
		Speed:=Abs(V[i])+Abs(V[j]);
	
		if T*Speed-Delta<0 then Continue;

			Times:=1+(T*Speed-Delta) div Len; //(Delta+k*Len)/Speed<=T
			Inc(C[i],Times);
		
	Inc(C[j],Times);
	
	end;

	Write(C[1]);

	for i:=2 to N do

		Write(' ',C[i]);

	Writeln;
end;

begin

	Main;

end.