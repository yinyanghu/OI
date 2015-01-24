{
	After passing edge in obverse the edge in reverse must be gone though, vice versa.
	It like the indegree and the outdegree.
	In Euler Problem, we only pay attention to the absolute value of Indegree-Outdegree!
	It's not important to know which the in-edge is, in edge in obverse and edge in reverse.
	
	So we can solve this problem as an Euler travel problem by the absolute value of (obverse edge amount- reverse edge amount).
	The detail about Euler travel problem is skipped over.
}
program Ural_1035(Input,Output);
const
	MaxSize=200+1; //1 is important!
type
	TIndex=Longint;
	TFigure=array[1..MaxSize,1..MaxSize]of Char;
	PFigure=^TFigure;
	TUsed=array[0..MaxSize,0..MaxSize]of Boolean;
var
	N,M:TIndex;
	Sum,Count:TIndex;
	Obverse,Reverse:TFigure;
	Used:TUsed;
function InRange(x,y:TIndex):Boolean;
begin
	Result:=(0<=x) and (x<=N) and (0<=y) and (y<=M);
end;
function HasConnect(Ptr:PFigure;x,y,Direct:TIndex;var nx,ny:TIndex):Boolean;
begin
	Result:=false;
	case Direct of 
		1:
		if InRange(x,y) then 
			if (Ptr^[x,y]='\') or (Ptr^[x,y]='X') then 
			begin
				Result:=true;
				nx:=x-1;
				ny:=y-1;
			end;
		2:
		if InRange(x+1,y+1) then 
			if (Ptr^[x+1,y+1]='\') or (Ptr^[x+1,y+1]='X') then
			begin
				Result:=true;
				nx:=x+1;
				ny:=y+1;
			end;
		3:
		if InRange(x+1,y) then 
			if (Ptr^[x+1,y]='/') or (Ptr^[x+1,y]='X') then
			begin
				Result:=true;
				nx:=x+1;
				ny:=y-1;
			end;
		4:
		if InRange(x,y+1) then 
			if (Ptr^[x,y+1]='/') or (Ptr^[x,y+1]='X') then 
			begin
				Result:=true;
				nx:=x-1;
				ny:=y+1;
			end;
	end;
end;

function DFS(x,y:TIndex):Boolean;
var
	CurCount:TIndex;
	nx,ny:TIndex;
	k:TIndex;
begin
	Result:=false;
	Used[x,y]:=true;
	CurCount:=0;
	for k:=1 to 4 do
	begin
		if HasConnect(@Obverse,x,y,k,nx,ny) then
		begin
			Inc(CurCount);
			Result:=true;
			if not Used[nx,ny] then DFS(nx,ny);
		end;
		if HasConnect(@Reverse,x,y,k,nx,ny) then
		begin
			Dec(CurCount);
			Result:=true;
			if not Used[nx,ny] then DFS(nx,ny);
		end;
	end;
	Inc(Count,Abs(CurCount));
end;
procedure Main;
var
	i,j:TIndex;
begin
	Readln(N,M);
	for i:=1 to N do
	begin
		for j:=1 to M do
			Read(Obverse[i,j]);
		Readln;
	end;
	for i:=1 to N do
	begin
		for j:=1 to M do
			Read(Reverse[i,j]);
		Readln;
	end;
	FillChar(Used,SizeOf(Used),0);
	Sum:=0;
	for i:=0 to N do
		for j:=0 to M do
			if not Used[i,j] then
			begin
				Count:=0;
				if DFS(i,j) then
				begin
					if Count=0 then Count:=2;
					Count:=Count div 2;
					Inc(Sum,Count);
				end;
			end;
	Writeln(Sum);
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