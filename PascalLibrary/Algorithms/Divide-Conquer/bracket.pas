program bracket;
var ch:char;
    expr:string;

function rightbracket(s:string; i:byte):byte;
 var q:byte;
 begin
     q:=1;
     repeat
        inc(i);
        if s[i]='(' then inc(q) else if s[i]=')' then dec(q);
     until q=0;
     rightbracket:=i;
 end;

function find(s:string):byte;
 var i,k:byte;
 begin
     i:=1; k:=0;
     while i<=length(s) do begin
         if (s[i]='+') or (s[i]='-') then begin
             find:=i;
             exit;
         end;
         if (k=0) and ((s[i]='*') or (s[i]='/')) then k:=i;
         if s[i]='(' then i:=rightbracket(s,i);
         inc(i);
     end;
     find:=k;
 end;

function deletebracket(s:string; var p:char):string;
 var i:byte;
     ch1,ch2:char;
     left,right:string;
 begin
     if length(s)=1 then begin
         deletebracket:=s;
         p:=' ';
         exit;
     end;
     if (s[1]='(') and (rightbracket(s,1)=length(s)) then begin
         deletebracket:=deletebracket(copy(s,2,length(s)-2),p);
         exit;
     end;
     i:=find(s);
     p:=s[i];
     left:=deletebracket(copy(s,1,i-1),ch1);
     right:=deletebracket(copy(s,i+1,length(s)-i),ch2);
     if (p in ['*','/']) and (ch1 in ['+','-']) then left:='('+left+')';
     if (p in ['*','/']) and (ch2 in ['+','-']) or (p='/') and (ch2<>'') then
         right:='('+right+')';
     deletebracket:=left+p+right;
 end;

begin
    assign(input,'bracket.in'); reset(input);
    readln(expr);
    close(input);
    assign(output,'bracket.out'); rewrite(output);
    writeln(deletebracket(expr,ch));
    close(output);
end.