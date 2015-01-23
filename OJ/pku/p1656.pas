program p1656;
const maxn=100;
var a:array[1..maxn,1..maxn] of boolean;
    k,n,x,y,l:longint;
    ch:char;
    flag:boolean;
procedure print(x,y,l:longint; k:boolean);
 var i,j:longint;
 begin
     for i:=x to x+l-1 do
	for j:=y to y+l-1 do a[i,j]:=k;
 end;
	
function check(x,y,l:longint):longint;
 var i,j,k:longint;
 begin
     k:=0;
     for i:=x to x+l-1 do
	for j:=y to y+l-1 do
	   if a[i,j] then inc(k);
     check:=k;
 end;
begin
    readln(n);
    fillchar(a,sizeof(a),false);
    for k:=1 to n do begin
	read(ch);
	if ch='T' then begin
	   while ch<>' ' do read(ch);
	   readln(x,y,l);
	   writeln(check(x,y,l));
	end else begin
	    flag:=ch='B';
	    while ch<>' ' do read(ch);
	    readln(x,y,l);
	    print(x,y,l,flag);
	end;
    end;
end.
