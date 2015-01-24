{
	Method: DFS (Memorable Search) 
		放弃DP,才能剪枝,只有部分状态被记忆化(Hash)
		这样空间,时间都高效

		详见 [WC2005]逆向思维

	CE 1 time: "const HashSave_UpperBound=1000000000000000;"  in freepascal is an Error
	MLE 1 time: 1400K ; N-> integer; H,M->shortint in Hashlist, 963K
}
program Ural_1148(Input,Output);
const
	MaxH=60;
	HashSize=59997;
{
	//In Delphi
	HashSave_LowerBound=0;
	HashSave_UpperBound=1000000000000000;
}
type
	TIndex=Longint;
	TData=Int64;
	THash_Node=record
		N:Integer;
		H,M:ShortInt;
		Count:TData;
	end;
	THashList=array[0..HashSize-1]of THash_Node;
	TPower=array[0..MaxH]of TData;
var
	N,H,M:TIndex;
	HashList:THashList;
	Power:TPower;
	HashSave_LowerBound,HashSave_UpperBound:TData;

function Hash(N,H,M:TIndex):TIndex;
begin
	Result:=(((N shl 7 + H) shl 5)+M) mod HashSize;
end;
function Hash_Find(N,H,M:TIndex;var Count:TData):Boolean;
var
	X:TIndex;
begin
	X:=Hash(N,H,M);
	Result:=true;
	while (HashList[X].Count>=0) do 
		if (HashList[X].N=N) and (HashList[X].H=H) and (HashList[X].M=M) then
		begin
			Count:=HashList[X].Count;
			Exit;
		end
		else 
			X:=(X+1) mod HashSize;
	Result:=false;
end;
procedure Hash_Insert(N,H,M:TIndex;Count:TData);
var
	X:TIndex;
begin
	X:=Hash(N,H,M);
	while (HashList[X].Count>=0) do X:=(X+1) mod HashSize;
	HashList[X].N:=N;
	HashList[X].H:=H;
	HashList[X].M:=M;
	HashList[X].Count:=Count;
end;
function Min_Need(H,M:TIndex):TIndex;
begin
	if M>=H then 
		Result:=(M+M-H+1)*H div 2
	else
		Result:=(M+1)*M div 2+2*(H-M)-(H-M) div 2;
end;
function Max_Need(H,M:TIndex):TIndex;
begin
	Result:=(M+M+H-1)*H div 2;
end;
function DFS(N,H,M:TIndex):TData;
begin
	Result:=0;
	if H<=0 then Exit;
	if M<=0 then Exit;
	if N<Min_Need(H,M) then Exit;
	if N>=Max_Need(H,M) then 
		if H<=M then 
		begin
			Result:=Power[H-1];
			Exit;
		end
		else N:=Max_Need(H,M);
	
	if Hash_Find(N,H,M,Result) then Exit;
	Result:=DFS(N-M,H-1,M+1)+DFS(N-M,H-1,M-1);
	if (HashSave_LowerBound<=Result) and (Result<=HashSave_UpperBound) then 
		Hash_Insert(N,H,M,Result);
end;
procedure PrintWay(Index:TData);
var
	CurN,CurM,CurH:TIndex;
	CurCount:TData;
begin
	Write(M);
	CurN:=N;
	CurM:=M;
	for CurH:=H-1 downto 1 do
	begin
		Dec(CurN,CurM);
		CurCount:=DFS(CurN,CurH,CurM-1);
		if Index<=CurCount then 
			Dec(CurM)
		else 
		begin
			Dec(Index,CurCount);
			Inc(CurM);
		end;
		Write(' ',CurM);
	end;
	Writeln;
end;
procedure Main;
var
	i:TIndex;
	Index:TData;
begin
	HashSave_LowerBound:=0;
	HashSave_UpperBound:=100000000;
	HashSave_UpperBound:=HashSave_UpperBound*10000000;

	Readln(N,H,M);
	if N>=Max_Need(H,M) then N:=Max_Need(H,M);

	FillChar(HashList,SizeOf(HashList),255);//Count=-1

	Power[0]:=1;
	for i:=1 to H do
		Power[i]:=Power[i-1]*2;

	Writeln(DFS(N,H,M));
	while true do
	begin
		Readln(Index);
		if Index=-1 then Break;
		PrintWay(Index);
	end;
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