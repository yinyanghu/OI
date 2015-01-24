{
It has been doing during 2003-8-12 to 2005-2-6.Faint!!!
Changing Int64->Extended will get AC.
I have written 4 versions which are Longint->Int64->HP->Extended.
}
{$N+}
program Ural_1133(Input,Output);
type
	TIndex=Longint;
	TData=Extended;
procedure Main;
var
	i,j,k,n:TIndex;
	Fi,Fj,F1,F2,tmp:TData;
begin
	Readln(i,Fi,j,Fj,n);
	if i>j then
	begin
		k:=i;
		i:=j;
		j:=k;
		tmp:=Fi;
		Fi:=Fj;
		Fj:=tmp;
	end;
	if j=i+1 then 
	begin
		F1:=Fi;
		F2:=Fj;
	end
	else 
	begin
		F1:=1;
		F2:=1;
		for k:=1 to j-i-2 do
		begin
			tmp:=F1+F2;
			F1:=F2;
			F2:=tmp;
		end;
		F2:=(Fj-Fi*F1)/F2;
		F1:=Fi;
	end;
	if n=i then Writeln(F1:0:0)
	else if n=i+1 then Writeln(F2:0:0)
	else if n>i+1 then 
	begin
		for k:=1 to n-i-1 do
		begin
			tmp:=F1+F2;
			F1:=F2;
			F2:=tmp;
		end;
		Writeln(F2:0:0);
	end
	else if n<i then 
	begin
		for k:=1 to i-n do
		begin
			tmp:=F2-F1;
			F2:=F1;
			F1:=tmp;
		end;
		Writeln(F1:0:0);
	end;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o2.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.