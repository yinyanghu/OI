program p1011;
var s:string;
    ans:longint;
function calc(s:string):longint;
 var r,i,j,k,l:longint;
     c:char;
     s1,s2:string;
 begin
     l:=0;
     while (l=0) and (length(s)>2) do begin
         k:=0;
         for i:=1 to length(s)-1 do begin
             if s[i]='(' then inc(k) else if s[i]=')' then dec(k);
             if k=0 then begin
                 l:=1;
                 break;
             end;
         end;
         if l=0 then begin
             delete(s,1,1);
             delete(s,length(s),1)
         end;
     end;
    val(s,r,i);
    if i=0 then calc:=r else begin
         if s[1] in ['+','-'] then begin
             k:=0;
             for i:=2 to length(s) do begin
                 if s[i]='(' then inc(k)
                    else if s[i]=')' then dec(k);
                 if k=0 then break;
             end;
             if i=length(s) then s:='0'+s
                else begin
                     val(copy(s,i,length(s)-i+1),j,k);
                     insert(')',s,i+k-1);
                     insert('(0',s,1)
                 end;
         end;
         j:=0; k:=100; c:='*';
         for i:=1 to length(s) do
           if (s[i] in ['+','-','*','/']) and (i>1) and (s[i-1] in ['0'..'9',')']) then
             if (j<k) or (j=k) and ((c in ['*']) or (s[i] in ['+','-'])) then begin
                l:=i; k:=j; c:=s[i]
             end else
               else if s[i]='(' then inc(j)
                 else if s[i]=')' then dec(j);
         s1:=copy(s,1,l-1); s2:=copy(s,l+1,length(s)-l);
         case s[l]of
             '+':calc:=calc(s1)+calc(s2);
             '-':calc:=calc(s1)-calc(s2);
             '*':calc:=calc(s1)*calc(s2);
         end;
     end;
 end;

begin
    readln(s);
    ans:=calc(s);
    writeln(ans);
end.

{
var s:string;
    ans:double;
function calc(s:string):double;
 var r:double;
     i,j,k,l:longint;
     c:char;
     s1,s2:string;
 begin
     l:=0;
     while (l=0) and (length(s)>2) do begin
         k:=0;
         for i:=1 to length(s)-1 do begin
             if s[i]='(' then inc(k) else if s[i]=')' then dec(k);
             if k=0 then begin
                 l:=1;
                 break;
             end;
         end;
         if l=0 then begin
             delete(s,1,1);
             delete(s,length(s),1)
         end;
     end;
    val(s,r,i);
    if i=0 then calc:=r else begin
         if s[1] in ['+','-'] then begin
             k:=0;
             for i:=2 to length(s) do begin
                 if s[i]='(' then inc(k)
                    else if s[i]=')' then dec(k);
                 if k=0 then break;
             end;
             if i=length(s) then s:='0'+s
                else begin
                     val(copy(s,i,length(s)-i+1),j,k);
                     insert(')',s,i+k-1);
                     insert('(0',s,1)
                 end;
         end;
         j:=0; k:=100; c:='*';
         for i:=1 to length(s) do
           if (s[i] in ['+','-','*','/']) and (i>1) and (s[i-1] in ['0'..'9',')']) then
             if (j<k) or (j=k) and ((c in ['*','/']) or (s[i] in ['+','-'])) then begin
                l:=i; k:=j; c:=s[i]
             end else
               else if s[i]='(' then inc(j)
                 else if s[i]=')' then dec(j);
         s1:=copy(s,1,l-1); s2:=copy(s,l+1,length(s)-l);
         case s[l]of
             '+':calc:=calc(s1)+calc(s2);
             '-':calc:=calc(s1)-calc(s2);
             '*':calc:=calc(s1)*calc(s2);
             '/':calc:=calc(s1)/calc(s2);
         end;
     end;
 end;

begin
    readln(s);
    ans:=calc(s);
    if ans=trunc(ans) then writeln(trunc(ans))
      else writeln(ans:0:2);
end.}