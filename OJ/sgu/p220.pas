program p220;
const
	maxn = 10;
var
	f,g:array[0..maxn] of int64;
	n,bishop:longint;
procedure init;
 begin
 	readln(n,bishop);
 	if (n = 1) then begin
 		if (bishop <= 1) then writeln(1) else writeln(0);
 		halt;
 	end;
 end;
 
procedure main;
 var
 	i,j,a,b,left,right:longint;
	ans:int64;
 begin
	fillchar(f,sizeof(f),0);
	f[0]:=1; f[1]:=1;
	a:=1;
	for i:=2 to n do begin
		a:=a + ord(odd(i)) * 2;
		for j:=a downto 1 do f[j]:=f[j] + f[j - 1] * (a - j + 1);
	end;
	fillchar(g,sizeof(g),0);
 	g[0]:=1; g[1]:=2;
 	b:=2;
 	for i:=2 to n - 1 do begin
 		b:=b + ord(odd(i)) * 2;
 		for j:=b downto 1 do g[j]:=g[j] + g[j - 1] * (b - j + 1);
 	end;
 	
 	if (bishop - b > 0) then left:=bishop - b else left:=0;
 	if (a < bishop) then right:=a else right:=bishop;
 	ans:=0;
 	for i:=left to right do ans:=ans + f[i] * g[bishop - i];
 	writeln(ans);
 end;
 
begin
	init;
	main;
end.

{
	Method: Normal-DP
	Clarity:
		求n*n棋盘上放k个象的方案数

		把棋盘相间的染成黑白格(用+,-表示)，如：
		+-+-+
		-+-+-
		+-+-+
		-+-+-
		+,-之间的格子不互相影响。把+,-分离出来(分别称为case A,case B)，把棋盘45度旋转。
		case A  case B:
		  +       -- 
		 +++     ----
		+++++    ----
		 +++      -- 
		  +          
		这样可以把象看成是车(走直线)。这个问题和原问题是等价的。问题还可以等价转换为：
		  +       -- 
		  +       -- 
		 +++     ----
		 +++     ----
		+++++        
		
		令 n(i) 为 第i行的格子数
		F(i,j)=  //前i行要放j个象
				F(i-1,j)+ //本行不放
				F(i-1,j-1)*(n(i)-j+1) //本行放, 方法有 n(i)-(j-1) 种，因为j-1个象已经放好，占了恰好j-1列。
		按上述方法分别处理case A,case B.
	Complexity: O(n^2)
	Notice:
		1)
			When N=1, case A and case B are overlap.So do special processing.
		2)
			Assign i bishops to case A, and K-i bishops to case B.
			s.t. 0<=i<=NumA, 0<=K-i<=NumB 
			Let Left=Max(0,K-NumB) Right=Min(NumA,K)
			So Left<=i<=Right
}