{
	Author: Amber
	Method: Hungary for Max Weighted Match
	Complexity: O(N^3)
}
program SGU_210(Input,Output);
const
	MaxN=400;
	MaxValue=MaxLongint div 4;
type
	TIndex=Longint;
	TValue=array[1..MaxN]of TIndex;
	TGraph=array[1..MaxN,1..MaxN]of TIndex;
	TLink=array[1..MaxN]of TIndex;
	TLabel=array[1..MaxN]of TIndex;
	TSet=array[1..MaxN]of Boolean;
var
	N:TIndex;
	D:TValue;
	G:TGraph;
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
		if (Lx[i]+Ly[j]=G[i,j]) and not Uy[j] then
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
	Ans:TLink;
begin
	Readln(N);
	for i:=1 to N do
		Read(D[i]);
	Readln;
	FillChar(G,SizeOf(G),0);
	for i:=1 to N do
	begin
		Read(k);
		while k>0 do
		begin
			Dec(k);
			Read(j);
			G[i,j]:=Sqr(D[i]);
		end;
		Readln;
	end;
	
	//Hungary for best-match
	FillChar(Lx,SizeOf(Lx),0);
	FillChar(Ly,SizeOf(Ly),0);
	FillChar(Link,SizeOf(Link),0);
	for i:=1 to N do
		for j:=1 to N do
			if Lx[i]<G[i,j] then
				Lx[i]:=G[i,j];
	for k:=1 to N do
		repeat
			FillChar(Ux,SizeOf(Ux),0);
			FillChar(Uy,SizeOf(Uy),0);
			if FindPath(k) then Break;
			Delta:=MaxValue;
			for i:=1 to N do
				if Ux[i] then
					for j:=1 to N do
						if not Uy[j] and (Lx[i]+Ly[j]-G[i,j]<Delta) then
							Delta:=Lx[i]+Ly[j]-G[i,j];
			for i:=1 to N do
			begin
				if Ux[i] then Dec(Lx[i],Delta);
				if Uy[i] then Inc(Ly[i],Delta);
			end;
		until false;

	FillChar(Ans,SizeOf(Ans),0);
	for i:=1 to N do
		if G[Link[i],i]>0 then Ans[Link[i]]:=i;
	for i:=1 to N do
		Write(Ans[i],' ');
	Writeln;
end;
begin
	Main;
end.