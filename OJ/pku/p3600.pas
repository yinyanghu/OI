program p3600;
const maxn=20;
var a,b:array[1..maxn,1..maxn] of boolean;
    column:array[1..maxn] of boolean;
    i,j,ac,bc,ar,br,deltac:longint;
    ch:char;
function check:boolean;
 var i,x,y,j:longint;
     flag:boolean;
 begin
     x:=1;
     for i:=1 to br do begin
         y:=0; flag:=true;
     	for j:=1 to bc do
             if column[j] then begin
                 inc(y);
                 if b[i,j]<>a[x,y] then begin
                     flag:=false;
                     break;
                 end;
             end;
         if flag then
            if x=ar then exit(true) else inc(x);
     end;
     check:=false;
 end;
procedure dfsc(x,k:longint);
 var i:longint;
 begin
     if x>deltac then begin
         if check then begin
             writeln('Yes');
             halt;
         end;
         exit;
     end;
     for i:=k to bc do
     	if column[i] then begin
             column[i]:=false;
             dfsc(x+1,i+1);
             column[i]:=true;
         end;
 end;
 
begin
    readln(ar,ac);
    for i:=1 to ar do begin
        for j:=1 to ac do begin
            read(ch);
            a[i,j]:=ch='1';
        end;
        readln;
    end;
    readln(br,bc);
    for i:=1 to br do begin
        for j:=1 to bc do begin
            read(ch);
            b[i,j]:=ch='1';
        end;
        readln;
    end;
    if (ar>br) or (ac>bc) then begin
        writeln('No');
        halt;
    end;
    fillchar(column,sizeof(column),true);
    deltac:=bc-ac;
    dfsc(1,1);
    writeln('No');
end.