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
		��n*n�����Ϸ�k����ķ�����

		����������Ⱦ�ɺڰ׸�(��+,-��ʾ)���磺
		+-+-+
		-+-+-
		+-+-+
		-+-+-
		+,-֮��ĸ��Ӳ�����Ӱ�졣��+,-�������(�ֱ��Ϊcase A,case B)��������45����ת��
		case A  case B:
		  +       -- 
		 +++     ----
		+++++    ----
		 +++      -- 
		  +          
		�������԰��󿴳��ǳ�(��ֱ��)����������ԭ�����ǵȼ۵ġ����⻹���Եȼ�ת��Ϊ��
		  +       -- 
		  +       -- 
		 +++     ----
		 +++     ----
		+++++        
		
		�� n(i) Ϊ ��i�еĸ�����
		F(i,j)=  //ǰi��Ҫ��j����
				F(i-1,j)+ //���в���
				F(i-1,j-1)*(n(i)-j+1) //���з�, ������ n(i)-(j-1) �֣���Ϊj-1�����Ѿ��źã�ռ��ǡ��j-1�С�
		�����������ֱ���case A,case B.
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