{
	Statistic
	Differential Points in 0..1*0..1
	divide 0..1 to 1000 points cuz of Precision to 0.01
}
program Ural_1333(Input,Output);
const
	MaxN=10;
	Size=1;
	Zoom=1000;
type
	TIndex=Longint;
	TData=Extended;
	TCircle=record
		x,y,r:TData;
	end;
	TCircleSet=array[1..MaxN]of TCircle;
var
	N:TIndex;
	Circle:TCircleSet;
	Count:TIndex;

procedure Main;
var
	i,j,k:TIndex;
	Inner:Boolean;
begin
	Readln(N);
	for i:=1 to N do
		with Circle[i] do
		begin
			Readln(x,y,r);
			x:=Zoom*x;
			y:=Zoom*y;
			r:=Zoom*r;
		end;
	Count:=0;
	for i:=1 to Size*Zoom do
		for j:=1 to Size*Zoom do
		begin
			Inner:=false;
			for k:=1 to N do
				with Circle[k] do
					if Sqr(x-i)+Sqr(y-j)<=Sqr(r) then
					begin
						Inner:=true;
						Break;
					end;
			if Inner then Inc(Count);
		end;
	Writeln(Count/Sqr(Size*Zoom)*100:0:3);
end;
begin
	Main;
end.