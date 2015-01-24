{
AC in 0.281 sec
TLE if using SET. "extle.dpr" is the tle prog.
}
program Ural_1179(Input,Output);
type
	TIndex=Longint;
var
	IsNewWord:array[1..36]of Boolean;      //Index 1 is a Buffer
	WordCount:array[1..36]of TIndex;       //Index 1 is a Buffer

procedure Main;
var
	i,MaxIndex:TIndex;
	T:TIndex;
	Ch:Char;
begin
	FillChar(IsNewWord,SizeOf(IsNewWord),true);
	FillChar(WordCount,SizeOf(WordCount),0);
	while not Eof do
	begin
		Read(Ch);
		T:=-1;
		if (Ord('0')<=Ord(Ch)) and (Ord(Ch)<=Ord('9')) then 
			T:=Ord(Ch)-Ord('0')
		else if (Ord('A')<=Ord(Ch)) and (Ord(Ch)<=Ord('Z')) then 
			T:=Ord(Ch)-Ord('A')+10
		else 
			FillChar(IsNewWord,SizeOf(IsNewWord),true);
		if T=-1 then Continue;
		for i:=2 to T do 
			IsNewWord[i]:=true;
		for i:=T+1 to 36 do  //if T=0 then Index T+1=1 should be a Buffer
			if IsNewWord[i] then
			begin
				IsNewWord[i]:=false;
				Inc(WordCount[i]);
			end;
	end;
	MaxIndex:=2;
	for i:=2+1 to 36 do	
		if WordCount[i]>WordCount[MaxIndex] then 
			MaxIndex:=i;
	Writeln(MaxIndex,' ',WordCount[MaxIndex]);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
		Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.