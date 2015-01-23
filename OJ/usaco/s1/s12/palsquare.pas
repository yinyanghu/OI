{
ID:lijianx1
PROG:palsquare
LANG:PASCAL
}
program palsquare;
var s:string;
    i,n:longint;
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

function change(x:longint):string;
 begin
     change:='';
     while x>0 do begin
	 change:=digit(x mod n)+change;
	 x:=x div n;
     end;
 end;

begin
    assign(input,'palsquare.in'); reset(input);
    assign(output,'palsquare.out'); rewrite(output);
    readln(n);
    for i:=1 to 300 do begin
	s:=change(i*i);
	if check(s) then writeln(change(i),' ',s);
    end;
    close(input);
    close(output);
end.