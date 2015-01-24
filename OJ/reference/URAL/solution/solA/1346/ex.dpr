{
	note:
	(1)
	input:1 2 3 2 3 4
	output:2,but not 3
	(2)
	not exact increment or decrement
}
program Ural_1346(Input,Output);
const
	vt_Unknown=0;
	vt_Increment=1;
	vt_Decrement=-1;
type
	TIndex=Longint;
var
	Left,Right:TIndex;
	State:TIndex;
	Count:TIndex;

procedure Main;
var
	i:TIndex;
	Last,Cur:TIndex;
begin
	Readln(Left,Right);
	Read(Last);
	State:=vt_Unknown;
	Count:=1;
	for i:=Left+1 to Right do
	begin
		Read(Cur);
		if Last<Cur then 
		begin
			if State=vt_Unknown then State:=vt_Increment
			else if State=vt_Decrement then 
			begin
				State:=vt_Unknown;
				Inc(Count);
			end;
		end
		else if Last>Cur then 
		begin
			if State=vt_Unknown then State:=vt_Decrement
			else if State=vt_Increment then 
			begin
				State:=vt_Unknown;
				Inc(Count);
			end;
		end;
		Last:=Cur;
	end;
	Writeln(Count);
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