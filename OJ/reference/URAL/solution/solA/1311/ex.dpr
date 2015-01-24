program Ural_1311(Input,Output);
const
	MaxK=1000;
type
	TIndex=Longint;
	TData=Extended;
	TBrick=record
		Center,Gravity:TData;
	end;
	TBricks=array[Boolean,1..MaxK+1]of TBrick;
	TLen=array[Boolean]of TIndex;
var
	Brick:TBricks;
	Len:TLen;
procedure Unite(var A:TBrick;const B:TBrick);
begin
	A.Center:=(A.Gravity*A.Center+B.Gravity*B.Center)/(A.Gravity+B.Gravity);
	A.Gravity:=A.Gravity+B.Gravity;
end;
function Check:Boolean;
var
	H:TIndex;
	i,j:TIndex;
	Left,Right:TIndex;
begin
	Result:=true;
	Readln(H);
	if H=0 then Exit;
	Result:=false;

	Dec(H);
	Readln(Len[Odd(H)]);
	for i:=1 to Len[Odd(H)] do
	begin
		Readln(Left,Right);
		Brick[Odd(H),i].Center:=(Left+Right)/2;
		Brick[Odd(H),i].Gravity:=Right-Left;
	end;
	while H>0 do
	begin
		Dec(H);
		Readln(Len[Odd(H)]);
		j:=1;
		for i:=1 to Len[Odd(H)] do
		begin
			Readln(Left,Right);
			Brick[Odd(H),i].Center:=(Left+Right)/2;
			Brick[Odd(H),i].Gravity:=Right-Left;
			if (j<=Len[not Odd(H)]) and (Brick[not Odd(H),j].Center<=Left) then Exit;
			while (Brick[not Odd(H),j].Center<Right) and (j<=Len[not Odd(H)]) do
			begin
				Unite(Brick[Odd(H),i],Brick[not Odd(H),j]);
				Inc(j);
			end;
		end;
		if j<=Len[not Odd(H)] then Exit;
	end;
	Result:=true;
end;
procedure Main;
begin
	if Check then
		Writeln('Yes')
	else
		Writeln('No');
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