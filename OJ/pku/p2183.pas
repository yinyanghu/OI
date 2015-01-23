program p2183;
const maxqueue=100;
var n,total,i:longint;
    q:array[0..maxqueue] of longint;

function extract(x:longint):longint;
 begin
     extract:=(x-(x div 100000*100000)) div 10;
 end;

function change(x:longint):longint;
 begin
     change:=sqr(extract(x)) mod 1000000;
 end;

begin
    readln(n);
    total:=0; q[0]:=n;
    while true do begin
        inc(total);
        q[total]:=change(q[total-1]);
	for i:=total-1 downto 1 do
	    if q[i]=q[total] then begin
	        writeln(q[total],' ',total-i,' ',total);
		halt;
	    end;
    end;
end.
