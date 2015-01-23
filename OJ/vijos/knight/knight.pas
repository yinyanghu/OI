program knight;

const dx:array[1..2] of 0..1=(1,0);
      dy:array[1..2] of 0..1=(0,1);
      hx:array[1..8] of -2..2=(1,2,2,1,-1,-2,-2,-1);
      hy:array[1..8] of -2..2=(2,1,-1,-2,-2,-1,1,2);

var h:array[0..100,0..100] of boolean;
    m,n,a,b:integer;
    total:longint;

procedure init;
 var i,j,x1,y1:integer;
 begin
     assign(input,'knight.in'); reset(input);
     read(n,m,a,b);
     close(input);
     fillchar(h,sizeof(h),true);
     for i:=0 to 100 do
       for j:=0 to 100 do
         if (i>n) or (j>m) then h[i,j]:=false;
     h[0,0]:=false;
     h[a,b]:=false;
     for i:=1 to 8 do begin
         x1:=a+hx[i];
         y1:=b+hy[i];
         h[x1,y1]:=false;
     end;
     total:=0;
 end;

procedure try(x,y:integer;k:integer);
 var x1,y1,i,j:integer;
 begin
     for i:=1 to 2 do begin
         x1:=dx[i]+x;
         y1:=dy[i]+y;
         if (h[x1,y1]=true) then begin
             h[x1,y1]:=false;
             if (x1=n) and (y1=m) then inc(total)
               else if (k<m*n) then try(x1,y1,k+1);
             h[x1,y1]:=true;
         end;
     end;
 end;

procedure print;
 begin
     assign(output,'knight.out'); rewrite(output);
     writeln(total);
     close(output);
 end;

begin
    init;
    try(0,0,2);
    print;
end.
