program Ural_1076(Input,Output);
const
	MaxN=150;
	MaxValue=MaxLongint div 8;
type
	TIndex=Longint;
	TWeight=array[1..MaxN,1..MaxN]of TIndex;
	TLink=array[1..MaxN]of TIndex;
	TLabel=array[1..MaxN]of TIndex;
	TSet=array[1..MaxN]of Boolean;
var
	N:TIndex;
	W:TWeight;
	Lx,Ly:TLabel;
	Ux,Uy:TSet;
	Link:TLink;

function FindPath(i:TIndex):Boolean;
var
	j:TIndex;
begin
	Result:=true;
	if i=0 then Exit;
	Ux[i]:=true;
	for j:=1 to N do
		if (Lx[i]+Ly[j]=W[i,j])and not Uy[j] then
		begin
			Uy[j]:=true;
			if (Link[j]=0) or FindPath(Link[j]) then 
			begin
				Link[j]:=i;
				Exit;
			end;
		end;
	Result:=false;
end;
procedure Main;
var
	i,j,k:TIndex;
	Delta:TIndex;
	Total:TIndex;
begin
	Read(N);
	Total:=0;
	for i:=1 to N do
		for j:=1 to N do
		begin
			Read(W[i,j]);
			Inc(Total,W[i,j]);
		end;

	FillChar(Lx,SizeOf(Lx),0);
	FillChar(Ly,SizeOf(Ly),0);
	FillChar(Link,SizeOf(Link),0);
	for i:=1 to N do
		for j:=1 to N do
			if Lx[i]<W[i,j] then
				Lx[i]:=W[i,j];
	for k:=1 to N do
		repeat
			FillChar(Ux,SizeOf(Ux),0);
			FillChar(Uy,SizeOf(Uy),0);
			if FindPath(k) then Break;
			Delta:=MaxValue;
			for i:=1 to N do
				if Ux[i] then
					for j:=1 to N do
						if not Uy[j] and (Lx[i]+Ly[j]-W[i,j]<Delta) then
							Delta:=Lx[i]+Ly[j]-W[i,j];
			for i:=1 to N do
			begin
				if Ux[i] then Dec(Lx[i],Delta);
				if Uy[i] then Inc(Ly[i],Delta);
			end;
		until false;
	for i:=1 to N do
		if Link[i]>0 then
			Dec(Total,W[Link[i],i]);
	Writeln(Total);
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'i.txt');
	Reset(Input);
	Assign(Output,'o.txt');
	Rewrite(Output);
{$ENDIF}
	Main;
{$IFNDEF ONLINE_JUDGE}
	Close(Input);
	Close(Output);
{$ENDIF}
end.
