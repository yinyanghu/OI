program kmp;
const maxn=10000;
var s,t:ansistring;
    w:array[1..maxn] of longint;
    lens,lent:longint;
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
             writeln('PLACE=',i-lent+1);
             inc(ans);
             k:=w[k];
         end;
     end;
     kmp:=ans;
 end;
 
begin
    assign(input,'kmp.in'); reset(input);
    readln(s); lens:=length(s);
    readln(t); lent:=length(t);
    close(input);
    assign(output,'kmp.out'); rewrite(output);
    writeln(kmp);
    close(output);
end.
