{
	Max-Min Search
}
program Ural_1195(Input,Output);
const 
	N=3;
	MaxValue=MaxLongint div 8;
type
	TIndex=Longint;
	TChess=array[1..N,1..N]of Char;
	TUsed=array[1..3]of Boolean;
	TPointSet=array[1..3]of record
		x,y:TIndex;
	end;
var
	Num:TIndex;
	Used:TUsed;
	Chess:TChess;
	P:TPointSet;

function MultiChar(Ch:Char;Times:TIndex):String;
var 
	i:TIndex;
begin
	Result:='';
	for i:=1 to Times do
		Result:=Result+Ch;
end;
function Check:TIndex;
label
	Crosses,Ouths;
var 
	i,j:TIndex;
	St:String;
begin
	for i:=1 to N do
	begin
		St:='';
		for j:=1 to N do
			St:=St+Chess[i,j];
		if MultiChar('X',N)=St then goto Crosses
		else if MultiChar('O',N)=St then goto Ouths;	
		St:='';
		for j:=1 to N do
			St:=St+Chess[j,i];
		if MultiChar('X',N)=St then goto Crosses
		else if MultiChar('O',N)=St then goto Ouths;	
	end;
	St:='';
	for i:=1 to N do
		St:=St+Chess[i,i];
	if MultiChar('X',N)=St then goto Crosses
	else if MultiChar('O',N)=St then goto Ouths;	
	St:='';
	for i:=1 to N do
		St:=St+Chess[i,N-i+1];
	if MultiChar('X',N)=St then goto Crosses
	else if MultiChar('O',N)=St then goto Ouths;	
	Result:=0;
	Exit;
	Crosses:
	Result:=1;
	Exit;
	Ouths:
	Result:=-1;
end;
function DFS(Depth:TIndex):TIndex;
var 
	Opt,x:TIndex;
	i:TIndex;
begin
	x:=Check;
	if (x<>0)or((x=0)and(Depth=Num+1)) then
	begin
		DFS:=x;
		Exit;
	end;
	if Odd(Depth) then
		Opt:=-MaxValue
	else 	
		Opt:=MaxValue;
	for i:=1 to 3 do
		if not Used[i] then
		begin
			Used[i]:=true;
			if Odd(Depth) then Chess[P[i].x,P[i].y]:='X'
			else Chess[P[i].x,P[i].y]:='O';
			x:=DFS(Depth+1);
			Chess[P[i].x,P[i].y]:='#';
			Used[i]:=false;
			if Odd(Depth)and (x>Opt) then Opt:=x;
			if not Odd(Depth)and (x<Opt) then Opt:=x;
		end;
	DFS:=Opt;
end;

procedure Main;
var
	i,j:TIndex;
	x:TIndex;
begin
	Num:=0;
	for i:=1 to N do
	begin
		for j:=1 to N do
		begin
			Read(Chess[i,j]);
			if Chess[i,j]='#' then
			begin
				Inc(Num);
				P[Num].x:=i;
				P[Num].y:=j;
			end;
		end;
		Readln;
	end;
	FillChar(Used,SizeOf(Used),0);
	x:=DFS(1);
	if x>0 then 
		Writeln('Crosses win')
	else if x<0 then
		Writeln('Ouths win')
	else 
		Writeln('Draw');
end;
begin
	Main;
end.
