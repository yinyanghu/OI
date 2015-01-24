program Ural_1339(Input,Output);
const
	MaxN=250000;
	Used=MaxN+1;
type
	TIndex=Longint;
	TLink=array[0..MaxN]of TIndex;
var
	N:TIndex;
	P,Q:TLink;
procedure Main;
var
	i,j,k:TIndex;
begin
	Readln(N);
	P[0]:=0;
	Q[0]:=0;
	for i:=1 to N do
		Read(P[i]);
	for i:=1 to N do
		Read(Q[i]);
	for i:=1 to N do //Init match
		Q[P[i]]:=-Q[P[i]];
	for i:=1 to N do //Find augment paths
		if Q[i]>0 then
		begin
			j:=i;
			Q[j]:=-Q[j];
			repeat
				k:=P[-Q[j]];
				P[-Q[j]]:=j;
				j:=k;
			until Q[j]=0;
		end;
	for i:=1 to N do
		Q[P[i]]:=Used;
	j:=0;
	for i:=1 to N do
	begin
		if P[i]>0 then
			Write(P[i])
		else //Unmatch nodes
		begin
			repeat
				Inc(j);
			until Q[j]<>Used;
			Write(j);
		end;
		if i<N then Write(' ');
	end;
	Writeln;
end;
begin
	Main;
end.