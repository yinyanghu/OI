{
	��������һ��ͼ��
	G1-G2-...-G(p-1)-Gp
	s.t.
	Sum(|Gi|)=N
	Sum(|Gp|*(N-|Gp|))/2=K
	GiΪ����Ϊ|Gi|����ȫͼ��
	����ȫͼ�ڣ���������critical ���ڲ�ͬ��G�ڵ����㶼��critical��
	ע��!!!!!!����|Gi|<>2����Ϊ��ʱG��������critical!!!!
}
program Ural_1169(Input,Output);
const
	MaxN=100;
	MaxK=MaxN*(MaxN-1) div 2;
type
	TIndex=Longint;
	TPath=array[1..MaxN]of ShortInt;
var
	Len:TIndex;
	Path:TPath;

function DFS(Depth,N,K:TIndex):Boolean;
var
	i:TIndex;
begin
	Result:=false;
	if K>N*(N-1) div 2 then Exit;
	Result:=true;
	if N=0 then Exit;
	if (N<>2) and (K=0) then 
	begin	
		Len:=Depth;
		Path[Depth]:=N;
		Exit;
	end;
	for i:=1 to N do
		if (i<>2) and (K>=(N-i)*i) then
			if DFS(Depth+1,N-i,K-(N-i)*i) then
			begin
				Path[Depth]:=i;
				Exit;
			end;
	Result:=false;
end;
procedure Main;
var
	N,K:TIndex;
	i,j:TIndex;
	Cur:TIndex;
begin
	Readln(N,K);
	Len:=0;
	if DFS(1,N,K) then
	begin
		while Len>0 do
		begin
			Cur:=Path[Len];
			Dec(Len);
			for i:=1 to Cur-1 do
				for j:=i+1 to Cur do
					Writeln(i+N-Cur,' ',j+N-Cur);
			N:=N-Cur;
			if N>0 then Writeln(N,' ',N+1);
		end;
	end
	else
		Writeln(-1);
end;
begin
	Main;
end.