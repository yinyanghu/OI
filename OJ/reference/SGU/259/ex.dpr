{
	Author: Amber
	Method: Greedy
	Clarity: 
		���ڴ�ӡ����ʱ����һ����
		ϣ�������ӡ���ͳ���ʱ�価����
		̰��: �ͳ���ʱ��Խ����Խ���ӡ
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