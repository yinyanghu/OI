program p0400;
var i,j,k,m,n,l,p:longint;
    ans:array[1..200,1..200] of char;
    s:string;
begin
    readln(n);
    while n<>0 do begin
        readln(s);
        fillchar(ans,sizeof(ans),' ');
        l:=length(s) div n;
        k:=0;
        for i:=1 to l do
          for j:=1 to n do begin
              inc(k);
              if i mod 2<>0 then ans[i,j]:=s[k]
                 else ans[i,n-j+1]:=s[k];
          end;
        for j:=1 to n do
          for i:=1 to l do write(ans[i,j]);
        writeln;
        readln(n);
    end;
end.
