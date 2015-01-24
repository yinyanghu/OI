{
	let the length of number be L.

	discuss highest digit:
	1: 0->1
		2999->10000 (here L-2 of 9, L-1 of 0)
		when L=1, ans=1
		else 
		discuss second highest digit:
			0,1: 02->10
				when L>=3, ans=10000-2999=7000+1
				when L=2, ans=8
			2,9: 06->12 //notice very easy to lose it.
				when L>=3, ans=12000-6999=5000+1
				when L=2, ans=6
	2,3: 0->2
		09999->20000 (here L-1 of 0,9)
		when L>=2, ans=20000-09999=10000+1
		when L=1, ans=2
	4-9: 0->4
		09999->40000 (here L-1 of 0,9)
		when L>=2, ans=40000-09999=30000+1
		when L=1, ans=4
}
program Ural_1321(Input,Output);
type
	TIndex=Longint;
procedure Main;
var
	St:AnsiString;
	Ch:Char;
	L:TIndex;
	i:TIndex;
begin
	Read(Ch);
	Readln(St);
	L:=Length(St)+1;
	case Ch of 
		'1':
			if L=1 then
				Writeln('1')
			else 
				case St[1] of
					'0','1':
						if L=2 then
							Writeln('8')
						else //now L>=3
						begin
							Write('7');
							for i:=1 to L-3 do
								Write('0');
							Writeln('1');
						end;
					'2'..'9':
						if L=2 then
							Writeln('6')
						else //now L>=3
						begin
							Write('5');
							for i:=1 to L-3 do
								Write('0');
							Writeln('1');
						end;
				end;
		'2','3':
			if L=1 then 
				Writeln('2')
			else
			begin //now L>=2 
				Write('1');
				for i:=1 to L-2 do
					Write('0');
				Writeln('1');
			end;
		'4'..'9':
			if L=1 then
				Writeln('4')
			else
			begin
				Write('3');
				for i:=1 to L-2 do
					Write('0');
				Writeln('1');
			end;
	end;
end;
begin
	Main;
end.