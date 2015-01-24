{
	Author: Amber
	Method: BinarySearch+DP(optimal)
	Clarity:
		不错的递推题
		1.最优子结构
			f(n) -> f(m) m<n
			Transfer: m=max(n div r+n mod r, n div r-1+r-1) //用r来替换，最多剩下的空格
		2.按1写出一个sb程序,发现f是非严格单调的，所以只要找到最小的m即可转移。
		3.又发现m的取值关于r为一个单峰.（可以用优选法找单峰，但我用线性算法，加一个剪枝）
			所以从DP就编成的递推
		4.题目说找到一个最大的K,s.t.K>=L f(K)=f(L),由于单调，就可以二分了
			
}
program Ural_1324(Input,Output);
const
	MaxN=2000000;
	MaxK=720000000; //718052410
	MaxValue=MaxLongint;
	Answer:array[0..7]of Longint=(1,2,4,10,40,460,53590,718052410);
type
	TIndex=Longint;
var
	N:TIndex;
function DFS(N:TIndex;Print:Boolean):TIndex;
var
	M,R:TIndex;
	MinInd,Min:TIndex;
begin
	Result:=0;
	while N>1 do
	begin
		R:=1;
		Min:=MaxValue;
		MinInd:=0;
		while R<N do
		begin
			Inc(R);
			M:=N div R+R-2+Ord(N mod R=R-1); //M:=N div R+Max(N mod R, R-2);
			if M<Min then
			begin
				MinInd:=R;
				Min:=M;
			end;
			if M>Min then Break;
		end;
		if Print then Writeln(MinInd);
		N:=Min;
		Inc(Result);
	end;
end;
function BinarySearch(Left,Right,Key:TIndex):TIndex;
var
	Mid:TIndex;
	Times:TIndex;
begin
	repeat
		Mid:=(Left+Right+1) div 2; //Guarantee Mid<>Left, otherwise get death-loop.
		Times:=DFS(Mid,false);
		if Times>Key then
			Right:=Mid-1
		else
			Left:=Mid;
	until Left=Right;
	Result:=Left;
end;
procedure Main;
var
	N:TIndex;
	Times:TIndex;
begin
	Readln(N);
	Times:=DFS(N,false);
	Writeln(Times);
 	DFS(BinarySearch(N,MaxK,Times),true); 
//  	DFS(Answer[Times],true); //Make it faster. Answer is the result of BinarySearch.
end;
begin
	Main;
end.