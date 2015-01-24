{
	Enumerate
}
program Ural_1165(Input,Output);
const
	MaxLen=250;
type
	TIndex=Longint;
	THP=record
		Len:TIndex;
		D:array[1..MaxLen]of TIndex;
	end;
var
	Num:String;
	N:TIndex;
	Min:String; //First Number appears in String
	MinD:TIndex; //Which is String[1]
	Ans:THP;

function GetStr(i,j:TIndex):String;
begin
	Result:=Copy(Num,i,j-i+1);
end;
function Compare(const A:String;B:TIndex):TIndex;
begin
	Result:=Length(A)-Length(Min);
	if Result<>0 then Exit;
	if A>Min then Result:=1
	else if A<Min then Result:=-1
	else Result:=0;
	if Result=0 then Result:=B-MinD;
end;
procedure IncHP(var A:String);
var
	i:TIndex;
begin
	i:=Length(A);
	Inc(A[i]);
	while (A[i]>'9') and (i>1) do
	begin
		Inc(A[i-1]);
		Dec(A[i],10);
		Dec(i);
	end;
	if (A[i]>'9') and (i=1) then
	begin
		Dec(A[i],10);
		Insert('1',A,1);
	end;
end;
procedure DecHP(var A:String);
var
	i:TIndex;
begin
	i:=Length(A);
	Dec(A[i]);
	while (A[i]<'0') and (i>1) do
	begin
		Dec(A[i-1]);
		Inc(A[i],10);
		Dec(i);
	end;
	if A[1]='0' then Delete(A,1,1);
end;
procedure AddMul(A:String;B:TIndex);
var
	i:TIndex;
	R:TIndex;
	Len:TIndex;
begin
	if A[1]='0' then Delete(A,1,1);
	Len:=Length(A);
	i:=1;
	R:=0;
	while (i<=Len) or (R>0) do
	begin
		if i<=Len then Inc(Ans.D[i],(Ord(A[Len-i+1])-Ord('0'))*B);
		Inc(Ans.D[i],R);
		R:=Ans.D[i] div 10;
		Ans.D[i]:=Ans.D[i] mod 10;
		Inc(i);
	end;
	if i-1>Ans.Len then Ans.Len:=i-1;
end;
procedure Main;
label
	Error,Error2;
var
	i,j,k,p:TIndex;
	Len:TIndex;
	Cur:String;
	First:String;
	FirstD:TIndex;
begin
	Readln(Num);

	if Num[1]='0' then //Lead Zero
	begin
		Min:='1'+Num;
		MinD:=2;
	end
	else
	begin
		Min:=Num;
		MinD:=1;
	end;
	N:=Length(Num);

	for i:=1 to N div 2+1 do //Enumerate a full number in string
		if Num[i]<>'0' then 
			for j:=i*2-1 to N do
			begin
				Cur:=GetStr(i,j);
				if i>1 then
				begin
					DecHP(Cur);
					if Cur='0' then goto Error;
					Len:=Length(Cur);
					for p:=1 to Len do
					begin
						if i-p<=0 then Break;
						if Num[i-p]<>Cur[Len-p+1] then goto Error;
					end;
					if Compare(Cur,Len-i+2)>=0 then goto Error;
					First:=Cur;
					FirstD:=Len-i+2;
					IncHP(Cur);
				end
				else
				begin
					if Compare(Cur,1)>=0 then goto Error;
					First:=Cur;
					FirstD:=1;
				end;

				k:=j;
				repeat
					IncHP(Cur);
					for p:=1 to Length(Cur) do
					begin
						if k+p>N then Break;
						if Num[k+p]<>Cur[p] then goto Error;
					end;
					Inc(k,Length(Cur));
				until k>=N;
				Min:=First;
				MinD:=FirstD;
				Error: Continue;
			end;

	for i:=1 to N-1 do //Split String into two part.Part 1 is exactly not full. Part 2 may be full.
		if Num[i+1]<>'0' then
		begin
			Cur:=GetStr(1,i);
			IncHP(Cur);
			j:=i+1;
			if Length(Cur)>i then Delete(Cur,1,1);
			if N-Length(Cur)>j then j:=N-Length(Cur);
			repeat
				First:=GetStr(i+1,j)+Cur;
				DecHP(First);
				FirstD:=Length(First)-i+1;
				if Compare(First,FirstD)>=0 then Break;
				for p:=1 to Length(Cur) do
				begin
					if j+p>N then Break;
					if Num[j+p]<>Cur[p] then goto Error2;
				end;
				Min:=First;
				MinD:=FirstD;
				Error2:Inc(j);
			until j=N+1;
		end;
	Writeln(Min);
	Writeln(MinD);
	
	FillChar(Ans,SizeOf(Ans),0);
	Ans.Len:=1;
	Cur:='9';
	for i:=1 to Length(Min)-1 do
	begin
		AddMul(Cur,i);
		Cur:=Cur+'0';
	end;
	Dec(Min[1]);
	AddMul(Min,Length(Min));
	AddMul('1',MinD);
	for i:=Ans.Len downto 1 do
		Write(Ans.D[i]);
	Writeln;
end;
begin
	Main;
end.