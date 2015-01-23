program p3252;
const
	maxn = 32;
var
	c:array[0..maxn,0..maxn] of longint;
	f:array[0..maxn] of longint;
	p:array[0..maxn] of longint;
	left,right,i,j:longint;

function calc(n:longint):longint;
 var
	len,zero,one,i,j:longint;
        ans:longint;
 begin
 	if (n = 0) or (n = 1) then exit(1);
 	fillchar(p,sizeof(p),0);
 	zero:=0; one:=0; ans:=0; len:=0;
 	while (n > 0) do begin
 		if (n and 1 = 1) then begin
 			inc(one);
 			p[len]:=1;
 		end else begin
 			inc(zero);
 			p[len]:=0;
 		end;
  		inc(len);
 		n:=n shr 1;
 	end;
 	if (zero >= one) then inc(ans);
	for i:=0 to len - 2 do begin
		if (p[i] = 1) then begin
			dec(one);
			j:=i;
			while (j >= 0) and (j * 2 >= one - zero + i - 1) do begin
				ans:=ans + c[i,j];
				dec(j);
			end;
		end else dec(zero);
		ans:=ans + f[i + 1];
	end;
	calc:=ans;
 end;

begin
	for i:=0 to 32 do begin
		c[i,0]:=1; c[i,i]:=1;
		for j:=1 to i - 1 do c[i,j]:=c[i - 1,j - 1] + c[i - 1,j];
	end;
	fillchar(f,sizeof(f),0);
	f[1]:=1;
	for i:=2 to 32 do begin
		j:=i - 1;
		while (j * 2 >= i) do begin
			f[i]:=f[i] + c[i - 1,j];
			dec(j);
		end;
	end;
	readln(left,right);
	writeln(calc(right) - calc(left - 1));
end.
