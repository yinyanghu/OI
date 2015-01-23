program p1575;
const m:array[1..3] of string=('Emperor Penguin','Little Penguin','Macaroni Penguin');
var a:array[1..3] of longint;
    i,n,k,max:longint;
    s:char;
begin
    readln(n); fillchar(a,sizeof(a),0);
    for i:=1 to n do begin
	read(s); readln;
	if s='E' then inc(a[1])
	    else if s='L' then inc(a[2])
		else inc(a[3]);
    end;
    max:=0;
    for i:=1 to 3 do
	if a[i]>max then begin
	    max:=a[i]; k:=i;
	end;
    writeln(m[k]);
end.