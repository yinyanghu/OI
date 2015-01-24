program knight;
const dx:array[1..8] of -2..2=(1,2,2,1,-1,-2,-2,-1);
      dy:array[1..8] of -2..2=(-2,-1,1,2,2,1,-1,-2);
var h:array[-100..100,-100..100] of integer;
    a,b,n:integer;
    total:longint;

procedure print;
 var i,j:integer;
 begin
     inc(total);
     writeln(total,'.*************************');
     for i:=1 to n do begin
         for j:=1 to n do write(h[i,j]:4);
         writeln;
     end;
     writeln;
 end;

procedure try(x,y:integer;k:integer);
 var x1,y1,i,j:integer;
 begin
     for i:=1 to 8 do begin
         x1:=dx[i]+x;
         y1:=dy[i]+y;
         if (h[x1,y1]=0) then begin
             h[x1,y1]:=k;
             if (k<n*n) then try(x1,y1,k+1)
                else print;
             h[x1,y1]:=0;
         end;
     end;
 end;

procedure ok;
 var i,j:integer;
 begin
     fillchar(h,sizeof(h),0);
     total:=0;
     for i:=-100 to 100 do
       for j:=-100 to 100 do
       if (i<=n) and (i>0) and (j<=n) and (j>0) then h[i,j]:=0
          else h[i,j]:=1;
 end;
procedure input;
 begin
     writeln('***************************************************');
     writeln('Knight Tours--------->n=');
     readln(n);
     if (n>=70) then begin
         writeln('N is too large!');
         readln;
         halt;
     end;
     writeln('Enter knight x,y=');
     readln(a,b);
     if (a>n) or (b>n) then begin
         writeln('Impossible!');
         readln;
         halt;
     end;
 end;
begin
    input;
    ok;
    h[a,b]:=1;
    try(a,b,2);
    if (total=0) then writeln('No answer!') else writeln('Total=',total);
    readln;
end.