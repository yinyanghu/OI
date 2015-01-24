program calc;
const
	maxl = 100;
type
	bignumber = record
		len:longint;
		num:array[1..maxl] of longint;
	end;
var
	a,b,c,d:bignumber;
	s:string;
	
procedure plus(a,b:bignumber; var c:bignumber);
 var
	i,k:longint;
 begin
 	fillchar(c,sizeof(c),0);
	k:=0;
	if (a.len > b.len) then c.len:=a.len else c.len:=b.len;
	for i:=1 to c.len do begin
		c.num[i]:=a.num[i] + b.num[i] + k;
		k:=c.num[i] div 10;
		c.num[i]:=c.num[i] mod 10;
	end;
	if (k <> 0) then begin
		inc(c.len);
		c.num[c.len]:=k;
	end;
 end;
	
procedure minus(a,b:bignumber; var c:bignumber);
 var
	i:longint;
 begin
	fillchar(c,sizeof(c),0);
	if (a.len > b.len) then c.len:=a.len else c.len:=b.len;
	for i:=1 to c.len do begin
		c.num[i]:=c.num[i] + a.num[i] - b.num[i];
		if (c.num[i] < 0) then begin
			c.num[i]:=c.num[i] + 10;
			dec(c.num[i + 1]);
		end;
	end;
	while (c.len > 1) and (c.num[c.len] = 0) do dec(c.len);
 end;
 
procedure multiply(a,b:bignumber; var c:bignumber);
 var
	i,j:longint;
 begin
	fillchar(c,sizeof(c),0);
	for i:=1 to a.len do
		for j:=1 to b.len do begin
			c.num[i + j - 1]:=c.num[i + j - 1] + a.num[i] * b.num[j];
			c.num[i + j]:=c.num[i + j] + c.num[i + j - 1] div 10;
			c.num[i + j - 1]:=c.num[i + j - 1] mod 10;
		end;
	c.len:=a.len + b.len + 1;
	while (c.len > 1) and (c.num[c.len] = 0) do dec(c.len);
 end;
 
procedure multiply(a:bignumber; b:longint; var c:bignumber);
 var
	i,k:longint;
 begin
 	fillchar(c,sizeof(c),0);
	k:=0;
	for i:=1 to a.len do begin
		c.num[i]:=a.num[i] * b + k;
		k:=c.num[i] div 10;
		c.num[i]:=c.num[i] mod 10;
	end;
	c.len:=a.len;
	while (k <> 0) do begin
		inc(c.len);
		c.num[c.len]:=k mod 10;
		k:=k div 10;
	end;
	while (c.len > 1) and (c.num[c.len] = 0) do dec(c.len);
 end;

function dividelow(a:bignumber; b:longint; var c:bignumber):longint;
 var
	i,k:longint;
 begin
	fillchar(c,sizeof(c),0);
	k:=0;
	for i:=a.len downto 1 do begin
		c.num[i]:=(k * 10 + a.num[i]) div b;
		k:=(k * 10 + a.num[i]) mod b;
	end;
	c.len:=a.len;
	while (c.len > 1) and (c.num[c.len] = 0) do dec(c.len);
	dividelow:=k;
 end;

function compare(a,b:bignumber):longint;
 var
	k:longint;
 begin
	if (a.len > b.len) then exit(1);
	if (a.len < b.len) then exit(-1);
	k:=a.len;
	while (k > 0) and (a.num[k] = b.num[k]) do dec(k);
	if (k = 0) then exit(0) else exit(a.num[k] - b.num[k]);
 end;

procedure dividehigh(a,b:bignumber; var c,d:bignumber); //c-->shang d-->yushu
 var
	i:longint;
 begin
	fillchar(c,sizeof(c),0);
	fillchar(d,sizeof(d),0);
	d.len:=1;
	for i:=a.len downto 1 do begin
		multiply(d,10,d);
		d.num[1]:=a.num[i];
		while (compare(d,b) >= 0) do begin
			minus(d,b,d);
			inc(c.num[i]);
		end;
	end;
	c.len:=a.len;
	while (c.len > 1) and (c.num[c.len] = 0) do dec(c.len);
 end;
 
function change(s:string):bignumber;
 var
	i:longint;
	a:bignumber;
 begin
	fillchar(a,sizeof(a),0);
	a.len:=length(s);
	for i:=1 to a.len do a.num[i]:=ord(s[a.len - i + 1]) - 48;
	change:=a;
 end;
 
procedure print(c:bignumber);
 var
	i:longint;
 begin
	for i:=c.len downto 1 do write(c.num[i]);
	writeln;
 end;

begin

end.
