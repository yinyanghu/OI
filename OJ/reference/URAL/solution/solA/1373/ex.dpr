program Ural_1373(Input,Output);
const
	MaxValue=MaxLongint div 2;
type
	TData=Longint;
var
	Left,Right,Bottom,Top:TData;

procedure InsertPoint(x,y:TData);
begin
	if x<Left then Left:=x;
	if x>Right then Right:=x;
	if y<Bottom then Bottom:=y;
	if y>Top then Top:=y;
end;
procedure Main;
var
	Sx,Sy,Fx,Fy:TData;
begin
	if SeekEof then
	begin
		Writeln(0.0:0:4,' ',0.0:0:4);
		Exit;
	end;
	Left:=MaxValue;
	Right:=-MaxValue;
	Bottom:=MaxValue;
	Top:=-MaxValue;

	while not SeekEof do
	begin
		Readln(Sx,Sy,Fx,Fy);
		InsertPoint(2*Sx,2*Sy);
		InsertPoint(2*Fx,2*Fy);
		InsertPoint(2*Sx+(Fx-Sx)-(Fy-Sy),2*Sy+(Fx-Sx)+(Fy-Sy));
	end;
	
	Writeln((Right-Left)/2:0:4,' ',(Top-Bottom)/2:0:4);
end;
begin
	Main;
end.