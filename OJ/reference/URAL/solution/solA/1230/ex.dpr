{
	Simulate

	It's an interesting problem
	Main difficulty is how to avoid the iterate in single and double quotes.
	Use variables instead of quotes.
}
program Ural_1230(Input,Output);
const
	Code:AnsiString = 'A='#39'ABCDEF'#39';B='#39'"'#39';C="'#39'";D='#39'='#39';E='#39';'#39
	+';F='#39'?$(A,1,1)+D+C+A+C+E+$(A,2,1)+D+C+B+C+E+$(A,3,1)+D+B+C+B+E+$(A,4,1)+D+C+D+C+E+$'
	+'(A,5,1)+D+C+E+C+E+$(A,6,1)+D+C+F+C+E+F'#39';?$(A,1,1)+D+C+A+C+E+$(A,2,1)+D+C+B+C+E+$(A'
	+',3,1)+D+B+C+B+E+$(A,4,1)+D+C+D+C+E+$(A,5,1)+D+C+E+C+E+$(A,6,1)+D+C+F+C+E+F';
procedure Main;
begin
	Write(Code);
end;
begin
	Main;
end.