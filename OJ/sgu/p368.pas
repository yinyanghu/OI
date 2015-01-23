program p368;
const
	maxn = 100;
	maxm = 100;
var
	score:array[1..maxn] of longint;
	exam:array[1..maxm] of longint;
	ea,eb,ec,i,j,k,x,tot,n,m:longint;
	s,p:string;
	flag:boolean;

begin
	flag:=true;
	readln(n,m);
	for i:=1 to m do read(score[i]);
	readln;
	for i:=1 to n do begin
		readln(s);
		read(k);
		for j:=1 to k do read(exam[j]);
		tot:=0;
		for j:=1 to k do begin
			read(ea,eb,ec);
			if (score[exam[j]] < ea) then tot:=tot + 2
				else if (score[exam[j]] < eb) then tot:=tot + 3
					else if (score[exam[j]] < ec) then tot:=tot + 4
						else tot:=tot + 5;
		end;
		readln(k);
		for j:=1 to k do begin
			readln(p);
			readln(x);
			if (tot >= x) then begin
				writeln(s,' ',p);
				flag:=false;
			end;
		end;
	end;
	if flag then writeln('Army');
end.
