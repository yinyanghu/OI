program Ural_1413(Input,Output);
type
	TIndex=Longint;
	TCount=array[0..1]of TIndex;
var
	X,Y:TCount;
procedure Jump(px,dx,py,dy:TIndex);
begin
	Inc(X[px],dx);
	Inc(Y[py],dy);
end;
procedure Main;
var
	Ch:Char;
begin
	FillChar(X,SizeOf(X),0);
	FillChar(Y,SizeOf(Y),0);
	while not Eof do
	begin
		repeat
			Read(Ch);
		until (Ch in ['0'..'9']) or Eof;
		case Ch of 
			'0':Break;
			'1':Jump(1,-1,1,-1);
			'2':Jump(0,0,0,-1);
			'3':Jump(1,1,1,-1);
			'4':Jump(0,-1,0,0);
			'5':Continue;
			'6':Jump(0,1,0,0);
			'7':Jump(1,-1,1,1);
			'8':Jump(0,0,0,1);
			'9':Jump(1,1,1,1);
		end;
	end;
	Writeln(X[0]+X[1]*Sqrt(2)/2:0:10,' ',Y[0]+Y[1]*Sqrt(2)/2:0:10);
end;
begin
	Main;
end.