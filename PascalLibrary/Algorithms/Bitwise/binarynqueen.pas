program nqueen;
var n,w,total:longint;
procedure find(a,b,c:longint);
 var p,pos:longint;
 begin
     if a<>w then begin
        pos:=w and (not (a or b or c));
        while pos>0 do begin
	    p:=pos and (-pos);
	    pos:=pos-p;
	    find(a+p,(b+p) shl 1,(c+p) shr 1);
        end;
     end else inc(total);
 end;

begin
    readln(n);
    w:=1 shl n-1;
    find(0,0,0);
    writeln(total);
end.