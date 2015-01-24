program gen;
const
	maxn = 1000000;
	maxm = 10000000;
	limitsize = 100000;
var
	i, total:longint;
begin
	assign(output,'in.txt'); rewrite(output);
	writeln(maxn,' ',maxm);
	randomize;
	total:=0;
	for i:=2 to maxn do begin
		inc(total);
		writeln(random(i - 1),' ', i - 1, ' ',random(limitsize) + 1);
	end;
	while (total < maxm) do begin
		inc(total);
		writeln(random(maxn), ' ', random(maxn), ' ', random(limitsize) + 1);
	end;
	writeln(0);
	close(output);
end.
