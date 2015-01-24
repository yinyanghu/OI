program Ural_1406(Input,Output);
const
	MaxLen=2000;
type
	TIndex=Longint;
	TData=array[0..MaxLen]of Char;
var
	Len:TIndex;
	D:TData;
procedure Main;
label
	Error;
var
	i,j,k:TIndex;
	Temp:Char;
begin
	//Read Data
	Len:=0;
	while not Eoln do
	begin
		Inc(Len);
		Read(D[Len]);
	end;
	//Find first non-zero digit from right
	i:=Len;
	while (D[i]='0') and (i>0) do Dec(i);
	if i=0 then goto Error;
	Temp:=D[i];
	D[i]:='0';
	//Find first non-nine digit from i
	j:=i-1;
	while (D[j]='9') and (j>0) do 
	begin
		D[j]:='0';
		Dec(j);
	end;
	if j=0 then goto Error;
	//Change Value
	Inc(D[j]);
	Dec(Temp);
	for k:=1 to i-j-1 do
		D[Len-k+1]:='9';
	D[Len-(i-j)+1]:=Temp;
	//Output
	for k:=1 to Len do
		Write(D[k]);
	Writeln;
	Exit;
	//Error
	Error:
		Writeln(-1);
end;
begin
	Main;
end.