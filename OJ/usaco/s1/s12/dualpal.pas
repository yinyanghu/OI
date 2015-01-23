{
ID:lijianx1
PROG:dualpal
LANG:PASCAL
}
program palsquare;
var s:string;
    i,n,m,k:longint;
function check(a:string):boolean;
 var l,i:longint;
 begin
     l:=length(a);
     for i:=1 to l div 2 do 
	if a[i]<>a[l-i+1] then exit(false);
     check:=true;
 end;

function digit(k:longint):char;
 begin
     if k>9 then digit:=chr(55+k) else digit:=chr(48+k);
 end;

function change(x,k:longint):string;
 begin
     change:='';
     while x>0 do begin
	 change:=digit(x mod k)+change;
	 x:=x div k;
     end;
 end;

begin
    assign(input,'dualpal.in'); reset(input);
    assign(output,'dualpal.out'); rewrite(output);
    readln(n,m);
    while n>0 do begin
	inc(m); k:=0;
	for i:=2 to 10 do begin
	    if check(change(m,i)) then inc(k);
	    if k=2 then begin
		writeln(m); dec(n);
		break;
	    end;
	end;
    end;
    close(input);
    close(output);
end.