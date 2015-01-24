{
	Method: Construct
	Clarity:
	Step operation (Step) 
	Step changes odd number of plus.
	Rectangle operation (Rect) (x1,y1,x2,y2) consists of double Step which changes (x1,y2) and (x2,y1) and (x1,y1) and (x2,y2).
	+...+
	.   .
	+...+
	Rect changes even number of plus.

	if m>2n+1 then
		if it exists
		+...+
		.
		+...x
		then Rect ->
		-...-
		.
		-...!x
		else it must exists
		  +  
		+   +
		  +  
		then Rect and Rect ->
		+    
		     
		    +
	else if m=2n+1 then
		Only by a Step, m will change to a even number.
}
program Ural_1092(Input,Output);
const
	MaxN=20;
type
	TIndex=Longint;
	TMatrix=array[1..MaxN*2+1,1..MaxN*2+1]of Boolean;
	TLine=array[1..MaxN*2+1]of TIndex;
var
	N:TIndex;
	Matrix:TMatrix;
	Count:TIndex;
	Row,Col:TLine;
procedure Inverse(x,y:TIndex);
begin
	Matrix[x,y]:=not Matrix[x,y];
	if Matrix[x,y] then
	begin
		Inc(Count);
		Inc(Row[x]);
		Inc(Col[y]);
	end
	else
	begin
		Dec(Count);
		Dec(Row[x]);
		Dec(Col[y]);
	end;
end;
procedure Step(x1,y1,x2,y2:TIndex);
var
	i,j:TIndex;
begin
	j:=0;
	for i:=1 to 2*N+1 do
		if i=x1 then
			Write(y1,' ')
		else if i=x2 then
			Write(y2,' ')
		else
		begin
			repeat Inc(j); until (j<>y1) and (j<>y2);
			Write(j,' ');
		end;
	Writeln;
	j:=0;
	for i:=1 to 2*N+1 do
		if i=x1 then
			Write(y2,' ')
		else if i=x2 then
			Write(y1,' ')
		else
		begin
			repeat Inc(j); until (j<>y1) and (j<>y2);
			Write(j,' ');
		end;
	Writeln;
	Inverse(x1,y1);
	Inverse(x1,y2);
	Inverse(x2,y1);
	Inverse(x2,y2);
end;
procedure Main;
var
	i,j,x,y:TIndex;
	x1,x2,y1,y2:TIndex;
	Ch:Char;
begin
	FillChar(Row,SizeOf(Row),0);
	FillChar(Col,SizeOf(Col),0);
	Count:=0;
	Readln(N);
	for i:=1 to 2*N+1 do
	begin
		for j:=1 to 2*N+1 do
		begin
			Read(Ch);
			Matrix[i,j]:=(Ch='+');
			if Ch='+' then
			begin
				Inc(Count);
				Inc(Row[i]);
				Inc(Col[j]);
			end;
		end;
		Readln;
	end;
	Writeln('There is solution:');
	if Odd(Count) then
	begin
		for i:=1 to 2*N+1 do
		begin
			Write(i,' ');
			Inverse(i,i);
		end;
		Writeln;
	end;
	while Count>=2*N+1 do
	begin
		i:=0;
		repeat Inc(i); until Row[i]>=2;
		j:=0;
		repeat Inc(j); until Col[j]>=2;
		y1:=0;
		repeat Inc(y1); until Matrix[i,y1];
		y2:=y1;
		repeat Inc(y2); until Matrix[i,y2];
		x1:=0;
		repeat Inc(x1); until Matrix[x1,j];
		x2:=x1;
		repeat Inc(x2); until Matrix[x2,j];
		if (i<>x1) and (i<>x2) and (j<>y1) and (j<>y2) then
		begin
			Step(i,y1,x1,j);
			Step(i,y2,x2,j);
		end
		else
		begin
			if i<>x1 then x:=x1 else x:=x2;
			if j<>y1 then y:=y1 else y:=y2;
			Step(x,y,i,j);
		end;
	end;
end;
begin
	Main;
end.