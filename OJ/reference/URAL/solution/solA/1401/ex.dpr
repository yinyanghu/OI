program Ural_1401(Input,Output);
const
	MaxN=9;
type
	TIndex=Longint;
	TAnswer=array[1..1 shl MaxN,1..1 shl MaxN]of TIndex;
var
	N:TIndex;
	Ans:TAnswer;
	Count:TIndex;

procedure Print(Size:TIndex;x,y:TIndex;dx,dy:TIndex);
var
	Cur,Width:TIndex;
begin
	//1,2
	//3,4
	if Size=0 then Exit;
	Inc(Count);
	Cur:=Count;
	Width:=1 shl (Size-1);
	//1
	if (x<=Width) and (y<=Width) then 
		Print(Size-1,x,y,dx,dy)
	else
	begin
		Print(Size-1,Width,Width,dx,dy);
		Ans[dx+Width,dy+Width]:=Cur;
	end;
	//2
	if (x<=Width) and (y>Width) then 
		Print(Size-1,x,y-Width,dx,dy+Width)
	else
	begin
		Print(Size-1,Width,1,dx,dy+Width);
		Ans[dx+Width,dy+Width+1]:=Cur;
	end;
	//3
	if (x>Width) and (y<=Width) then 
		Print(Size-1,x-Width,y,dx+Width,dy)
	else
	begin
		Print(Size-1,1,Width,dx+Width,dy);
		Ans[dx+Width+1,dy+Width]:=Cur;
	end;
	//4
	if (x>Width) and (y>Width) then 
		Print(Size-1,x-Width,y-Width,dx+Width,dy+Width)
	else
	begin
		Print(Size-1,1,1,dx+Width,dy+Width);
		Ans[dx+Width+1,dy+Width+1]:=Cur;
	end;
end;
procedure Main;
var
	x,y:TIndex;
begin
	Readln(N);
	Readln(x,y);
	Count:=0;
	Ans[x,y]:=0;
	Print(N,x,y,0,0);
	//Output
	for x:=1 to 1 shl N do
	begin
		Write(Ans[x,1]);
		for y:=2 to 1 shl N do
			Write(' ',Ans[x,y]);
		Writeln;
	end;
end;
begin
	Main;
end.