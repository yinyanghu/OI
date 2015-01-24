{
ID:lijianx1
PROG:namenum
LANG:PASCAL
}
program namenum;
const dial:array['A'..'Y']of integer=(2,2,2,3,3,3,4,4,4,5,5,5,6,6,6,7,0,7,7,8,8,8,9,9,9);
var name,num:string;
    i,len:longint;
    flag,exist:boolean;
begin
    assign(input,'namenum.in'); reset(input);
    readln(num);
    close(input);
    len:=length(num);
    assign(input,'dict.txt'); reset(input);
    assign(output,'namenum.out'); rewrite(output);
    repeat
       readln(name);
    until dial[name[1]]=ord(num[1])-48;
    exist:=false;
    repeat
	if length(name)=len then begin
            flag:=true;
            for i:=1 to len do
               if dial[name[i]]<>ord(num[i])-48 then begin
                   flag:=false;
                   break;
               end;
            if flag then begin
	        exist:=true;
        	writeln(name);
            end;
        end;
	readln(name);
    until dial[name[1]]>ord(num[1])-48;
    close(input);
    if not exist then writeln('NONE');
    close(output);
end.
