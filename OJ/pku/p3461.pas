program p3461;
const maxt=10000;
var s,t:ansistring;
    w:array[1..maxt] of longint;
    lens,lent,i,p:longint;
function kmp:longint;
 var i,k,ans:longint;
 begin
     k:=0; w[1]:=0;
     for i:=2 to lent do begin
         while (k>0) and (t[k+1]<>t[i]) do k:=w[k];
         if t[k+1]=t[i] then inc(k);
         w[i]:=k;
     end;
     k:=0; ans:=0;
     for i:=1 to lens do begin
         while (k>0) and (t[k+1]<>s[i]) do k:=w[k];
         if t[k+1]=s[i] then inc(k);
         if k=lent then begin
             inc(ans); k:=w[k];
         end;
     end;
     kmp:=ans;
 end;
 
begin
    readln(p);
    for i:=1 to p do begin
        readln(t);
        lent:=length(t);
        readln(s);
        lens:=length(s);
        writeln(kmp);
    end;
end.
