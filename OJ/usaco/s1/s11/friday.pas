{
ID:lijianx1
PROG:friday
LANG:PASCAL
}
program friday;
const date:array[1..12] of longint=(3,0,3,2,3,2,3,3,2,3,2,3);
var i,m,n,now,y:longint;
    a:array[0..6] of longint;
function check(y:longint):boolean;
 begin
     if (y mod 100=0) then
	if (y mod 400=0) then check:=true else check:=false
     else if (y mod 4=0) then check:=true else check:=false;
 end;

begin
    assign(input,'friday.in'); reset(input);
    readln(n);
    close(input);
    fillchar(a,sizeof(a),0); now:=6;
    for y:=1900 to 1899+n do begin
	for m:=1 to 12 do begin
	    inc(a[now]);
	    if m=2 then now:=now+ord(check(y))
		else now:=now+date[m];
	    now:=now mod 7;
	end;
    end;
    assign(output,'friday.out'); rewrite(output);
    write(a[6]); for i:=0 to 5 do write(' ',a[i]);
    writeln;
    close(output);
end.