program p3048;
var
	max,ans,n,i,x:longint;
function check(x:longint):boolean;
 var
 	k:longint;
 begin
 	check:=false;
 	k:=2;
 	while (x <> 1) do begin
 		if (x mod k = 0) then begin
 			if (k > max) then begin
 				max:=k;
 				check:=true;
 			end;
 			while (x mod k = 0) do x:=x div k;
 		end;
 		inc(k);
 	end;
 end;
 
begin
	max:=1; ans:=1;
	readln(n);
	for i:=1 to n do begin
		readln(x);
		if check(x) then ans:=x;
	end;
	writeln(ans);
end.