program p1017;
var a,b,c,d,e,f,total:longint;
begin
    while not false do begin
        readln(a,b,c,d,e,f);
	if (a=0) and (b=0) and (c=0) and (d=0) and (e=0) and (f=0) then halt;
        total:=0;
	if f<>0 then total:=total+f;
	if e<>0 then begin
	    total:=total+e;
	    if a>0 then a:=a-11*e;
	    if a<0 then a:=0;
	end;
	if d<>0 then begin
	    total:=total+d;
	    if a>0 then begin
		if d*5-b>0 then a:=a-4*(d*5-b);
		if a<0 then a:=0;
	    end;
	    if b>0 then b:=b-5*d;
	    if b<0 then b:=0;
	end;
	if c<>0 then begin
	    total:=total+c div 4;
	    if c mod 4<>0 then inc(total);
	    if (a>1) and (c mod 4<>0) then begin
		if c mod 4=1 then
		    if b<=5 then a:=a-27-b*4 else a:=a-7;
		if c mod 4=2 then
		    if b<=3 then a:=a-18-b*4 else a:=a-6;
		if c mod 4=3 then 
		    if b<=1 then a:=a-9-b*4 else a:=a-5; 
	    end;
	    if a<0 then a:=0;
	    if (b>0) and (c mod 4<>0) then begin
		if c mod 4=1 then b:=b-5;
		if c mod 4=2 then b:=b-3;
		if c mod 4=3 then b:=b-1;
	    end;
	    if b<0 then b:=0;
	end;
	if b<>0 then begin
	    total:=total+b div 9;
	    if b mod 9<>0 then inc(total);
	    if (a>0) and (b mod 9<>0) then a:=a-36+4*(b mod 9);
	    if a<0 then a:=0;
	end;
	if a<>0 then begin
	    total:=total+a div 36;
	    if a mod 36<>0 then inc(total);
	end;
        writeln(total);
    end;
end.