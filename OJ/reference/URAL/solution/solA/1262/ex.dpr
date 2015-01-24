program Ural_1262(Input,Output);
const
	Pseudo_Roman_Digit_Len:array['0'..'9']of Longint=(0,1,2,3,2,1,2,3,4,2);
	//'','I','II','III','IV','V','VI','VII','VIII','IX'
type
	TIndex=Longint;
procedure Main;
var
	Len:TIndex;
	Ch:Char;
begin
	Len:=0;
	while not Eof do
	begin
		Read(Ch);
		if Ch in ['0'..'9'] then Inc(Len,Pseudo_Roman_Digit_Len[Ch]);
	end;
	Writeln(Len);
end;
begin
	Main;
end.