{
	Author: Amber
	Method: Greedy
	Clarity: 
		由于打印的总时间是一定的
		希望后面打印的送出的时间尽量短
		贪心: 送出的时间越长的越早打印
	Complexity: O(n^2) for sort
				O(n) for greedy
}
program SGU_259(Input,Output);
const
	MaxN=100;
type
	TIndex=Longint;
	TLeaflet=record
		Print,Deliver:TIndex;
	end;
	TLeafletSet=array[1..MaxN]of TLeaflet;
var 
	N:TIndex;
	Leaflet:TLeafletSet;

procedure Main;
var 
	i,j:TIndex;
	Tmp:TLeaflet;
	S,Max:TIndex;
begin
	//Read Data 
	Readln(N);
	for i:=1 to N do
		Read(Leaflet[i].Print);
	Readln;
	for i:=1 to N do
		Read(Leaflet[i].Deliver);
	Readln;
	//Sort by Decrease Deliver
	for i:=1 to N-1 do
		for j:=i+1 to N do
			if Leaflet[i].Deliver<Leaflet[j].Deliver then
			begin
				Tmp:=Leaflet[i];
				Leaflet[i]:=Leaflet[j];
				Leaflet[j]:=Tmp;
			end;
	//Greedy
	S:=0;
	Max:=0;
	for i:=1 to N do
	begin
		Inc(S,Leaflet[i].Print);
		if Max<S+Leaflet[i].Deliver then
			Max:=S+Leaflet[i].Deliver;
	end;
	Writeln(Max);
end;
begin
	Main;
end.