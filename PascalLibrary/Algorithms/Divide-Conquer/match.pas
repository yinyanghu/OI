program match;
var a:array[0..100,0..100] of longint;
    i,j,k,n:longint;
procedure arrange(k,n:longint);
 var i,j:longint;
 begin
     if (n=2) then begin
        a[k,0]:=k;
        a[k,1]:=k+1;
        a[k+1,0]:=k+1;
        a[k+1,1]:=k;
     end else begin
         arrange(k,n div 2);
         arrange(k+n div 2,n div 2);
         for i:=k to k+(n div 2)-1 do
           for j:=(n div 2) to n-1 do
             a[i,j]:=a[i+(n div 2),j-(n div 2)];
         for i:=k+(n div 2) to k+n-1 do
           for j:=(n div 2) to n-1 do
             a[i,j]:=a[i-(n div 2),j-(n div 2)];
     end;
 end;

procedure print;
 var i,j:longint;
     b:array[0..1000] of boolean;
 begin
     writeln('The result=');
     for j:=1 to n-1 do begin
         i:=1;
         fillchar(b,sizeof(b),true);
         while i<=n do begin
             if b[i] then begin
                 write(i,'-->',a[i,j]:1,'':7);
                 b[a[i,j]]:=false;
             end;
             inc(i);
         end;
         writeln;
     end;
     writeln('a:');
     for i:=1 to n do begin
         for j:=1 to n do write(a[i,j]:2);
         writeln;
     end;
 end;

begin
    fillchar(a,sizeof(a),0);
    readln(n);
    arrange(1,n);
    print;
    readln;
end.