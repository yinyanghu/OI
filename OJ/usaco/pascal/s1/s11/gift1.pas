{
ID:lijianx1
PROG: gift1
LANG: PASCAL
}
program gift1;
type node=record
	 name:string;
	 money,last:longint;
     end;
var a:array[1..10] of node;
    i,j,k,m,sum,n:longint;
    s:string;

begin
    assign(input,'gift1.in'); reset(input);
    readln(n);
    for i:=1 to n do begin
	readln(a[i].name);
	a[i].money:=0;
    end;
    for i:=1 to n do begin
	readln(s);
	for j:=1 to n do if s=a[j].name then break;
	readln(sum,m); a[j].last:=sum;
	a[j].money:=a[j].money+sum;
	if m<>0 then a[j].money:=a[j].money-(sum div m)*m;
	for j:=1 to m do begin
	    readln(s);
	    for k:=1 to n do if s=a[k].name then break;
	    a[k].money:=a[k].money+sum div m;
	end;
    end;
    close(input);
    assign(output,'gift1.out'); rewrite(output);
    for i:=1 to n do writeln(a[i].name,' ',a[i].money-a[i].last);
    close(output);
end.