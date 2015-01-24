{
	Author: Amber
	Method: Simpson
	Clarity:
		Let r1<=r2. Cylinder r1 lies on x axis, and r2 lies on y axis.
		(x,y,z) in intersection, s.t.
		z^2+x^2<=r2^2
		z^2+y^2<=r1^2
		=>
		f(z)=sqrt(r1^2-z^2)*sqrt(r2^2-z^2)
		ans=8*integral[ f(z) from 0 to r1 ]
		It's hard to find directly.

		The trapezia approximation formula costs too many time to get a low precision.
		So the parabola approximation formula (Simpson) is fit.
	
		Given a(lower);b(upper);n(the number of dividings);f[x](integral function)
		trapezia: Ans=((b-a)/n)*((f[a]+f[b])/2+Sum[f[a+i*(b-a)/n],(i,1,n-1)]) 
		simpson: Ans=(b-a)/(3n)*(f[a]+f[b]+2Sum[f[a+2i*(b-a)/n],(i,1,n/2-1)]+4Sum[f[a+(2i-1)*(b-a)/n],(i,1,n/2)])

		see http://www2.gliet.edu.cn/cai/dept7/math/shuxueshiyan/shiyan5.htm
	Complexity: O(N), N is the number of dividings.
	Notice: None
}
program SGU_217(Input,Output);
const
	N=1000000;
type
	TIndex=Longint;
	TData=Extended;
var
	Rl,Rs:TData; //large and small
function F(x:TData):TData;
begin
	Result:=Sqrt(Sqr(Rl)-Sqr(x))*Sqrt(Sqr(Rs)-Sqr(x));
end;
procedure Main;
var
	i:TIndex;
	T:TData;
	Sum:TData;
begin
	Readln(Rl,Rs);
	if Rl<Rs then
	begin
		T:=Rl;
		Rl:=Rs;
		Rs:=T;
	end;
	Sum:=F(0)+F(Rs);
	for i:=1 to N div 2-1 do 
		Sum:=Sum+2*F(2*i*Rs/N);
	for i:=1 to N div 2 do 
		Sum:=Sum+4*F((2*i-1)*Rs/N);
	Writeln(8*Rs/3/N*Sum:0:4);
end;
begin
	Main;
end.
