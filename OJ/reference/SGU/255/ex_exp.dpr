{
	Author: Amber
	Clarity:
		Simulate for seeking the principle in this problem.
}
program SGU_255_Experiment(Input,Output);
type
	TIndex=Longint;
var 
	i:TIndex;
	K,T,C,M,LastM:TIndex;
	Count:TIndex;
begin
	Count:=0;
	LastM:=0;
	for K:=1 to 100000 do //for each K
	begin
		M:=0;
		for i:=K+1 to 2*K do
		begin
			T:=i;
			C:=0;
			while T>0 do
			begin
				if T and 1=1 then Inc(C);
				if C>3 then Break;
				T:=T shr 1;
			end;
			if C=3 then Inc(M);
		end;
		if LastM=M then 
			Inc(Count)
		else
		begin
			if Count=1 then Write(K,':',LastM,' ');
			LastM:=M;
			Count:=1;
		end;
	end;
	Writeln;
end.