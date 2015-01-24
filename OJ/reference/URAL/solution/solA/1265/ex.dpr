program Ural_1265(Input,Output);
const
	MaxLen=20;
	Bit=1000000000;
type
	TIndex=Longint;
	TReal=Extended;
	TData=Int64;
	THP=record
		Len:TIndex;
		Sign:Boolean;
		D:array[0..MaxLen]of TData;
	end;
	TPoint=record
		x,y:THP;
	end;
var
	A,B,C,D,O:TPoint;

function AddAbs(A,B:THP):THP;
var
	i:TIndex;
	R:TData;
begin
	FillChar(Result,SizeOf(Result),0);
	with Result do
	begin
		i:=0;
		R:=0;
		while (i<=A.Len) or (i<=B.Len) or (R>0) do
		begin
			D[i]:=R;
			if i<=A.Len then Inc(D[i],A.D[i]);
			if i<=B.Len then Inc(D[i],B.D[i]);
			R:=0;
			if D[i]>=Bit then
			begin
				R:=1;
				Dec(D[i],Bit);
			end;
			Inc(i);
		end;
		Len:=i-1;
		while (D[Len]=0) and (Len>0) do Dec(Len);
		if (Len=0) and (D[0]=0) then Sign:=false;
	end;
end;
function MinusAbs(A,B:THP):THP;//A>=B
var
	i:TIndex;
	R:TData;
begin
	FillChar(Result,SizeOf(Result),0);
	with Result do
	begin
		i:=0;
		R:=0;
		while (i<=A.Len) or (R<0) do
		begin
			D[i]:=R;
			if i<=A.Len then Inc(D[i],A.D[i]);
			if i<=B.Len then Dec(D[i],B.D[i]);
			R:=0;
			if D[i]<0 then
			begin
				R:=-1;
				Inc(D[i],Bit);
			end;
			Inc(i);
		end;
		Len:=i-1;
		while (D[Len]=0) and (Len>0) do Dec(Len);
		if (Len=0) and (D[0]=0) then Sign:=false;
	end;
end;
function Compare(A,B:THP):TData;
var
	i:TIndex;
begin
	Result:=A.Len-B.Len;
	if Result<>0 then Exit;
	i:=A.Len;
	while (A.D[i]=B.D[i]) and (i>0) do Dec(i);
	Result:=A.D[i]-B.D[i];
end;
function Add(A,B:THP):THP;
begin
	if A.Sign xor B.Sign then
	begin
		if Compare(A,B)>=0 then
			Result:=MinusAbs(A,B)
		else 
		begin
			Result:=MinusAbs(B,A);
			Result.Sign:=not Result.Sign;
		end;
		if A.Sign then Result.Sign:=not Result.Sign;
	end
	else
	begin
		Result:=AddAbs(A,B);
		if A.Sign then Result.Sign:=not Result.Sign;
	end;
	with Result do
		if (Len=0) and (D[0]=0) then Sign:=false;
end;
function Minus(A,B:THP):THP;
begin
	B.Sign:=not B.Sign;
	Result:=Add(A,B);
end;
function Multiply(A,B:THP):THP;
var
	i,j:TIndex;
begin
	FillChar(Result,SizeOf(Result),0);
	with Result do
	begin
		Sign:=A.Sign xor B.Sign;
		for i:=0 to A.Len do
			for j:=0 to B.Len do
			begin
				Inc(D[i+j],A.D[i]*B.D[j]);
				Inc(D[i+j+1],D[i+j] div Bit);
				D[i+j]:=D[i+j] mod Bit;
			end;
		Len:=A.Len+B.Len;
		while D[Len+1]>0 do
		begin
			Inc(Len);
			Inc(D[Len+1],D[Len] div Bit);
			D[Len]:=D[Len] mod Bit;
		end;
		while (D[Len]=0) and (Len>0) do Dec(Len);
		if (Len=0) and (D[0]=0) then Sign:=false;
	end;
end;
function Sqr(A:THP):THP;
begin
	Result:=Multiply(A,A);
end;
function IsNonpositive(A:THP):Boolean;
begin
	Result:=(not A.Sign and (A.Len=0) and (A.D[0]=0)) or A.Sign;
end;
function Det(const A,B,C:TPoint):THP;
begin
	Result:=Minus(Multiply(Minus(B.x,A.x),Minus(C.y,A.y))
				,Multiply(Minus(B.y,A.y),Minus(C.x,A.x)));
end;
function Mirror(A,P:TPoint):TPoint;
var
	Tmp:THP;
begin
	Tmp:=Multiply(Multiply(P.x,P.y),A.y);
	Result.x:=Add(Tmp,Add(Tmp,Multiply(A.x,Minus(Sqr(P.x),Sqr(P.y)))));
	Tmp:=Multiply(Multiply(P.x,P.y),A.x);
	Result.y:=Add(Tmp,Add(Tmp,Multiply(A.y,Minus(Sqr(P.y),Sqr(P.x)))));
end;
procedure ReadPoint(var P:TPoint);
var
	x,y:TReal;
begin
	Read(x,y);
	FillChar(P,SizeOf(P),0);
	P.x.D[0]:=Round(x*1000000);
	if P.x.D[0]<0 then 
	begin
		P.x.D[0]:=-P.x.D[0];
		P.x.Sign:=not P.x.Sign;
	end;
	P.y.D[0]:=Round(y*1000000);
	if P.y.D[0]<0 then 
	begin
		P.y.D[0]:=-P.y.D[0];
		P.y.Sign:=not P.y.Sign;
	end;
end;
function MinusVector(A,B:TPoint):TPoint;
begin
	Result.x:=Minus(A.x,B.x);
	Result.y:=Minus(A.y,B.y);
end;
procedure Coefficient(var A:TPoint;B:THP);
begin
	A.x:=Multiply(A.x,B);
	A.y:=Multiply(A.y,B);
end;
procedure Main;
begin
	FillChar(O,SizeOf(O),0);
	ReadPoint(A);
	ReadPoint(B);
	ReadPoint(C);
	ReadPoint(D);
	A:=MinusVector(A,C);
	B:=MinusVector(B,C);
	C:=MinusVector(D,C);
	A:=Mirror(A,C);//Without denominator
	Coefficient(B,Add(Sqr(C.x),Sqr(C.y)));
	Coefficient(C,Add(Sqr(C.x),Sqr(C.y)));
	if IsNonpositive(Multiply(Det(O,C,A),Det(O,C,B)))
		and IsNonpositive(Multiply(Det(B,A,O),Det(B,A,C))) then
		Writeln('VISIBLE')
	else
		Writeln('INVISIBLE');
end;
begin
	Main;
end.
