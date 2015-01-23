program p2190;
const n=10;
var s:string;
    i,k,ans,total:longint;
begin
    readln(s);
    total:=0;
    ans:=-1;
    for i:=1 to n do
        if (s[i] in ['0'..'9']) then total:=total+(n-i+1)*(ord(s[i])-48)
        	   else if s[i]='X' then total:=total+(n-i+1)*10
            	else if s[i]='?' then k:=i;
    if k=n then begin
       for i:=0 to n do
       	  if (total+(n-k+1)*i) mod 11=0 then begin
               ans:=i;
               break;
           end;
    end else begin
        for i:=0 to n-1 do
        	  if (total+(n-k+1)*i) mod 11=0 then begin
               ans:=i;
               break;
           end; 
    end;
    if ans=10 then writeln('X') else writeln(ans);
end.