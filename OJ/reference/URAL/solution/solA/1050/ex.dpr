{
	simple simulation
}
program Ural_1050(Input,Output);
const
	CODE_OPEN=#0;
	CODE_CLOSE=#1;
	CODE_DELETE=#2;
	MaxLen=(80+2)*250;
type
	TIndex=Longint;
	TArticle=array[1..MaxLen]of Char;
var
	Len:TIndex;
	S:TArticle;
function GetStr(Index,Size:TIndex):string;
var
	i:TIndex;
begin
	Result:='';
	for i:=Index to Size+Index-1 do
		if (1<=i)and (i<=Len) then
			Result:=Result+S[i];
	
end;
procedure Main;
var
	i:TIndex;
	Open:TIndex;
begin
	Len:=0;
	while not Eof do
	begin
		Inc(Len);
		Read(S[Len]);
	end;
	Open:=0;
	for i:=1 to Len do
		if (GetStr(i,1)='"') and (GetStr(i-1,1)<>'\') then 
		begin
			if Open>0 then
			begin
				S[Open]:=CODE_OPEN;
				S[i]:=CODE_CLOSE;
				Open:=0;
			end
			else Open:=i;
		end
		else if ((GetStr(i,4)='\par') or (GetStr(i,4)=#13#10#13#10) or (GetStr(i,9)='\endinput')) and (Open>0) then
		begin
			S[Open]:=CODE_DELETE;
			Open:=0;
		end;
	for i:=1 to Len do
		case S[i] of 
			CODE_OPEN: Write(#96#96); //`
			CODE_CLOSE: Write(#39#39); //'
			CODE_DELETE:;
			else Write(S[i]);
		end;
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