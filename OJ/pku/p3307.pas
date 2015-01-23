program p3307;
const max=1e18;
var n,i,t,total:longint;
    f:array[0..66061] of qword;
procedure qsort(l,r:longint);
 var i,j:longint;
     x,y:qword;
 begin
     i:=l; j:=r; x:=f[(l+r) div 2];
     repeat
	while f[i]<x do inc(i);
	while f[j]>x do dec(j);
	if i<=j then begin
	    y:=f[i]; f[i]:=f[j]; f[j]:=y;
	    inc(i); dec(j);
	end;
     until i>j;
     if l<j then qsort(l,j);
     if i<r then qsort(i,r);
 end;

procedure calc;
 var a,b,c,d,i:longint;
     temp:qword;
     ok:boolean;
 begin
     total:=0;
     for a:=0 to 60 do
	for b:=0 to 38 do
	   for c:=0 to 26 do
	      for d:=0 to 22 do begin
		  ok:=true;
		  temp:=1;
		  for i:=0 to a-1 do begin
		      temp:=temp*2;
		      if (temp>max) or (temp<=0) then begin
			  ok:=false; break;
		      end;
		  end;
		  if not ok then break;
		  for i:=0 to b-1 do begin
		      temp:=temp*3;
		      if (temp>max) or (temp<=0) then begin
			  ok:=false; break;
		      end;
		  end;
		  if not ok then break;
		  for i:=0 to c-1 do begin
		      temp:=temp*5;
		      if (temp>max) or (temp<=0) then begin
			  ok:=false; break;
		      end;
		  end;
		  if not ok then break;
		  for i:=0 to d-1 do begin
		      temp:=temp*7;
		      if (temp>max) or (temp<=0) then begin
			  ok:=false; break;
		      end;
		  end;
		  if not ok then break;
		  inc(total);
		  f[total]:=temp;
	      end;
     qsort(1,total);
 end;

begin
    calc;
    readln(t);
    for i:=1 to t do begin
	readln(n);
	if n<=66061 then writeln(f[n]) else writeln(n);
    end;
end.
