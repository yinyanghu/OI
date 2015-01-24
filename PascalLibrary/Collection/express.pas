program express;
const
	operation:set of char = ['+','-','*','/'];
	infinity = 100000000;
var
	s:string;
	pri:array[char] of longint;
function calc(left,right:longint):longint;
 var
	i,a,b,k,min,flag:longint;
 begin
	flag:=0;
	min:=infinity;
	for i:=left to right do begin
		if (s[i] = '(') then inc(flag);
		if (s[i] = ')') then dec(flag);
		if (flag = 0) and (s[i] in operation) then
			if (pri[s[i]] <= min) then begin
				min:=pri[s[i]];
				k:=i;
			end;
	end;
	if (min <> infinity) then begin
		a:=calc(left,k - 1);
		b:=calc(k + 1,right);
		case s[k] of
			'+':calc:=a + b;
			'-':calc:=a - b;
			'*':calc:=a * b;
			'/':calc:=a div b;
		end;
	end else begin
		if (s[left] = '(') then calc(left + 1,right - 1)
			else val(copy(s,left,right - left + 1),calc);
	end;
 end;
 
begin
	readln(s);
	pri['+']:=1; pri['-']:=1; pri['*']:=2; pri['/']:=2;
	writeln(calc(1,length(s)));
end.
