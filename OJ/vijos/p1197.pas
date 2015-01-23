program p1197;
var a,f:array[1..5,1..5] of longint;
    w:array[1..5] of longint;
    i,j,min,k,s,n:longint;
    ch:char;
function calc:longint;
 var i,j:longint;
 begin
     calc:=0;
     for i:=1 to 5 do
	if w[i]=1 then begin
	    inc(calc);
	    f[1,i]:=1-f[1,i];
	    f[2,i]:=1-f[2,i];
	    if i<5 then f[1,i+1]:=1-f[1,i+1];
	    if i>1 then f[1,i-1]:=1-f[1,i-1];
	end;
     for i:=2 to 5 do
	for j:=1 to 5 do
	   if f[i-1,j]=0 then begin
	       inc(calc);
	       if calc>6 then exit(maxint);
	       f[i-1,j]:=1;
	       f[i,j]:=1-f[i,j];
	       if i<5 then f[i+1,j]:=1-f[i+1,j];
	       if j>1 then f[i,j-1]:=1-f[i,j-1];    
	       if j<5 then f[i,j+1]:=1-f[i,j+1];
	   end;
     for i:=1 to 5 do
	if f[5,i]=0 then exit(maxint);
 end;

begin
    readln(n);
    for s:=1 to n do begin
	for i:=1 to 5 do begin
	    for j:=1 to 5 do begin
		read(ch);
		a[i,j]:=ord(ch)-48;
	    end;
	    readln;
	end;
	min:=maxlongint;
	for w[1]:=0 to 1 do
	   for w[2]:=0 to 1 do
	      for w[3]:=0 to 1 do
		 for w[4]:=0 to 1 do
		    for w[5]:=0 to 1 do begin
			f:=a;
			k:=calc;
			if min>k then min:=k;
		    end;
	if min<=6 then writeln(min) else writeln(-1);
	readln;
    end;
end.