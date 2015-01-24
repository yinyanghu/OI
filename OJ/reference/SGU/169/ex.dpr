{
	Author: Amber
	Method: Math
	Clarity:
		Let n=abc...x
		s.t. a,b,c...<>0 
		last digit x s.t. 1<=x<=8, otherwise p(n)=0 or p(n+1)=0
		Let r=p(n)/x
		Let k,k' (k<=k') s.t. n=krx -(1),
		                      n+1=k'r(x+1) -(2)
		Let k'=k+d
		(1)(2) => krx+1=krx+kr+dr(x+1) => kr+dr(x+1)=1 -(3)
		Prove k=k':
			Let d>0
			Cuz x+1>1, dr(x+1)+kr>1.Conflict, so k=k', d=0
		d=0 into (3) => kr=1 => k=1, r=1
		So n=111111...x (k-1 ones)
		
		Let condition P(x) is that x | 111111...x.
		If P(x) and P(x+1), then 111111...x is perfect.
		
		P(1),P(2),P(5) are always true.
		P(3)=3|111111...3 = 3|1*(k-1)+3 = 3|k-1
		P(6)=2|111111...6 && 3|111111...+6 = 3|k-1
		P(9)=9|111111...9 = 9|1000..00+...+1000+100+10+9 = 9|k-1
		P(4),P(8) are true iff k=1.
		
		P(7)=7|111111...7 
		num:  1111110 111110 11110 1110 110 10
		mod 7:      0      6     1    4   5  3
		Loop length is 6
		so P(7)=6|k-1		
}
program SGU_169(Input,Output);
type
	TIndex=Longint;
	TCondition=array[1..9]of Boolean;
var
	K:TIndex;
	F:TCondition;
	Count:TIndex;
procedure Main;
var
	i:TIndex;
begin
	Readln(K);
	F[1]:=true;
	F[2]:=true;
	F[3]:=(k mod 3=1);
	F[4]:=(k=1);
	F[5]:=true;
	F[6]:=(k mod 3=1);
	F[7]:=(k mod 6=1);
	F[8]:=(k=1);
	F[9]:=(k mod 9=1);
	Count:=0;
	for i:=1 to 8 do
		if F[i] and F[i+1] then
			Inc(Count);
	Writeln(Count);
end;
begin
	Main;
end.