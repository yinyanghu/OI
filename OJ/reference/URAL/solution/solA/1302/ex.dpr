program Ural_1302(Input,Output);
type
	TIndex=Longint;
procedure Main;
var
	N1,N2,X1,X2,Y1,Y2:TIndex;
	Tmp:TIndex;
begin
	Readln(N1,N2);
	if N1>N2 then
	begin
		Tmp:=N1;
		N1:=N2;
		N2:=Tmp;
	end;
	//x轴为level 0.
	//y轴为三角形中线

	//get coordinates
	Y1:=Trunc(Sqrt(N1-1))+1;
	X1:=N1-(Sqr(Y1)-Y1+1);
	Y2:=Trunc(Sqrt(N2-1))+1;
	X2:=N2-(Sqr(Y2)-Y2+1);
	if Y2-Y1<=Abs(X2-X1) then //斜着或横着走 
		Writeln(Y2-Y1+Abs(X2-X1))
	else
	begin //需要竖着S型走
		Tmp:=Abs(X2-X1);
		Writeln(Tmp*2+(Y2-Y1-Tmp) div 2*4+Ord(Odd(Y2-Y1-Tmp))*(1+2*Ord(not Odd(Y1+X2))));
		{
		1)	Tmp*2: 为斜着走的步数
		2)	(Y2-Y1-Tmp) div 2*4: S型走完整周期的步数
		3)	Ord(Odd(Y2-Y1-Tmp))*(1+2*Ord(not Odd(Y1+X2))):
				Odd(Y2-Y1-Tmp) 当存在不完整周期时，
					Odd(Y1+X2) 当x2,y1为朝下走节点，不完整周期步数为1
					Even(Y1+X2) 当x2,y1为朝上走节点，不完整周期步数为3
			ps:
			若odd(x+y) 朝下走节点
			若even(x+y) 朝上走节点
		}
	end;
end;
begin
	Main;
end.