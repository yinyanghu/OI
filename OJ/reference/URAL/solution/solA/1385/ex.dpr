{
	cuz x|x*10^n+y, so x|y. let y=kx
	cuz kx|x*10^n+kx, so k|10^n
	cuz no lead zero i.e. x>=10^(n-1) and y<10^n, so 1<=k<=9
	
	if n=1, only k=1,2,5|10^1, then count(1,2,5)=9,4,1
	if n=2, only k=1,2,4,5|10^2 then count(1,2,4,5)=90,40,15,10
	if n=3 or more, at most k=1,2,4,5,8|10^3 then count(1,2,4,5,8)=(900,400,150,100,25)*10^(n-3)
}
program Ural_1385(Input,Output);
type
	TIndex=Longint;
var
	N:TIndex;
procedure Main;
begin
	Readln(N);
	if N=1 then 
		Write(9+4+1)
	else if N=2 then
		Write(90+40+15+10)
	else 
		Write(900+400+150+100+25);

	while N>3 do
	begin
		Dec(N);
		Write(0);
	end;
	Writeln;
end;
begin
	Main;
end.