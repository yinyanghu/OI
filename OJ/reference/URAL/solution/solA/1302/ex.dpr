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
	//x��Ϊlevel 0.
	//y��Ϊ����������

	//get coordinates
	Y1:=Trunc(Sqrt(N1-1))+1;
	X1:=N1-(Sqr(Y1)-Y1+1);
	Y2:=Trunc(Sqrt(N2-1))+1;
	X2:=N2-(Sqr(Y2)-Y2+1);
	if Y2-Y1<=Abs(X2-X1) then //б�Ż������ 
		Writeln(Y2-Y1+Abs(X2-X1))
	else
	begin //��Ҫ����S����
		Tmp:=Abs(X2-X1);
		Writeln(Tmp*2+(Y2-Y1-Tmp) div 2*4+Ord(Odd(Y2-Y1-Tmp))*(1+2*Ord(not Odd(Y1+X2))));
		{
		1)	Tmp*2: Ϊб���ߵĲ���
		2)	(Y2-Y1-Tmp) div 2*4: S�����������ڵĲ���
		3)	Ord(Odd(Y2-Y1-Tmp))*(1+2*Ord(not Odd(Y1+X2))):
				Odd(Y2-Y1-Tmp) �����ڲ���������ʱ��
					Odd(Y1+X2) ��x2,y1Ϊ�����߽ڵ㣬���������ڲ���Ϊ1
					Even(Y1+X2) ��x2,y1Ϊ�����߽ڵ㣬���������ڲ���Ϊ3
			ps:
			��odd(x+y) �����߽ڵ�
			��even(x+y) �����߽ڵ�
		}
	end;
end;
begin
	Main;
end.