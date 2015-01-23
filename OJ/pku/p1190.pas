program p1297;
var s,m,n,min,v,z3:longint;
    z1,z2:array[0..20] of longint;

procedure init;
 var i:longint;
 begin
     min:=maxlongint;
     z1[0]:=0;
     for i:=1 to m do
       z1[i]:=z1[i-1]+i*i*i;
     z2[0]:=0;
     for i:=1 to m do
       z2[i]:=z2[i-1]+2*i*i;
 end;

procedure search(r,h,k:longint);
 var i,j,th,tr,tk:longint;
 begin
     if k=m+1 then begin
         if (v=n) and (s<min) then min:=s;
         exit;
     end;
     if z1[m-k]+v>n then exit;
     if z2[m-k]+s>min then exit;
     z3:=0; tk:=m-k+1; th:=h; tr:=r;
     while tk>0 do begin
         z3:=z3+tr*tr*th;
         dec(tr); dec(th); dec(tk);
     end;
     if z3+v<n then exit;
     for i:=r-1 downto m-k+1 do
        for j:=h-1 downto m-k+1 do begin
            if k=1 then s:=i*i;
            s:=s+2*i*j;
            v:=v+i*i*j;
            if v<=n then search(i,j,k+1);
            s:=s-2*i*j;
            v:=v-i*i*j;
        end;
 end;


begin
    readln(n);
    readln(m);
    init;
    search(trunc(sqrt(n)),trunc(sqrt(n)),1);
    if min=maxlongint then min:=0;
    writeln(min);
end.