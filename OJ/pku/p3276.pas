program p3276;
const
	maxn = 5100;
	infinity = 1000000000;
var
	n,min,i,k,ans:longint;
	a,w:array[0..maxn] of longint;
	ch,last:char;
function check(x:longint):longint;
 var
 	i,count:longint;
 begin
 	for i:=1 to n do w[i]:=a[i];
 	count:=0;
 	for i:=1 to n - x + 1 do begin
 		count:=count + w[i];
 		w[i + x]:=w[i + x] xor w[i];
 	end;
 	while (i < n) do begin
 		inc(i);
 		if (w[i] > 0) then exit(infinity);
 	end;
 	check:=count;
 end;
 
begin
	readln(n);
	last:='F';
	fillchar(a,sizeof(a),0);
	for i:=1 to n do begin
		read(ch); readln;
		if (ch <> last) then begin
			last:=ch;
			a[i]:=1;
		end;
	end;
	if (last = 'B') then a[n + 1]:=1;
	min:=infinity;
	for i:=1 to n do begin
		k:=check(i);
		if (k < min) then begin
			ans:=i; min:=k;
		end;
	end;
	writeln(ans,' ',min);
end.