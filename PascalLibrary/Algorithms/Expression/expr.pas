program express;
const all:set of char=['+','-','*','^','/'];
var s:string;
    pri:array['*'..'^'] of longint;
function power(x,y:longint):longint;
 var i,k:longint;
 begin
     k:=1;
     for i:=1 to y do k:=k*x;
     power:=k;
 end;

function calc(l,r:longint):longint;
 var i,k,a,b,min,minx:longint;
 begin
     k:=0;
     min:=maxlongint;
     for i:=l to r do begin
	 if s[i]='(' then inc(k);
	 if s[i]=')' then dec(k);
	 if (k=0) and (s[i] in all) then
	     if pri[s[i]]<=min then begin
		 min:=pri[s[i]];
		 minx:=i;
	     end;
     end;
     if min<>maxlongint then begin
	a:=calc(l,minx-1);
	b:=calc(minx+1,r);
	case s[minx] of
	    '^':calc:=power(a,b);
	    '*':calc:=a*b;
	    '+':calc:=a+b;
	    '-':calc:=a-b;
	    '/':calc:=a div b;
	end;
     end else begin
	 if s[l]='(' then calc:=calc(l+1,r-1)
	     else val(copy(s,l,r-l+1),calc);
     end;
 end;

begin
    assign(input,'expr.in'); reset(input);
    readln(s);
    close(input);
    pri['^']:=3; pri['*']:=2; pri['/']:=2; pri['+']:=1; pri['-']:=1;
    writeln(calc(1,length(s)));
end.