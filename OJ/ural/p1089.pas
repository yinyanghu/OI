program p1089;
var dict:array[1..100] of string;
    words,total:longint;
    s,t:string;

procedure getword;
 begin
     t:='';
     while (length(s)>=1) and ((s[1]<'a') or (s[1]>'z')) do begin
         write(s[1]);
         delete(s,1,1);
     end;
     while (length(s)>=1) and (s[1]>='a') and (s[1]<='z') do begin
         t:=t+s[1];
         delete(s,1,1);
     end;
 end;

function check(p:longint):boolean;
 var i,sum:longint;
 begin
     sum:=0;
     for i:=1 to length(t) do
       if t[i]<>dict[p,i] then begin
           inc(sum);
           if sum>=2 then begin
               check:=false;
               exit;
           end;
       end;
     check:=true;
 end;

procedure checkword;
 var i:longint;
 begin
     if length(t)>8 then begin
         write(t);
         exit;
     end;
     for i:=1 to words do
       if t=dict[i] then begin
           write(t);
           exit;
       end;
     for i:=1 to words do
       if length(t)=length(dict[i]) then
         if check(i) then begin
             write(dict[i]);
             inc(total);
             exit;
         end;
     write(t);
 end;

procedure change(s:string);
 begin
     repeat
        getword;
        if t='' then break;
        checkword;
     until false;
     writeln;
 end;

begin
    words:=0;
    repeat
       readln(s);
       if s='#' then break;
       inc(words);
       dict[words]:=s;
    until false;
    repeat
       readln(s);
       if (s='') and eof then break;
       change(s+' ');
    until eof;
    writeln(total);
end.
