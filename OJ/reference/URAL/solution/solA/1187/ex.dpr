program Ural_1187(Input,Output);
const
	MaxQueryNum=100;
	MaxAnswerNum=10;
	MaxPersonNum=10000;
type
	TIndex=Longint;
	TSurvey=record
		Title:String[100];
		QueryNum:TIndex;
		Query:array[1..MaxQueryNum]of record
			Code:string[3];
			Title:string[80];
			AnswerNum:TIndex;
			Answer:array[1..MaxAnswerNum]of record
				Code:Char;
				Title:string[40];
			end;
		end;
		PersonNum:TIndex;
		Person:array[1..MaxPersonNum]of array[1..MaxQueryNum]of Byte;
	end;
	TTable=array[1..MaxAnswerNum+1,1..MaxAnswerNum+1]of record
		Count:TIndex;
		Row,Column:TIndex;
	end;
var
	Survey:TSurvey;
	Table:TTable;
procedure Main;
var
	i,j,k:TIndex;
	St:String;
	RowNum,ColumnNum:TIndex;
	First:Boolean;
	QueryInd:array[1..2]of TIndex;
begin
	with Survey do
	begin
		//Read Survey
		Readln(Title);
		repeat
			Readln(St);
			if St='#' then Break;
			if St[1]<>' ' then
			begin
				Inc(QueryNum);
				with Query[QueryNum] do
				begin
					Code:=Copy(St,1,3);
					Delete(St,1,4);
					Title:=St;
					AnswerNum:=0;
				end
			end
			else
				with Query[QueryNum] do
				begin
					Inc(AnswerNum);
					with Answer[AnswerNum] do
					begin
						Code:=St[2];
						Delete(St,1,3);
						Title:=St;
					end;
				end;
		until false;

		//Read Person's Answer
		PersonNum:=0;
		repeat
			Readln(St);
			if St='#' then Break;
			Inc(PersonNum);
			for i:=1 to QueryNum do
				for j:=1 to Query[i].AnswerNum do
					if St[i]=Query[i].Answer[j].Code then
					begin
						Person[PersonNum][i]:=j;
						Break;
					end;
		until false;
		
		First:=true;
		repeat
			Readln(St);
			if St='#' then Break;
			if First then
				First:=false
			else
				Writeln;
			//Find query
			for k:=1 to 2 do
				for i:=1 to QueryNum do
					if Query[i].Code=Copy(St,1+(k-1)*4,3) then
					begin
						QueryInd[k]:=i;
						Break;
					end;
			//Print Head
			Delete(St,1,8);
			Writeln(Title,' - ',St);
			for k:=1 to 2 do
				with Query[QueryInd[k]] do
				begin
					Writeln(Code,' ',Title);
					for i:=1 to AnswerNum do
						Writeln(' ',Answer[i].Code,' ',Answer[i].Title);
				end;
			Writeln;

			//Get Person's Info
			FillChar(Table,SizeOf(Table),0);
			for i:=1 to PersonNum do
				Inc(Table[Person[i][QueryInd[1]],Person[i][QueryInd[2]]].Count);
			
			//Count
			RowNum:=Query[QueryInd[1]].AnswerNum;
			ColumnNum:=Query[QueryInd[2]].AnswerNum;
			for i:=1 to RowNum do
				for j:=1 to ColumnNum do
				begin
					Inc(Table[RowNum+1,j].Count,Table[i,j].Count);
					Inc(Table[i,ColumnNum+1].Count,Table[i,j].Count);
					Inc(Table[RowNum+1,ColumnNum+1].Count,Table[i,j].Count);
				end;

			//Calc Percent
			for i:=1 to RowNum+1 do
				for j:=1 to ColumnNum+1 do
				begin
					if (i<RowNum+1) and (Table[RowNum+1,j].Count>0) then
					begin
						Table[i,j].Column:=(Table[i,j].Count*100) div Table[RowNum+1,j].Count;
						Inc(Table[RowNum+1,j].Column,Table[i,j].Column);
					end;
					if (j<ColumnNum+1) and (Table[i,ColumnNum+1].Count>0) then
					begin
						Table[i,j].Row:=(Table[i,j].Count*100) div Table[i,ColumnNum+1].Count;
						Inc(Table[i,ColumnNum+1].Row,Table[i,j].Row);
					end;
				end;

			//Round
			for i:=1 to RowNum+1 do
				for j:=1 to ColumnNum+1 do
				begin
					if (i<RowNum+1) and (Table[RowNum+1,j].Count>0) and (Table[RowNum+1,j].Column<100) then 
						if (Table[i,j].Count*100) mod Table[RowNum+1,j].Count>0 then
						begin
							Inc(Table[i,j].Column);
							Inc(Table[RowNum+1,j].Column);
						end;
					if (j<ColumnNum+1) and (Table[i,ColumnNum+1].Count>0) and (Table[i,ColumnNum+1].Row<100) then 
						if (Table[i,j].Count*100) mod Table[i,ColumnNum+1].Count>0 then
						begin
							Inc(Table[i,j].Row);
							Inc(Table[i,ColumnNum+1].Row);
						end;
				end;

			//Print 
			Write(' ':6);
			for j:=1 to ColumnNum do
				Write(' ',Query[QueryInd[2]].Code,':',Query[QueryInd[2]].Answer[j].Code);
			Writeln(' TOTAL');
			
			for i:=1 to RowNum+1 do
			begin
				if i<=RowNum then 
					Write(' ',Query[QueryInd[1]].Code,':',Query[QueryInd[1]].Answer[i].Code)
				else
					Write(' TOTAL');
				for j:=1 to ColumnNum+1 do
					Write(Table[i,j].Count:6);
				Writeln;
				Write(' ':6);
				for j:=1 to ColumnNum+1 do
					if Table[i,ColumnNum+1].Count=0 then 
						Write('-':6)
					else
						Write(Table[i,j].Row:5,'%');
				Writeln;
				Write(' ':6);
				for j:=1 to ColumnNum+1 do
					if Table[RowNum+1,j].Count=0 then 
						Write('-':6)
					else
						Write(Table[i,j].Column:5,'%');
				Writeln;
			end;
		until false;
	end;
end;
begin
{$IFNDEF ONLINE_JUDGE}
	Assign(Input,'stat.09');
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