program p1951;
const w:array[1..5] of char=('A','E','I','O','U');
var s:string;
function change(s:string):string;
 var l,i:longint;
     flag:array['A'..'Z'] of boolean;
     t:string;
 begin
     fillchar(flag,sizeof(flag),false);
     for i:=1 to 5 do
     	while pos(w[i],s)<>0 do delete(s,pos(w[i],s),1);
     t:='';
     for i:=1 to length(s) do
     	if (s[i] in ['A'..'Z']) then begin
            if (not flag[s[i]]) then begin
                flag[s[i]]:=true;
                t:=t+s[i];
            end;
         end else t:=t+s[i];
     while t[1]=' ' do delete(t,1,1);
     l:=length(t);
     while t[l]=' ' do begin
         delete(t,l,1);
         dec(l);
     end;
     while pos('  ',t)<>0 do delete(t,pos('  ',t),1);
     while pos(' ,',t)<>0 do delete(t,pos(' ,',t),1);
     while pos(' ?',t)<>0 do delete(t,pos(' ?',t),1);
     while pos(' .',t)<>0 do delete(t,pos(' .',t),1);
     change:=t;
 end;
 
begin
    readln(s);
    writeln(change(s));
end.