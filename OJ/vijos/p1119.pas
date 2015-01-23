program p1119;
var g:array[0..500,0..500] of extended;
    x,y:array[0..500] of longint;
    s:array[1..3] of longint;
    n,a,b:longint;
    min:extended;

procedure swap(var a,b:longint);
 var temp:longint;
 begin
     temp:=a; a:=b; b:=temp;
 end;

procedure init;
 var i,j,k,l,t,ta:longint;
 begin
     readln(n,ta,a,b);
     for i:=1 to 4*n do
       for j:=1 to 4*n do
         g[i,j]:=maxlongint;
     for i:=1 to n do begin
         for j:=1 to 3 do read(x[j],y[j]);
         readln(t);
         s[3]:=sqr(x[1]-x[2])+sqr(y[1]-y[2]);
         s[1]:=sqr(x[2]-x[3])+sqr(y[2]-y[3]);
         s[2]:=sqr(x[3]-x[1])+sqr(y[3]-y[1]);
         if s[3]=s[1]+s[2] then begin 
	    swap(x[1],x[3]); swap(y[1],y[3]); 
	 end else
           if s[2]=s[1]+s[3] then begin 
	       swap(x[1],x[2]); swap(y[1],y[2]); 
	   end;              
         x[4]:=x[2]+x[3]-x[1];
         y[4]:=y[2]+y[3]-y[1];                               
         for j:=1 to 4 do begin 
	     x[i*4+j]:=x[j]; 
	     y[i*4+j]:=y[j]; 
	 end;
         for j:=1 to 4 do                                                            
            for l:=j to 4 do begin
                g[(i-1)*4+j,(i-1)*4+l]:=sqrt(sqr(x[j]-x[l])+sqr(y[j]-y[l]))*t;
                g[(i-1)*4+l,(i-1)*4+j]:=g[(i-1)*4+j,(i-1)*4+l];
            end;
         for j:=1 to i-1 do                                                               
            for l:=1 to 4 do
               for k:=1 to 4 do begin
                   g[(i-1)*4+l,(j-1)*4+k]:=sqrt(sqr(x[i*4+l]-x[j*4+k])+sqr(y[i*4+l]-y[j*4+k]))*ta;
                   g[(j-1)*4+k,(i-1)*4+l]:=g[(i-1)*4+l,(j-1)*4+k];
               end;
     end;
 end;

procedure floyd;
 var i,j,k:longint;
 begin
     for k:=1 to 4*n do                       
       for i:=1 to 4*n do
         for j:=1 to 4*n do
            if g[i,k]+g[k,j]<g[i,j] then g[i,j]:=g[i,k]+g[k,j];
     min:=maxlongint;
     for i:=1 to 4 do                           
       for j:=1 to 4 do
         if g[(a-1)*4+i,(b-1)*4+j]<min then min:=g[(a-1)*4+i,(b-1)*4+j];
     writeln(min:0:2);
 end;

begin
    init;
    floyd;
end.
