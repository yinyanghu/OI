{
	KMP
	Find the first place x where the reverse of text with length (n-x+1) appears in original text.
	e.g.:
	Text :   AbabaAab
	Pattern:    baAababA
	here "baAab" matches "AbabaAab" at position 3.
	we can output "Aba"+"baAab"+"abA"
}
program Ural_1354(Input,Output);
const
	MaxN=10000;
type
	TIndex=Longint;
	TText=array[1..MaxN]of Char;
	TPrefix=array[1..MaxN]of SmallInt;
var
	N:TIndex;
	Text:TText;
	Prefix:TPrefix;

function Pattern(x:TIndex):TIndex;//the pattern is the reverse of text
begin
	Result:=N-x+1;
end;
procedure Main;
var
	i,k:TIndex;
	Match:TIndex;
begin
	N:=0;
	while not Eoln do
	begin
		Inc(N);
		Read(Text[N]);
	end;
	Readln;
	//compute prefix
	Prefix[1]:=0;
	k:=Prefix[1];
	for i:=2 to N do
	begin
		while (k>0) and (Text[Pattern(k)]<>Text[Pattern(i)]) do k:=Prefix[k];
		if Text[Pattern(k+1)]=Text[Pattern(i)] then Inc(k);
		Prefix[i]:=k;
	end;
	//kmp match
	k:=0;
	Match:=0;
	for i:=2 to N do
	begin
		while (k>0)and (Text[Pattern(k+1)]<>Text[i]) do k:=Prefix[k];
		if Text[Pattern(k+1)]=Text[i] then Inc(k);
		if k>=N-i+1 then 	//pattern length is variable i.e. n-i+1, so ">=" not "="
		begin
			Match:=i-k+1;
			Break;
		end;
	end;
	if Match=0 then Match:=N+1; //match=0 iff n=1
	for i:=1 to Match-1 do Write(Text[i]);
	for i:=N downto 1 do Write(Text[i]);
	Writeln;
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