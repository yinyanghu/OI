{
	Author: Amber
	Method: Construct
	Clariry:
		Ѱ�����ұߵĿ��Ա�Ϊ")"��"("(��Ϊx)��Ҳ����x��֮ǰ��"("������ı���xƥ�䣩�������ĳ�")"��
		���ٽ�������������ų�"((((...))))"+"))..))"����ʽ��
		"+"ǰ��"((((...))))"��֤���ֵ�����С
		"+"���"))..))"��Ϊ����xǰ��"((..(("ƥ��ġ�
}
program SGU_179(Input,Output);
type
	TIndex=Longint;
procedure Main;
var
	i:TIndex;
	Stack,Rec_Stack:TIndex;
	Ch:Char;
	St:AnsiString;
begin
	Stack:=0;
	Rec_Stack:=0;
	St:='';
	while not Eoln do
	begin
		Read(Ch);
		if Ch='(' then
		begin
			if Stack>0 then 
			begin
				Rec_Stack:=Stack; //Rightest '(' before which the stack value>0.
				Write(St);
				St:='';
			end;
			Inc(Stack);
		end
		else 
			Dec(Stack);
		St:=St+Ch;
	end;
	Readln;
	Write(')');
	for i:=1 to (Length(St)-Rec_Stack) div 2 do
		Write('(');
	for i:=1 to (Length(St)-Rec_Stack) div 2 do
		Write(')');
	for i:=1 to Rec_Stack-1 do
		Write(')');
	Writeln;
end;
begin
	Main;
end.