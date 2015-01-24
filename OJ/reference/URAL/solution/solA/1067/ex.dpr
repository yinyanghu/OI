program Ural_1067(Input,Output);
const
	MaxN=500+1;
	MaxLen=80+5;
type
	TIndex=Longint;
	TPath=array[1..MaxN]of string[MaxLen];
var
	N:TIndex;
	Path:TPath;

procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:string;
begin
	i:=l;
	j:=r;
	Mid:=Path[(i+j) div 2];
	repeat
		while Path[i]<Mid do Inc(i);
		while Mid<Path[j] do Dec(j);
		if i<=j then
		begin
			Tmp:=Path[i];
			Path[i]:=Path[j];
			Path[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;

function GetDir(i:TIndex):string;
begin
	Result:=Copy(Path[i],1,Pos(#1,Path[i])-1);
end;
procedure PrintTree(l,r,Level:TIndex);
var
	i,j,k:TIndex;
begin
	i:=l;
	while (i<=r) and (GetDir(i)='') do Inc(i);
	while (i<=r) do
	begin
		j:=i;
		while (j+1<=r) and (GetDir(i)=GetDir(j+1)) do Inc(j);
		for k:=1 to Level do Write(' ');
		Writeln(GetDir(i));
		for k:=i to j do
			Delete(Path[k],1,Pos(#1,Path[k]));
		PrintTree(i,j,Level+1);
		i:=j+1;
	end;
end;
procedure Main;
var
	i:TIndex;
begin
	Readln(N);
	for i:=1 to N do
	begin
		Readln(Path[i]);
		while Pos('\',Path[i])>0 do Path[i][Pos('\',Path[i])]:=#1;
		if Path[i][Length(Path[i])]<>#1 then Path[i]:=Path[i]+#1;
	end;
	QuickSort(1,N);
	PrintTree(1,N,0);
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