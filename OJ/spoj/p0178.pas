program p0178;
var g:array[1..200,1..200] of longint;
    v:array[1..200,1..200] of boolean;
    i,j,k,n,s,t,u:longint;
    ok:boolean;
begin
    readln(t);
    for u:=1 to t do begin
        readln(n);
        fillchar(v,sizeof(v),true);
        for i:=1 to n do
          for j:=1 to n do begin
              read(k);
              g[i,j]:=k;
          end;
        for i:=1 to n do
          for j:=1 to n do
            if (i<>j) and (v[i,j]) then begin
                v[j,i]:=false;
                ok:=false;
                if g[i,j]>1 then
                  for k:=1 to n do
                    if (k<>i) and (k<>j) then
                      if g[i,j]=g[i,k]+g[k,j] then begin
                          ok:=true;
                          break;
                      end;
                if not ok then writeln(i,' ',j);
            end;
    end;
end.
