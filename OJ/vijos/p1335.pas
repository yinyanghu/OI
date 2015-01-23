program p1335;
var i,j,n,p:longint;
    a:array[1..9,1..9] of longint;
function square(x1,y1,x2,y2:longint):boolean;
 var i,j:longint;
     ok:array[1..9] of boolean;
 begin
     fillchar(ok,sizeof(ok),false); 
     for i:=x1 to x2 do
	for j:=y1 to y2 do 
          if not ok[a[i,j]] then ok[a[i,j]]:=true else exit(false);
     square:=true;
 end;

function check:boolean;
 var i,j:longint;
     ok:array[1..9] of longint;
 begin
     for i:=1 to 9 do begin
         fillchar(ok,sizeof(ok),0);
	 for j:=1 to 9 do begin
	     if ok[a[i,j]]=2 then exit(false) else inc(ok[a[i,j]]);
	     if ok[a[i,j]]=2 then exit(false) else inc(ok[a[i,j]]);
	 end;
     end;
     check:=(square(1,1,3,3)) and (square(1,4,3,6)) and (square(1,7,3,9)) and (square(4,1,6,3)) and (square(4,4,6,6)) and (square(4,7,6,9)) and (square(7,1,9,3)) and (square(7,4,9,6)) and (square(7,7,9,9));
 end;

begin
    readln(n);
    for p:=1 to n do begin
	for i:=1 to 9 do begin
	    for j:=1 to 9 do read(a[i,j]);
	    readln;
	end;
	readln;
	if check then writeln('Right') else writeln('Wrong');
    end;
end.
