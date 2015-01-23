program fan;
type arr=array[1..200] of byte;
var a,b:arr;
    n,r:byte;

procedure init;
 begin
     assign(input,'fan.in'); reset(input);
     readln(n);
     close(input);
     r:=n*(n-1)+1;
     fillchar(a,sizeof(a),0);
     fillchar(b,sizeof(b),0);
     a[1]:=1; b[1]:=1;
     assign(output,'fan.out'); rewrite(output);
     writeln(r)
 end;

procedure print;
 var i:byte;
 begin
     for i:=1 to n-1 do write(a[i],' ');
     writeln(a[n]);
 end;

function check:boolean;
 var i,j,k:byte;
     t:array[1..255] of 0..1;
 begin
     check:=true;
     fillchar(t,sizeof(t),0);
     for i:=1 to n do begin
         k:=a[i]; t[k]:=1;
         for j:=1 to n-1 do begin
             if i+j<=n then k:=k+a[i+j] else k:=k+a[i+j-n];
             t[k]:=1;
         end;
     end;
     for i:=1 to r do if t[i]=0 then begin
         check:=false;
         break;
     end;
 end;

procedure fill(m:byte);
 var x,y,z:byte;
 begin
     y:=r;
     for x:=1 to m-1 do y:=y-a[x];
     for x:=2 to y do
       if b[x]=0 then begin
           a[m]:=x; b[x]:=1;
           if m=n then if check then print else
              else fill(m+1);
           b[x]:=0;
       end;
 end;

begin
    init;
    fill(2);
    close(output);
end.
