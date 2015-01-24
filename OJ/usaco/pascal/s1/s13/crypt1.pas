{
ID:lijianx1
PROG:crypt1
LANG:PASCAL
}
program crypt1;
var s:array[1..9] of longint;
    ok:array[0..9] of boolean;
    n,a1,a2,a3,b1,b2,a,b,total,i:longint;
function getlength(x:longint):longint;
 var s:string;
     i,l:longint;
 begin
     str(x,s);
     l:=length(s);
     for i:=1 to l do
	if not ok[ord(s[i])-48] then exit(0);
     getlength:=l;
 end;

begin
    fillchar(ok,sizeof(ok),false);
    assign(input,'crypt1.in'); reset(input);
    readln(n);
    for i:=1 to n do begin
	read(s[i]);
	ok[s[i]]:=true;
    end;
    close(input);
    total:=0;
    for a1:=1 to n do
	for a2:=1 to n do 
	    for a3:=1 to n do begin
		a:=(s[a1]*10+s[a2])*10+s[a3];
		for b1:=1 to n do
		   if getlength(a*s[b1])=3 then
		        for b2:=1 to n do begin
			    b:=s[b1]*10+s[b2];
			    if (getlength(a*s[b2])=3) and (getlength(a*b)=4) then inc(total);
			end;
	    end;
    assign(output,'crypt1.out'); rewrite(output);
    writeln(total);
    close(output);
end.