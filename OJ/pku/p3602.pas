program p3602;
const n=15;
      w:array[1..n] of string=('ffi','ffl','ff','fi','fl','``',chr(39)+chr(39),',','.',';',':',chr(39),'`','?','!');
var s:string;
    flag:array[1..n] of boolean;
    down:array['a'..'z'] of boolean;
    up:array['A'..'Z'] of boolean;
    i,j,total:longint;
    ch:char;
    ok:boolean;
begin
    fillchar(flag,sizeof(flag),false);
    fillchar(down,sizeof(down),false);
    fillchar(up,sizeof(up),false);
    while not eof do begin
        readln(s);
        i:=1;
        while i<=length(s) do begin
            ok:=false;
        	   for j:=1 to n do
            	if copy(s,i,length(w[j]))=w[j] then begin
                     flag[j]:=true;
                     inc(i,length(w[j]));
                     ok:=true;
                     break;
                 end;
            if not ok then begin
                if s[i] in ['a'..'z'] then down[s[i]]:=true
                	    else if s[i] in ['A'..'Z'] then up[s[i]]:=true;
                inc(i);
            end;
        end;
    end;
    total:=0;  
    for i:=1 to n do
    	if flag[i] then inc(total);
    for ch:='a' to 'z' do
 	if down[ch] then inc(total);
    for ch:='A' to 'Z' do
   	if up[ch] then inc(total);
    writeln(total);
end.