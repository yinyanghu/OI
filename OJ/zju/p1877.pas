program p1877;const	infinity = 10000;var	t,x,i,min,max,n:longint;begin	readln(t);	for t:=1 to t do begin		readln(n);		min:=infinity; max:=-infinity;		for i:=1 to n do begin			read(x);			if (x > max) then max:=x;			if (x < min) then min:=x;		end;		writeln((max - min) * 2);	end;end.