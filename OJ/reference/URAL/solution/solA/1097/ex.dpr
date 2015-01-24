program Ural_1097(Input,Output);
const
	MaxN=100;
type
	TIndex=Longint;
	TSquare=array[0..MaxN]of record
		X,Y:TIndex;
		Len:TIndex;
		Imt:TIndex;
	end;
var
	N:TIndex;
	W,L:TIndex;
	S:TSquare;
procedure Main;
var
	i,j,k:TIndex;
	x,y:TIndex;
	Min,Cur:TIndex;
begin
	Readln(W,L);
	Readln(N);
	for i:=1 to N do
		Readln(S[i].Imt,S[i].Len,S[i].X,S[i].Y);
	S[0].X:=0;
	S[0].Y:=0;
	S[0].Len:=1;
	Min:=255;
	for i:=0 to N do
		for j:=0 to N do
		begin
			x:=S[i].X+S[i].Len;
			y:=S[j].Y+S[j].Len;
			if (x+L-1>W) or (y+L-1>W) then Continue;
			Cur:=1;
			for k:=1 to N do
				if (S[k].Imt>Cur) and (S[k].X<=x+L-1) and (x<=S[k].X+S[k].Len-1)
					and (S[k].Y<=y+L-1) and (y<=S[k].Y+S[k].Len-1) then
				begin
					Cur:=S[k].Imt;
					if Cur>=Min then Break;
				end;
			if Cur<Min then Min:=Cur;
		end;
	if Min=255 then
		Writeln('IMPOSSIBLE')
	else
		Writeln(Min);
end;
begin
	Main;
end.