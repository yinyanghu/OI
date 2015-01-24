program Ural_1010(Input,Output);
type 
	TIndex=Longint;
	TData=Extended; //note: Int64 can't be used, TLE will be got.
var
	N:TIndex;

procedure Main;
var
	A,B,Max:TData;
	i,Ind:TIndex;
begin
	Read(N);
	Read(A);
	Max:=0;
	Ind:=0;
	for i:=2 to N do
	begin
		Read(B);
		if Abs(B-A)>Max then
		begin
			Max:=Abs(B-A);
			Ind:=i;
		end;
		A:=B;
	end;
	Writeln(Ind-1,' ',Ind);
end;
begin
	Main;
end.