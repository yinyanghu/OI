program Ural_1186(Input,Output);
type
	TIndex=Longint;
	TElementList=array[1..26,0..26]of TIndex;
var
	N:TIndex;
function GetNum(var St:String):TIndex;
begin
	Result:=0;
	while ('0'<=St[1]) and (St[1]<='9') do
	begin
		Result:=Result*10+Ord(St[1])-Ord('0');
		Delete(St,1,1);
	end;
	if Result=0 then Result:=1;
end;
procedure Analyze(var List:TElementList;St:String;Multi:TIndex);
var
	Upper,Lower,Bracket:TIndex;
	P:TIndex;
	SubSt:String;
begin
	St:=St+' ';
	while St<>' ' do
		if ('A'<=St[1]) and (St[1]<='Z') then
		begin
			Upper:=Ord(St[1])-Ord('A')+1;
			Delete(St,1,1);
			if ('a'<=St[1]) and (St[1]<='z') then
			begin
				Lower:=Ord(St[1])-Ord('a')+1;
				Delete(St,1,1);
			end
			else
				Lower:=0;
			Inc(List[Upper,Lower],GetNum(St)*Multi);
		end
		else if St[1]='(' then
		begin
			Bracket:=1;
			P:=1;
			while Bracket>0 do
			begin
				Inc(P);
				if St[P]='(' then 
					Inc(Bracket)
				else if St[P]=')' then 
					Dec(Bracket);
			end;
			SubSt:=Copy(St,2,p-2);
			Delete(St,1,p);
			Analyze(List,SubSt,GetNum(St)*Multi);
		end;
end;
procedure Formula(var List:TElementList;St:String);
var
	Multi:TIndex;
begin
	FillChar(List,SizeOf(List),0);
	St:=St+'+#';
	while St<>'#' do
	begin
		Multi:=GetNum(St);
		Analyze(List,Copy(St,1,Pos('+',St)-1),Multi);
		Delete(St,1,Pos('+',St));
	end;
end;
function IsEqual(Left,Right:TElementList):Boolean;
var
	i,j:TIndex;
begin
	Result:=false;
	for i:=1 to 26 do
		for j:=0 to 26 do
			if Left[i,j]<>Right[i,j] then 
				Exit;
	Result:=true;
end;
procedure Main;
var
	i:TIndex;
	LeftSt,RightSt:String;
	Left,Right:TElementList;
begin
	Readln(LeftSt);
	Formula(Left,LeftSt);
	Readln(N);
	for i:=1 to N do
	begin
		Readln(RightSt);
		Formula(Right,RightSt);
		Write(LeftSt);
		if IsEqual(Left,Right) then
			Write('==')
		else
			Write('!=');
		Writeln(RightSt);
	end;
end;
begin
	Main;
end.