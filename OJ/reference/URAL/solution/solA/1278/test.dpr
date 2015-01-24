program Ex;
const
	MaxN=100;
type
	TIndex=Longint;
	TCom=array[0..MaxN]of TIndex;
	TStack=array[1..MaxN]of TIndex;
var
	N:TIndex;
	Com:TCom;
	Stack:TStack;
	IP,Len,Top:TIndex;
procedure Main;
var
	Ch:Char;
	St:string;
begin
	N:=0;
	while not Eof do
	begin
		Read(Ch);
		if Ch='C' then
		begin
			Readln(Com[N]);
			Inc(N);
		end
		else if Ch='B' then Break;
	end;
	IP:=0;
	Top:=0;
	Len:=0;
	while true do
	begin
		if IP<N then 
		begin
			Inc(Top);
			Stack[Top]:=IP+1;
			IP:=Com[IP];
		end
		else
		begin
			Inc(Len);
			if Top=0 then 
			begin
				Writeln(Len);
				St:='';
				while Len>0 do
				begin
					St:=Chr(Len mod 2+Ord('0'))+St;
					Len:=Len div 2;
				end;
				Writeln(St);
				Exit;
			end;
			IP:=Stack[Top];
			Dec(Top);
		end;
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