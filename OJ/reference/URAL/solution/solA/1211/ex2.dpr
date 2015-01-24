{
	character 1: no circle
	character 2: finally only one root
	character 3: only one directed edge for one node
	so this is a tree!
}
program Ural_1211(Input,Output);
const
	MaxN=25000;
type
	TIndex=Longint;
	TChild=record
		Father,Visited:TIndex;
	end;
	TChildren=array[1..MaxN]of TChild;
var
	N:TIndex;
	Child:TChildren;

function IsTree:Boolean;
var
	i,j:TIndex;
	Total,Group:TIndex;
begin
	Result:=false;
	FillChar(Child,SizeOf(Child),0);
	Readln(N);
	Total:=0;
	for i:=1 to N do
	begin
		Read(Child[i].Father);
		if Child[i].Father=i then Child[i].Father:=0;
		if Child[i].Father=0 then 
		begin
			Inc(Total);
			Child[i].Visited:=-1;
		end;
	end;
	Readln;
	if Total<>1 then Exit;
	Group:=0;
	for i:=1 to N do
		if Child[i].Visited=0 then
		begin
			j:=i;
			Inc(Group);
			while Child[j].Visited=0 do
			begin
				Child[j].Visited:=Group;
				j:=Child[j].Father;
			end;
			if Child[j].Visited=Group then Exit;
		end;
	Result:=true;
end;
procedure Main;
var
	DataNum:TIndex;
begin
	Readln(DataNum);
	while DataNum>0 do
	begin
		Dec(DataNum);
		if IsTree then 
			Writeln('YES')
		else 
			Writeln('NO');
	end;
end;
begin
{	Assign(Input, 'i.txt');
	Reset(Input);
	Assign(Output, 'o2.txt');
	Rewrite(Output);}
	Main;
{	Close(Input);
	Close(Output);}
end.