program p1499;
const
	maxn = 80;
var
	f,g:array[1..maxn] of longint;
	s:string;
	n:longint;
	
procedure init;
 begin
	readln(s);
	if (s = '0') then halt;
	n:=length(s);
 end;
 
function compare(flag:string; sa,ta,sb,tb:longint):boolean;
 var
	lena,lenb,aa,bb,i:longint;
 begin
 	aa:=sa;
	while (s[aa] = '0') and (aa < ta) do inc(aa);
	lena:=ta - aa + 1;	
	bb:=sb;
	while (s[bb] = '0') and (bb < tb) do inc(bb);
	lenb:=tb - bb + 1;
	
	if (flag = '>') then begin	
		if (lena > lenb) then exit(true);
		if (lena < lenb) then exit(false);
		for i:=0 to lena - 1 do begin
			if (s[aa + i] > s[bb + i]) then exit(true);
			if (s[aa + i] < s[bb + i]) then exit(false);
		end;
		compare:=false;
	end else if (flag = '<') then begin
		if (lena > lenb) then exit(false);
		if (lena < lenb) then exit(true);
		for i:=0 to lena - 1 do begin
			if (s[aa + i] > s[bb + i]) then exit(false);
			if (s[aa + i] < s[bb + i]) then exit(true);
		end;
		compare:=false;	
	end else begin
		if (lena > lenb) then exit(false);
		if (lena < lenb) then exit(true);
		for i:=0 to lena - 1 do begin
			if (s[aa + i] > s[bb + i]) then exit(false);
			if (s[aa + i] < s[bb + i]) then exit(true);
		end;
		compare:=true;		
	end;
 end;
 
procedure dp;
 var
	i,j,k:longint;
 begin
	f[1]:=1;
	for i:=2 to n do begin
		f[i]:=1;
		for j:=2 to i do
			if (compare('>',j,i,f[j - 1],j - 1)) and (compare('<=',j,i,f[i],i)) then f[i]:=j;
	end;
	
	k:=f[n];
	g[k]:=n;
	for i:=k - 1 downto 1 do
		if (s[i] = '0') then g[i]:=g[i + 1]
			else begin
				g[i]:=i;
				for j:=i + 1 to k - 1 do
					if (compare('<',i,j,j + 1,g[j + 1]) and (compare('>',i,j,g[i],i))) then g[i]:=j;
			end;
	k:=1;
	while true do begin
		for i:=k to g[k] do write(s[i]);
		if (g[k] = n) then break;
		k:=g[k] + 1;
		write(',');
	end;
	writeln;
 end;
 
begin
	while true do begin
		init;
		dp;
	end;
end.
