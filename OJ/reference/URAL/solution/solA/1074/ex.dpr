program Ural_1074(Input,Output);
type
	TIndex=Longint;
var
	Len:TIndex;
function IsUnsignedInteger(St:AnsiString):Boolean;
begin
	Result:=false;
	if St='' then Exit;
	while St<>'' do
	begin
		if not (('0'<=St[1]) and (St[1]<='9')) then Exit;
		Delete(St,1,1);
	end;
	Result:=true;
end;
function IsReal(St:AnsiString):Boolean;
begin
	Result:=false;
	if St='' then Exit;
	if (St[1]='+') or (St[1]='-') then Delete(St,1,1);
	if Pos('.',St)=0 then
		Result:=IsUnsignedInteger(St)
	else if Pos('.',St)=1 then
		Result:=IsUnsignedInteger(Copy(St,2,Length(St)-1))
	else
		Result:=IsUnsignedInteger(Copy(St,1,Pos('.',St)-1))
			and IsUnsignedInteger(Copy(St,Pos('.',St)+1,Length(St)-Pos('.',St)));
end;
function MultiChar(Ch:Char;Times:TIndex):AnsiString;
begin
	Result:='';
	while Times>0 do
	begin
		Result:=Result+Ch;
		Dec(Times);
	end;
end;
function IsValid(St:AnsiString):Boolean;
var
	i,p:TIndex;
	Offset:TIndex;
	Minus,AllZero:Boolean;
	Code:Integer;
	Tmp:AnsiString;
begin
	Result:=false;
	if Pos('E',St)>0 then St[Pos('E',St)]:='e';
	if Pos('e',St)>0 then 
	begin
		//is it a integer?
		Tmp:=Copy(St,Pos('e',St)+1,Length(St)-Pos('e',St));
		if Tmp='' then Exit;
		if (Tmp[1]='+') or (Tmp[1]='-') then Delete(Tmp,1,1);
		if not IsUnsignedInteger(Tmp) then Exit;

		Val(Copy(St,Pos('e',St)+1,Length(St)-Pos('e',St)),Offset,Code);
		if Code<>0 then Exit;
		Delete(St,Pos('e',St),Length(St)-Pos('e',St)+1);
	end
	else
		Offset:=0;

	if not IsReal(St) then Exit;

	Minus:=false;
	if (St[1]='+') or (St[1]='-') then
	begin
		Minus:=(St[1]='-');
		Delete(St,1,1);
	end;
	
	//format to scientific count
	if Pos('.',St)=0 then St:=St+'.';
	Inc(Offset,Pos('.',St)-1);
	Delete(St,Pos('.',St),1);
	
	//multiply 10^e
	if Offset<=0 then
		St:='0.'+MultiChar('0',-Offset)+St
	else if Offset>Length(St) then
		St:=St+MultiChar('0',Offset-Length(St))+'.'
	else
		Insert('.',St,Offset+1);

	//format output
	p:=Pos('.',St);
	if Len=0 then 
		Delete(St,p,Length(St)-p+1)
	else if Len>Length(St)-p then
		St:=St+MultiChar('0',Len-Length(St)+p)
	else if Len<=Length(St)-p then
		Delete(St,p+Len+1,Length(St)-p-Len);
	
	//check if all are zero
	AllZero:=true;
	for i:=1 to Length(St) do
		if (St[i]<>'0') and (St[i]<>'.') then
			begin
				AllZero:=false;
				Break;
			end;
	//delete lead zero
	while (St[1]='0') and (Length(St)>1) do Delete(St,1,1); 
	if St[1]='.' then St:='0'+St;

	if not AllZero and Minus then St:='-'+St;
	Writeln(St);
	Result:=true;
end;
procedure Main;
var
	St:AnsiString;
begin
	while true do
	begin
		Readln(St);
		if St='#' then Break;
		Readln(Len);
		if not IsValid(St) then Writeln('Not a floating point number');
	end;
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