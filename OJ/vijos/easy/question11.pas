program question11;
const maxn=10;
      maxm=1000;
var a:array[0..maxn-1] of boolean;
    i,j,k,m,n:longint;
begin
    fillchar(a,sizeof(a),true);
    k:=0;
    a[0]:=false;
    for i:=2 to maxm do begin
        k:=k+i;
        m:=k mod maxn;
        a[m]:=false;
    end;
    for i:=0 to maxn-1 do if a[i] then writeln(i+1);
end.
