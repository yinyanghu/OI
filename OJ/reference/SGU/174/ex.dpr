{
	Author: Amber
	Method: Disjoint-Set
	Clarity: 
		����ظ������ཻ(�����)���߶Σ����߶�i,ʹ�÷���1,2,..,i�������һ��������

		����ֻ��������,���԰Ѷ˵���ΪԪ��,�߶�Ϊ�ϲ�������
		���߶����˵ĵ��ںϲ�ǰ�Ѿ���ͬһ��������,���������֣��˳���
		������ò��鼯ʵ�֡�
		�����ʣ�²����غϵ������,�����¼��ַ�����
			1)���������򻯵㼯�����ֲ��ҡ� (Ԥ����)
			2)Hash (��̬����)
			3)��̬���ҵ����ݽṹ (Treap��) (��̬����)
		1)AC��,2)AC��,3)û�� :P
	Version: 1 (Binary search)
	Complexiy: O(MlogM) ����Ѳ��鼯�ĸ��Ӷ���Ϊ����
}
program SGU_174(Input,Output);
const
	MaxM=200000;
	MaxN=MaxM*2;
type
	TIndex=Longint;
	TPoint=record
		x,y:TIndex;
	end;
	TPointSet=array[1..MaxN]of TPoint;
	TFather=array[1..MaxN]of TIndex;
	TOrder=array[1..MaxN]of TIndex;
var
	N,M:TIndex;
	PointSet:TPointSet;
	Father:TFather;
	Order:TOrder;
function Compare(const P,Q:TPoint):TIndex;
begin
	Result:=P.x-Q.x;
	if Result=0 then Result:=P.y-Q.y;
end;
procedure QuickSort(l,r:TIndex);
var
	i,j:TIndex;
	Mid,Tmp:TIndex;
begin
	i:=l;
	j:=r;
	Mid:=Order[i+Random(j-i+1)];
	repeat
		while Compare(PointSet[Order[i]],PointSet[Mid])<0 do Inc(i);
		while Compare(PointSet[Order[j]],PointSet[Mid])>0 do Dec(j);
		if i<=j then
		begin
			Tmp:=Order[i];
			Order[i]:=Order[j];
			Order[j]:=Tmp;
			Inc(i);
			Dec(j);
		end;
	until i>j;
	if l<j then QuickSort(l,j);
	if i<r then QuickSort(i,r);
end;
function Simplify(Num:TIndex):TIndex;
var
	i:TIndex;
begin
	Result:=0;
	for i:=1 to Num do
		if Compare(PointSet[Order[Result]],PointSet[Order[i]])<>0 then
		begin
			Inc(Result);
			Order[Result]:=Order[i];
		end;
end;
function BinarySearch(P:TPoint):TIndex;
var
	Left,Right,Mid:TIndex;
	Differ:TIndex;
begin
	Left:=1;
	Right:=N;
	Mid:=0;
	while Left<=Right do
	begin
		Mid:=(Left+Right) div 2;
		Differ:=Compare(P,PointSet[Order[Mid]]);
		if Differ<0 then 
			Right:=Mid-1
		else if Differ>0 then
			Left:=Mid+1
		else
			Break;
	end;
	Result:=Mid;
end;
function Find(x:TIndex):TIndex;
begin
	if Father[x]<0 then
		Result:=x
	else
	begin
		Father[x]:=Find(Father[x]);
		Result:=Father[x];
	end;
end;
function Union(x,y:TIndex):Boolean; //T:x=y;F:else
begin
	Result:=true;
	if x=y then Exit;
	Father[y]:=x;
	Result:=false;
end;
procedure Main;
var
	i:TIndex;
begin
	//Read Data
	Readln(M);
	for i:=1 to M do
	begin
		with PointSet[i*2-1] do
			Read(x,y);
		with PointSet[i*2] do
			Readln(x,y);
		Order[i*2-1]:=i*2-1;
		Order[i*2]:=i*2;
	end;
	//Sort Point
	Randomize;
	QuickSort(1,M*2);
	N:=Simplify(M*2);
	//Main by disjoint-set and binary search
	FillChar(Father,SizeOf(Father),255);
	for i:=1 to M do
		if Union(Find(BinarySearch(PointSet[i*2-1])),Find(BinarySearch(PointSet[i*2]))) then
		begin
			Writeln(i);
			Exit;
		end;
	Writeln(0);
end;
begin
	Main;
end.