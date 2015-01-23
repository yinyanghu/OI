program p221;
const
	maxn = 50;
	maxl = 200;
type
	bignumber = record
		len:longint;
		num:array[1..maxl] of longint;
	end;
var
	f,g:array[0..maxn] of bignumber;
	n,bishop:longint;
procedure init;
 begin
 	readln(n,bishop);
 	if (n = 1) then begin
 		if (bishop <= 1) then writeln(1) else writeln(0);
 		halt;
 	end;
 end;
 
function plus(a,b:bignumber):bignumber;
 var
 	k,i:longint;
 	c:bignumber;
 begin
 	fillchar(c,sizeof(c),0);
 	if (a.len > b.len) then c.len:=a.len else c.len:=b.len;
 	k:=0;
 	for i:=1 to c.len do begin
 		c.num[i]:=a.num[i] + b.num[i] + k;
 		k:=c.num[i] div 10;
 		c.num[i]:=c.num[i] mod 10;
 	end;
 	if (k <> 0) then begin
 		inc(c.len);
 		c.num[c.len]:=k;
 	end;
 	plus:=c;
 end;
 
function multiply(a:bignumber; b:longint):bignumber;
 var
 	k,i:longint;
 	c:bignumber;
 begin
 	fillchar(c,sizeof(c),0);
 	c.len:=a.len;
 	k:=0;
 	for i:=1 to c.len do begin
 		c.num[i]:=a.num[i] * b + k;
 		k:=c.num[i] div 10;
 		c.num[i]:=c.num[i] mod 10;
 	end;
 	while (k <> 0) do begin
 		inc(c.len);
 		c.num[c.len]:=k mod 10;
 		k:=k div 10;
 	end;
 	multiply:=c;
 end;
 
function multiplybig(a,b:bignumber):bignumber;
 var
 	i,j:longint;
 	c:bignumber;
 begin
 	fillchar(c,sizeof(c),0);
 	c.len:=a.len + b.len + 1;
 	for i:=1 to a.len do
 		for j:=1 to b.len do begin
 			c.num[i + j - 1]:=c.num[i + j - 1] + a.num[i] * b.num[j];
 			c.num[i + j]:=c.num[i + j] + c.num[i + j - 1] div 10;
 			c.num[i + j - 1]:=c.num[i + j - 1] mod 10;
 		end;
 	while (c.len > 1) and (c.num[c.len] = 0) do dec(c.len);
 	multiplybig:=c;
 end;
 
procedure print(x:bignumber);
 var
 	i:longint;
 begin
 	if (x.len = 0) then begin
 		writeln(0);
 		exit;
 	end;
 	for i:=x.len downto 1 do write(x.num[i]);
 	writeln;
 end;
 
procedure main;
 var
 	i,j,a,b,left,right:longint;
	ans:bignumber;
 begin
	fillchar(f,sizeof(f),0);
	with f[0] do begin
		len:=1;
		num[len]:=1;
	end;
	with f[1] do begin
		len:=1;
		num[len]:=1;
	end;
	a:=1;
	for i:=2 to n do begin
		a:=a + ord(odd(i)) * 2;
		for j:=a downto 1 do f[j]:=plus(f[j],multiply(f[j - 1],a - j + 1));
	end;
	fillchar(g,sizeof(g),0);
	with g[0] do begin
		len:=1;
		num[len]:=1;
	end;
	with g[1] do begin
		len:=1;
		num[len]:=2;
	end;
 	b:=2;
 	for i:=2 to n - 1 do begin
 		b:=b + ord(odd(i)) * 2;
 		for j:=b downto 1 do g[j]:=plus(g[j],multiply(g[j - 1],b - j + 1));
 	end;
 	
 	if (bishop - b > 0) then left:=bishop - b else left:=0;
 	if (a < bishop) then right:=a else right:=bishop;
 	fillchar(ans,sizeof(ans),0);
 	for i:=left to right do ans:=plus(ans,multiplybig(f[i],g[bishop - i]));
 	print(ans);
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