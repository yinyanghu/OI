program p3039;
var
	w:double;
	n,d,a,b,i:longint;
procedure updata(s,t:longint);
 begin
	if (abs(a / b - w) > abs(s / t - w)) then begin
		a:=s; b:=t;
	end;
 end;
 
begin
	readln(n,d);
	w:=n / d;
	a:=1; b:=1;
	for i:=1 to 32767 do begin
		if (n * i mod d = 0) then begin
			updata(n * i div d - 1,i);
			updata(n * i div d + 1,i);
		end else begin
			updata(n * i div d,i);
			updata(n * i div d + 1,i);
		end;
	end;
	writeln(a,' ',b);
end.