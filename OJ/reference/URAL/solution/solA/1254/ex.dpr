{
	SPFA
	Use a duality TDistance to store distance cuz of high precision.
}
program Ural_1254(Input,Output);
const
	MaxSize=75;
	MaxQueueSize=Sqr(MaxSize)*2;
	MaxValue=MaxLongint div 32;
	Direction:array[1..8]of record
		x,y:ShortInt;
	end=((x:1;y:0),(x:-1;y:0),(x:0;y:1),(x:0;y:-1),(x:1;y:1),(x:1;y:-1),(x:-1;y:1),(x:-1;y:-1));
type
	TIndex=Longint;
	TData=Extended;
	TMap=array[1..MaxSize,1..MaxSize]of Char;
	TQueue=array[1..MaxQueueSize]of TIndex;
	TUsed=array[1..Sqr(MaxSize)]of Boolean;
	TDistance=array[0..1]of TIndex;
	TDist=array[1..Sqr(MaxSize)]of TDistance;
	TToXY=array[1..Sqr(MaxSize)]of record
		x,y:ShortInt;
	end;
var
	N,M,K:TIndex;
	V:TData;
	Map:TMap;
	Queue:TQueue;
	Dist:TDist;
	Used:TUsed;
	ToXY:TToXY;
	Step:array[0..1]of TData;

function Transfer(u:TIndex;var v:TIndex;Dirc:TIndex):Boolean;
var
	x,y:TIndex;
begin
	x:=ToXY[u].x+Direction[Dirc].x;
	y:=ToXY[u].y+Direction[Dirc].y;
	v:=(x-1)*M+y;
	Result:=false;
	if (1<=x) and (x<=N) and (1<=y) and (y<=M) then
		if Map[x,y]='.' then
			Result:=true;
end;
function GetDist(u:TIndex):TData;
begin
	Result:=Dist[u][0]*Step[0]+Dist[u][1]*Step[1];
end;
function SPFA(S,T:TIndex):TDistance;
var
	Pop,Push:TIndex;
	u,v:TIndex;
	Dirc:TIndex;
begin
	for u:=1 to N*M do
	begin
		Dist[u][0]:=MaxValue;
		Dist[u][1]:=MaxValue;
		Used[u]:=false;
	end;
	Dist[S][0]:=0;
	Dist[S][1]:=0;
	Used[S]:=true;
	Queue[1]:=S;
	Pop:=1;
	Push:=2;
	while Pop<>Push do
	begin
		u:=Queue[Pop];
		for Dirc:=1 to 8 do
			if Transfer(u,v,Dirc) then
				if GetDist(v)>GetDist(u)+Step[Ord(Dirc>4)] then
				begin
					Dist[v]:=Dist[u];
					Inc(Dist[v][Ord(Dirc>4)]);
					if not Used[v] then
					begin
						Used[v]:=true;
						Queue[Push]:=v;
						Inc(Push);
						if Push>MaxQueueSize then Push:=1;
					end;
				end;
		Used[u]:=false;
		Inc(Pop);
		if Pop>MaxQueueSize then Pop:=1;
	end;
	Result:=Dist[T];
end;
procedure Main;
var
	i,j:TIndex;
	Sx,Sy,Tx,Ty:TIndex;
	Cur,Total:TDistance;
begin
	Step[0]:=1;
	Step[1]:=Sqrt(2);
	Readln(N,M,K,V);
	for j:=1 to M do
	begin
		for i:=1 to N do
		begin
			Read(Map[i,j]);
			ToXY[(i-1)*M+j].x:=i;
			ToXY[(i-1)*M+j].y:=j;
		end;
		Readln;
	end;
	Total[0]:=0;
	Total[1]:=0;
	Readln(Sx,Sy);
	for i:=1 to K do
	begin
		Readln(Tx,Ty);
		Cur:=SPFA((Sx-1)*M+Sy,(Tx-1)*M+Ty);
		if (Cur[0]<MaxValue) and (Cur[1]<MaxValue) then
		begin
			Inc(Total[0],Cur[0]);
			Inc(Total[1],Cur[1]);
			Sx:=Tx;
			Sy:=Ty;
		end;
	end;
	Writeln((Total[0]*Step[0]+Total[1]*Step[1])/V:0:2);
end;
begin
	Main;
end.