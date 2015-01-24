{
	DP by Queue and Hash
	State H(HP,MP,P)
	HP is hero's HP.
	MP is hero's MP.
	P is where the monsters stand.
	H is the minimum sum of all the monsters' HP.
}
program Ural_1240(Input,Output);
const
	MaxMP=50;
	MaxHP=100;
	MaxN=10;
	MaxQueueSize=MaxMP*MaxHP*MaxN;
type
	TIndex=Longint;
	TLighting=array[1..MaxN]of TIndex;
	THash=array[1..MaxHP,0..MaxMP,1..MaxN]of TIndex;
	TState=record
		HP,MP,P:ShortInt;
		H:TIndex;
		Prev:TIndex;
		Way:ShortInt;
	end;
	TQueue=array[1..MaxQueueSize]of TState;
var
	N,hHP,hMP,mHP,mN,V,dH:TIndex;
	L:TLighting;
	F:THash;
	Queue:TQueue;
function Min(A,B:TIndex):TIndex;
begin
	if A<B then Result:=A
	else Result:=B;
end;
procedure Print(Ptr:TIndex);
begin
	if Queue[Ptr].Prev=0 then Exit;
	Print(Queue[Ptr].Prev);
	case Queue[Ptr].Way of
		-1:Writeln('L');
		0:Writeln('H');
		else Writeln('T ',Queue[Ptr].Way);
	end;
end;
procedure Main;
var
	i:TIndex;
	U:TState;
	Pop,Push:TIndex;
begin
	Readln(N,hHP,hMP,mHP,mN,V,dH);
	for i:=1 to N do
		Read(L[i]);
	FillChar(F,SizeOf(F),0);
	F[hHP,hMP,N]:=1;
	Pop:=1;
	Push:=2;
	Queue[1].HP:=hHP;
	Queue[1].MP:=hMP;
	Queue[1].P:=N;
	Queue[1].H:=mHP*mN;
	Queue[1].Prev:=0;
	while Pop<Push do
	begin
		for i:=-1 to N do
		begin
			U:=Queue[Pop];
			with U do
			begin
				//Hero's Turn
				if MP=0 then Break;
				Dec(MP);
				case i of
					-1:Dec(H,L[P]);
					0:HP:=Min(hHP,HP+dH);
					else P:=i;
				end;
				//Monster's turn
				Dec(P,Min(P-1,V));
				if (P=1) and (H>0) then Dec(HP,(H-1) div mHP+1);
				if HP<=0 then Continue;

				if F[HP,MP,P]=0 then
				begin
					F[HP,MP,P]:=Push;
					Queue[Push].HP:=HP;
					Queue[Push].MP:=MP;
					Queue[Push].P:=P;
					Queue[Push].H:=H;
					Inc(Push);
				end;
				with Queue[F[HP,MP,P]] do
					if U.H<=H then
					begin
						H:=U.H;
						Prev:=Pop;
						Way:=i;
					end;
				if H<=0 then
				begin
					Writeln('VICTORIOUS');
					Print(F[HP,MP,P]);
					Exit;
				end;
			end;
		end;
		Inc(Pop);
	end;
	Writeln('DEFEATED');
end;
begin
	Main;
end.