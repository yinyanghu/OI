{
	Simulate and Expression
	It's a typical problem of expression process.
	Key is defining the priority of opearator.
}
program Ural_1101(Input,Output);
const
	MaxLen=1000;
	MaxN=100;
	M_TURN=#1;
	Direct:array[0..3]of record
		x,y:Integer
	end = ((x:1;y:0),(x:0;y:-1),(x:-1;y:0),(x:0;y:1));
type
	TIndex=Longint;
	TMap=array[-MaxN..MaxN,-MaxN..MaxN]of Char;
	TSwitch=array['A'..'Z']of Boolean;
	TNumberStack=array[1..MaxLen]of Boolean;
	TOperatorStack=array[1..MaxLen]of Char;
	TExpression=array[1..MaxLen]of Char;
var
	N,M,K:TIndex;
	Len:TIndex;
	Expr:TExpression;
	Switch:TSwitch;
	Map:TMap;

procedure Init_Boolean;
var
	Ch,R:Char;
	Word:String;
begin
	Len:=1;
	Expr[1]:='(';
	Word:='';
	while true do
	begin
		Read(Ch);
		if ('A'<=Ch) and (Ch<='Z') then
			Word:=Word+Ch
		else 
		begin
			if Word<>'' then
			begin
				Inc(Len);
				if Word='NOT' then Expr[Len]:='!'
				else if Word='AND' then Expr[Len]:='&'
				else if Word='OR' then Expr[Len]:='|'
				else if Word='TRUE' then Expr[Len]:='t'
				else if Word='FALSE' then Expr[Len]:='f'
				else
					for R:='A' to 'Z' do
						if Word = R then
						begin
							Expr[Len]:=Word[1];
							Break;
						end;
				Word:='';
			end;
			if (Ch='(') or (Ch=')') then 
			begin
				Inc(Len);
				Expr[Len]:=Ch;
			end;
		end;
		if Ch=#13 then Break;
	end;
	Inc(Len);
	Expr[Len]:=')';
	Readln;
end;
function OperCompare(OperA,OperB:Char):Boolean;
begin
	Result:=false;
	case OperB of
		'(':Result:=false;
		'!':Result:=false;
		'&':Result:=(OperA='!');
		'|':Result:=(OperA='!') or (OperA='&');
		')':Result:=true;
	end;
end;
function GetValue:Boolean;
var
	i:TIndex;
	OperTop,NumTop:TIndex;
	Oper:TOperatorStack;
	Num:TNumberStack;
	Ch:Char;
begin
	OperTop:=1;
	Oper[OperTop]:='(';
	NumTop:=0;
	for i:=2 to Len do
	begin
		case Expr[i] of
			'A'..'Z': 
			begin
				Inc(NumTop);
				Num[NumTop]:=Switch[Expr[i]];
			end;
			't','f': 
			begin
				Inc(NumTop);
				Num[NumTop]:=(Expr[i]='t');
			end;
			'(',')','!','|','&':
			begin
				while OperCompare(Oper[OperTop],Expr[i]) do
				begin
					Ch:=Oper[OperTop];
					Dec(OperTop);
					case Ch of 
						'!':
							Num[NumTop]:=not Num[NumTop];
						'|':
						begin
							Num[NumTop-1]:=Num[NumTop-1] or Num[NumTop];
							Dec(NumTop);
						end;
						'&':
						begin
							Num[NumTop-1]:=Num[NumTop-1] and Num[NumTop];
							Dec(NumTop);
						end;
						'(': 
							Break;
					end;
				end;
				if Expr[i]<>')' then
				begin
					Inc(OperTop);
					Oper[OperTop]:=Expr[i];
				end;
			end;
		end;
	end;
	Result:=Num[NumTop];
end;
procedure Main;
var
	i:TIndex;
	Ch:Char;
	x,y,d:TIndex;
begin
	Init_Boolean;
	FillChar(Switch,SizeOf(Switch),0);
	FillChar(Map,SizeOf(Map),0);
	Readln(N,M,K);
	for i:=1 to M do
	begin
		Readln(x,y);
		Map[x,y]:=M_TURN;
	end;
	for i:=1 to K do
	begin
		Read(x,y);
		repeat
			Read(Ch);
		until ('A'<=Ch) and (Ch<='Z');
		Readln;
		Map[x,y]:=Ch;
	end;
	x:=0;
	y:=0;
	d:=0;
	repeat
		Writeln(x,' ',y);
		if ('A'<=Map[x,y]) and ('Z'>=Map[x,y]) then
			Switch[Map[x,y]]:=not Switch[Map[x,y]]
		else if Map[x,y]=M_TURN then
			if GetValue then
				d:=(d+1+4) mod 4
			else 
				d:=(d-1+4) mod 4;
		Inc(x, Direct[d].x);
		Inc(y, Direct[d].y);
	until (Abs(x)>N) or (Abs(y)>N);
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